#!/usr/bin/env bash
#
# new-post.sh — publish a draft into the Jekyll blog, with assets to blog-assets.
#
# Takes a draft markdown file with a light front matter block and local image
# paths, then:
#   1. copies every referenced local asset into blog-assets/{images,files}/YYYY/MM/
#   2. rewrites the references in the body to the jsDelivr CDN URLs
#   3. writes _posts/YYYY-MM-DD-<slug>.md with the full front matter this repo uses
#   4. commits + pushes blog-assets and moves the `v1` tag the CDN URLs are pinned to
#   5. commits the post here, and asks before pushing (the push deploys the site)
#
# Usage:
#   scripts/new-post.sh draft.md
#   scripts/new-post.sh --date 2026-09-01 --dry-run draft.md
#
# Draft format — front matter keys are `title` (required), `description`,
# `tags` (inline list or YAML block), `image`, `date`, `slug`:
#
#   ---
#   title: My New Post
#   description: A short summary.
#   tags: [kubernetes, agentic]
#   image: ./img/cover.png
#   ---
#
#   Body text.
#
#   ![Diagram](./img/diagram.png)
#   ![Photo](~/Desktop/IMG_1234.jpeg)
#
# Local paths (relative to the draft, absolute, or ~-prefixed) are copied and
# rewritten. Paths that are already http(s) URLs are left untouched.

set -euo pipefail

# ---------------------------------------------------------------------------
# Configuration
# ---------------------------------------------------------------------------

BLOG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
ASSETS_DIR="${BLOG_ASSETS_DIR:-$(cd "$BLOG_DIR/.." && pwd)/blog-assets}"

# Every image URL in _posts is pinned to this tag, so the tag has to be moved
# forward each time assets are added or the CDN will not serve the new files.
CDN_TAG="v1"
CDN_BASE="https://cdn.jsdelivr.net/gh/salaboy/blog-assets@${CDN_TAG}"
SITE_URL="https://www.salaboy.com"

# Extensions that go to images/ rather than files/.
IMAGE_EXTS="png|jpg|jpeg|gif|webp|svg|avif|bmp|tif|tiff"

# ---------------------------------------------------------------------------
# Output helpers
# ---------------------------------------------------------------------------

if [[ -t 1 ]]; then
  BOLD=$'\033[1m'; DIM=$'\033[2m'; RED=$'\033[31m'
  GREEN=$'\033[32m'; YELLOW=$'\033[33m'; RESET=$'\033[0m'
else
  BOLD=""; DIM=""; RED=""; GREEN=""; YELLOW=""; RESET=""
fi

info()  { printf '%s\n' "$*"; }
step()  { printf '%s==>%s %s\n' "$BOLD" "$RESET" "$*"; }
ok()    { printf '  %s✓%s %s\n' "$GREEN" "$RESET" "$*"; }
warn()  { printf '  %s!%s %s\n' "$YELLOW" "$RESET" "$*" >&2; }
die()   { printf '%serror:%s %s\n' "$RED" "$RESET" "$*" >&2; exit 1; }

# ---------------------------------------------------------------------------
# Argument parsing
# ---------------------------------------------------------------------------

DRAFT=""
DRY_RUN=0
OVERRIDE_DATE=""
OVERRIDE_SLUG=""
SKIP_ASSET_PUSH=0

usage() {
  sed -n '3,40p' "${BASH_SOURCE[0]}" | sed 's/^# \{0,1\}//'
  exit "${1:-0}"
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    -h|--help)      usage 0 ;;
    -n|--dry-run)   DRY_RUN=1; shift ;;
    --date)         OVERRIDE_DATE="${2:-}"; shift 2 ;;
    --slug)         OVERRIDE_SLUG="${2:-}"; shift 2 ;;
    --no-asset-push) SKIP_ASSET_PUSH=1; shift ;;
    -*)             die "unknown option: $1 (try --help)" ;;
    *)
      [[ -n "$DRAFT" ]] && die "only one draft file can be given"
      DRAFT="$1"; shift ;;
  esac
done

[[ -n "$DRAFT" ]] || usage 1
[[ -f "$DRAFT" ]] || die "draft not found: $DRAFT"

DRAFT="$(cd "$(dirname "$DRAFT")" && pwd)/$(basename "$DRAFT")"
DRAFT_DIR="$(dirname "$DRAFT")"

command -v python3 >/dev/null || die "python3 is required (used for YAML-safe parsing and slugify)"
[[ -d "$ASSETS_DIR/.git" ]] || die "blog-assets checkout not found at $ASSETS_DIR
Set BLOG_ASSETS_DIR to override, e.g. BLOG_ASSETS_DIR=~/code/salaboy/blog-assets $0 ..."

# ---------------------------------------------------------------------------
# Parse the draft
#
# Python does the parsing: front matter values need YAML-correct quoting and
# unicode-aware slugify, which is genuinely painful in pure shell. The rest of
# the script (file copying, git) stays shell.
# ---------------------------------------------------------------------------

step "Reading draft ${DIM}${DRAFT}${RESET}"

PARSED="$(python3 - "$DRAFT" "$OVERRIDE_DATE" "$OVERRIDE_SLUG" <<'PYEOF'
import os, re, sys, unicodedata, datetime, shlex

draft, override_date, override_slug = sys.argv[1], sys.argv[2], sys.argv[3]
raw = open(draft, encoding="utf-8").read()

# Split optional front matter from the body.
m = re.match(r"^---\s*\n(.*?)\n---\s*\n?(.*)$", raw, re.S)
if not m:
    sys.exit("draft has no `---` front matter block")
fm_text, body = m.group(1), m.group(2)

# Minimal YAML reader: `key: value`, inline [a, b] lists, and `-` block lists.
# Enough for the handful of keys a draft carries, without a yaml dependency.
fm, key, order = {}, None, []
for line in fm_text.split("\n"):
    if not line.strip() or line.lstrip().startswith("#"):
        continue
    if re.match(r"^\s+-\s", line):
        if key:
            fm.setdefault(key, [])
            if not isinstance(fm[key], list):
                fm[key] = []
            fm[key].append(line.strip()[1:].strip().strip("\"'"))
        continue
    km = re.match(r"^([A-Za-z_][\w-]*)\s*:\s*(.*)$", line)
    if not km:
        continue
    key, val = km.group(1).lower(), km.group(2).strip()
    if key not in order:
        order.append(key)
    if val.startswith("[") and val.endswith("]"):
        fm[key] = [v.strip().strip("\"'") for v in val[1:-1].split(",") if v.strip()]
    elif val == "":
        fm[key] = []
    else:
        fm[key] = val.strip("\"'") if (val[0] in "\"'" and val[0] == val[-1]) else val

title = (fm.get("title") or "").strip()
if not title or isinstance(title, list):
    sys.exit("draft front matter needs a non-empty `title`")

# Date: --date wins, then front matter, then now. Time defaults to now so posts
# written on the same day still order correctly.
#
# UTC, not local time: every post in this repo stamps its date with a `+0000`
# offset, so a local wall-clock reading would be mislabelled. During BST that
# puts the post an hour into the future, and Jekyll silently skips future-dated
# posts — the post would build to nothing with no error.
now = datetime.datetime.now(datetime.timezone.utc).replace(tzinfo=None)
def parse_date(s):
    s = s.strip()
    for f in ("%Y-%m-%d %H:%M:%S", "%Y-%m-%dT%H:%M:%S", "%Y-%m-%d"):
        try:
            d = datetime.datetime.strptime(s.replace("+0000", "").strip(), f)
            return d.replace(hour=now.hour, minute=now.minute, second=now.second) \
                   if f == "%Y-%m-%d" else d
        except ValueError:
            pass
    sys.exit(f"could not parse date: {s!r} (want YYYY-MM-DD or YYYY-MM-DD HH:MM:SS)")

date = parse_date(override_date) if override_date else (
       parse_date(str(fm["date"])) if fm.get("date") else now)

# Slug: strip accents, drop everything that is not a-z0-9, collapse to hyphens.
# Matches the existing corpus, where every filename is ^[a-z0-9-]+$.
def slugify(s):
    s = unicodedata.normalize("NFKD", s)
    s = "".join(c for c in s if not unicodedata.combining(c))
    s = s.encode("ascii", "ignore").decode("ascii").lower()
    s = re.sub(r"[^a-z0-9]+", "-", s)
    return re.sub(r"-{2,}", "-", s).strip("-")

slug = slugify(override_slug or fm.get("slug") or title)
if not slug:
    sys.exit(f"title {title!r} produced an empty slug; pass --slug explicitly")

def emit(k, v):
    print(f"{k}={shlex.quote(str(v))}")

emit("TITLE", title)
emit("SLUG", slug)
emit("DATE_YMD", date.strftime("%Y-%m-%d"))
emit("DATE_Y", date.strftime("%Y"))
emit("DATE_M", date.strftime("%m"))
emit("DATE_D", date.strftime("%d"))
emit("DATE_FULL", date.strftime("%Y-%m-%d %H:%M:%S +0000"))
emit("DESCRIPTION", fm.get("description") or "")
emit("HERO", fm.get("image") or "")

tags = fm.get("tags") or []
if isinstance(tags, str):
    tags = [t.strip() for t in tags.split(",") if t.strip()]
# The year is a conventional tag in recent posts; add it if not already there.
year = date.strftime("%Y")
if year not in tags:
    tags.append(year)
emit("TAGS_JOINED", "\x1f".join(tags))

# Hand the body off through a temp file: it contains newlines and arbitrary text.
tmp = draft + ".body.tmp"
open(tmp, "w", encoding="utf-8").write(body)
emit("BODY_TMP", tmp)
PYEOF
)" || die "failed to parse draft"

eval "$PARSED"

POST_FILE="$BLOG_DIR/_posts/${DATE_YMD}-${SLUG}.md"
PERMALINK="/${DATE_Y}/${DATE_M}/${DATE_D}/${SLUG}/"

ok "title: ${TITLE}"
ok "slug:  ${SLUG}"
ok "date:  ${DATE_FULL}"

if [[ -e "$POST_FILE" ]]; then
  rm -f "$BODY_TMP"
  die "post already exists: ${POST_FILE#$BLOG_DIR/}
Pass --slug to choose a different one."
fi

# ---------------------------------------------------------------------------
# Collect and copy assets
#
# Scans the body plus the hero image for local paths, copies each into
# blog-assets under images|files/YYYY/MM/, and records the CDN URL to swap in.
# ---------------------------------------------------------------------------

step "Collecting assets"

REL_IMG_DIR="images/${DATE_Y}/${DATE_M}"
REL_FILE_DIR="files/${DATE_Y}/${DATE_M}"

# Parallel arrays: local source path -> CDN url, for the rewrite pass.
declare -a SRC_PATHS=() CDN_URLS=() COPIED=()

resolve_path() {
  # Expand ~, then resolve relative paths against the draft's directory.
  local p="$1"
  [[ "$p" == "~"* ]] && p="${HOME}${p#\~}"
  [[ "$p" != /* ]] && p="$DRAFT_DIR/$p"
  printf '%s' "$p"
}

# register_asset sets ASSET_URL rather than echoing it. It appends to the
# SRC_PATHS/CDN_URLS/COPIED arrays, so it must never be called inside a command
# substitution — a subshell would discard those appends and the asset would be
# referenced in the post but never copied or committed.
ASSET_URL=""

register_asset() {
  # Copies one local asset into blog-assets and sets ASSET_URL to its CDN URL.
  # Returns 1 (leaving ASSET_URL empty) if the reference is not a local file.
  local ref="$1" src base ext sub dest url i
  ASSET_URL=""

  # Already a URL, a fragment, or a site-relative link: leave it alone.
  [[ "$ref" =~ ^(https?:)?// ]] && return 1
  [[ "$ref" =~ ^(#|mailto:|data:) ]] && return 1
  [[ "$ref" == /* && ! -e "$ref" ]] && return 1

  src="$(resolve_path "$ref")"
  [[ -f "$src" ]] || { warn "referenced file not found, left as-is: $ref"; return 1; }

  # Already registered in this run? Reuse the same URL.
  for i in "${!SRC_PATHS[@]}"; do
    if [[ "${SRC_PATHS[$i]}" == "$src" ]]; then
      ASSET_URL="${CDN_URLS[$i]}"
      return 0
    fi
  done

  base="$(basename "$src")"
  ext="${base##*.}"
  if [[ "$(printf '%s' "$ext" | tr '[:upper:]' '[:lower:]')" =~ ^($IMAGE_EXTS)$ ]]; then
    sub="$REL_IMG_DIR"
  else
    sub="$REL_FILE_DIR"
  fi

  # Never silently overwrite an existing asset — suffix instead, the way the
  # migrated corpus already does (IMG_8836-1.jpg).
  local stem="${base%.*}" candidate="$base" n=1
  while [[ -e "$ASSETS_DIR/$sub/$candidate" ]]; do
    if cmp -s "$src" "$ASSETS_DIR/$sub/$candidate"; then
      break                       # identical file already there, reuse it
    fi
    candidate="${stem}-${n}.${ext}"
    n=$((n + 1))
  done

  dest="$ASSETS_DIR/$sub/$candidate"
  url="${CDN_BASE}/${sub}/${candidate}"

  if [[ $DRY_RUN -eq 0 ]]; then
    mkdir -p "$(dirname "$dest")"
    [[ -e "$dest" ]] || cp "$src" "$dest"
  fi

  SRC_PATHS+=("$src")
  CDN_URLS+=("$url")
  COPIED+=("$sub/$candidate")
  ASSET_URL="$url"
}

# Hero image from front matter.
HERO_URL=""
if [[ -n "$HERO" ]]; then
  if [[ "$HERO" =~ ^https?:// ]]; then
    HERO_URL="$HERO"
  else
    register_asset "$HERO" || {
      rm -f "$BODY_TMP"
      die "hero image not found: $HERO"
    }
    HERO_URL="$ASSET_URL"
  fi
fi

# Body references: markdown ![alt](path) and [text](path), plus <img src="...">.
# Extract every candidate target, then filter to local files.
mapfile -t REFS < <(
  python3 - "$BODY_TMP" <<'PYEOF'
import re, sys
body = open(sys.argv[1], encoding="utf-8").read()
seen, out = set(), []
for pat in (r"!\[[^\]]*\]\(\s*([^)\s]+)",      # ![alt](path)
            r"(?<!!)\[[^\]]*\]\(\s*([^)\s]+)",  # [text](path)
            r"<img[^>]+src=[\"']([^\"']+)[\"']",
            r"<a[^>]+href=[\"']([^\"']+)[\"']"):
    for mm in re.finditer(pat, body):
        ref = mm.group(1).strip()
        if ref and ref not in seen:
            seen.add(ref)
            out.append(ref)
print("\n".join(out))
PYEOF
)

for ref in "${REFS[@]}"; do
  [[ -n "$ref" ]] || continue
  register_asset "$ref" || true
done

if [[ ${#COPIED[@]} -eq 0 ]]; then
  info "  ${DIM}no local assets referenced${RESET}"
else
  for c in "${COPIED[@]}"; do ok "$c"; done
fi

# ---------------------------------------------------------------------------
# Rewrite the body and assemble the post
# ---------------------------------------------------------------------------

step "Writing post"

BODY_REWRITTEN="$(
  python3 - "$BODY_TMP" <<'PYEOF' "${SRC_PATHS[@]+"${SRC_PATHS[@]}"}" --urls "${CDN_URLS[@]+"${CDN_URLS[@]}"}"
import os, re, sys
body = open(sys.argv[1], encoding="utf-8").read()
rest = sys.argv[2:]
split = rest.index("--urls") if "--urls" in rest else 0
srcs, urls = rest[:split], rest[split + 1:]

# Map every spelling of each local path (as-written, absolute, basename) to the
# CDN URL, longest first so a path is never partially replaced.
mapping = {}
for src, url in zip(srcs, urls):
    mapping[src] = url
    mapping[os.path.basename(src)] = url

def swap(match):
    prefix, ref, suffix = match.group(1), match.group(2).strip(), match.group(3)
    if re.match(r"^(https?:)?//|^#|^mailto:|^data:", ref):
        return match.group(0)
    key = os.path.expanduser(ref)
    for cand in (key, os.path.abspath(key), os.path.basename(key)):
        if cand in mapping:
            return f"{prefix}{mapping[cand]}{suffix}"
    return match.group(0)

body = re.sub(r"(\]\(\s*)([^)\s]+)(\s*\))", swap, body)
body = re.sub(r"(<img[^>]+src=[\"'])([^\"']+)([\"'])", swap, body)
body = re.sub(r"(<a[^>]+href=[\"'])([^\"']+)([\"'])", swap, body)

sys.stdout.write(body.strip() + "\n")
PYEOF
)"

# Escape a value for a double-quoted YAML scalar.
yq() { printf '%s' "$1" | sed -e 's/\\/\\\\/g' -e 's/"/\\"/g'; }

{
  printf -- '---\n'
  printf 'title: "%s"\n' "$(yq "$TITLE")"
  printf 'date: %s\n' "$DATE_FULL"
  printf 'permalink: %s\n' "$PERMALINK"
  [[ -n "$DESCRIPTION" ]] && printf 'description: "%s"\n' "$(yq "$DESCRIPTION")"
  [[ -n "$HERO_URL"    ]] && printf 'image: %s\n' "$HERO_URL"
  if [[ -n "$TAGS_JOINED" ]]; then
    printf 'tags:\n'
    while IFS= read -r -d $'\x1f' tag || [[ -n "$tag" ]]; do
      [[ -n "$tag" ]] && printf '  - "%s"\n' "$(yq "$tag")"
    done < <(printf '%s\x1f' "$TAGS_JOINED")
  fi
  printf 'original_url: %s%s\n' "$SITE_URL" "$PERMALINK"
  printf -- '---\n\n'
  printf '%s' "$BODY_REWRITTEN"
} > "${POST_FILE}.tmp"

rm -f "$BODY_TMP"

if [[ $DRY_RUN -eq 1 ]]; then
  step "Dry run — nothing was written or committed"
  info ""
  info "${DIM}would write ${POST_FILE#$BLOG_DIR/}:${RESET}"
  info ""
  sed -n '1,40p' "${POST_FILE}.tmp" | sed 's/^/  /'
  info ""
  if [[ ${#COPIED[@]} -gt 0 ]]; then
    info "${DIM}would copy into ${ASSETS_DIR}:${RESET}"
    for c in "${COPIED[@]}"; do info "  $c"; done
  fi
  rm -f "${POST_FILE}.tmp"
  exit 0
fi

mv "${POST_FILE}.tmp" "$POST_FILE"
ok "${POST_FILE#$BLOG_DIR/}"

# ---------------------------------------------------------------------------
# Commit assets, and move the CDN tag
#
# The `v1` tag is what every CDN URL in _posts is pinned to. New files are not
# reachable until the tag is moved forward, so this is not optional.
# ---------------------------------------------------------------------------

if [[ ${#COPIED[@]} -gt 0 && $SKIP_ASSET_PUSH -eq 0 ]]; then
  step "Publishing assets to blog-assets"

  git -C "$ASSETS_DIR" add -- "$REL_IMG_DIR" "$REL_FILE_DIR" 2>/dev/null || true

  if git -C "$ASSETS_DIR" diff --cached --quiet; then
    info "  ${DIM}assets already committed, nothing new${RESET}"
  else
    git -C "$ASSETS_DIR" commit -q -m "Add assets for ${DATE_YMD}-${SLUG}"
    ok "committed $(git -C "$ASSETS_DIR" rev-parse --short HEAD)"

    branch="$(git -C "$ASSETS_DIR" branch --show-current)"
    git -C "$ASSETS_DIR" push -q origin "$branch"
    ok "pushed to origin/$branch"
  fi

  # Move v1 to the current commit so jsDelivr serves the new files. No -m: the
  # existing tag is lightweight, and -m would silently convert it to annotated.
  git -C "$ASSETS_DIR" tag -f "$CDN_TAG" >/dev/null
  git -C "$ASSETS_DIR" push -q --force origin "refs/tags/$CDN_TAG"
  ok "moved tag $CDN_TAG -> $(git -C "$ASSETS_DIR" rev-parse --short HEAD)"

  info "  ${DIM}jsDelivr caches tags; new URLs may take a few minutes to resolve${RESET}"
elif [[ ${#COPIED[@]} -gt 0 ]]; then
  warn "--no-asset-push: assets copied but NOT committed or tagged"
  warn "the CDN will 404 for them until you push and move the $CDN_TAG tag"
fi

# ---------------------------------------------------------------------------
# Commit the post, and confirm before deploying
# ---------------------------------------------------------------------------

step "Committing post"

git -C "$BLOG_DIR" add -- "$POST_FILE"
git -C "$BLOG_DIR" commit -q -m "Add post: ${TITLE}"
ok "committed $(git -C "$BLOG_DIR" rev-parse --short HEAD)"

info ""
info "  ${BOLD}${TITLE}${RESET}"
info "  ${SITE_URL}${PERMALINK}"
info ""

# Pushing here triggers the Pages workflow and puts the post live, so it is the
# one step that always asks.
branch="$(git -C "$BLOG_DIR" branch --show-current)"
if [[ ! -t 0 ]]; then
  info "Not a terminal — skipping push. Run: git push origin $branch"
  exit 0
fi

read -r -p "Push to origin/$branch and deploy the site? [y/N] " reply
if [[ "$reply" =~ ^[Yy]$ ]]; then
  git -C "$BLOG_DIR" push -q origin "$branch"
  ok "pushed — GitHub Actions is building the site"
else
  info "Not pushed. When ready: git push origin $branch"
fi
