#!/usr/bin/env bash
#
# serve.sh — build and serve the site locally in a container.
#
# The repo targets Ruby 3.3 (see .github/workflows), so `bundle exec jekyll
# serve` needs a matching toolchain. This runs the documented workflow inside
# the official ruby:3.3 image instead, so no system Ruby is required.
#
# Gems live in the `blog-gems` Docker volume rather than the working tree, so
# the repo stays clean and installs are cached between runs.
#
# Usage:
#   scripts/serve.sh              # serve on http://localhost:4000 with live reload
#   scripts/serve.sh build        # one-off build into _site/, no server
#
set -euo pipefail

cd "$(dirname "$0")/.."

MODE="${1:-serve}"
PORT="${PORT:-4000}"
IMAGE="ruby:3.3-slim"
VOLUME="blog-gems"

case "$MODE" in
  serve)
    # --force_polling: inotify does not fire through the osxfs/virtiofs mount,
    # so without it edits on the host never trigger a rebuild.
    CMD="bundle exec jekyll serve --host 0.0.0.0 --port ${PORT} --livereload --force_polling"
    PUBLISH=(-p "${PORT}:${PORT}" -p 35729:35729)
    ;;
  build)
    CMD="bundle exec jekyll build"
    PUBLISH=()
    ;;
  *)
    echo "usage: $0 [serve|build]" >&2
    exit 2
    ;;
esac

if ! docker info >/dev/null 2>&1; then
  echo "error: Docker is not running." >&2
  exit 1
fi

[ "$MODE" = "serve" ] && echo "==> http://localhost:${PORT} (first run installs gems, ~1 min)"

exec docker run --rm -it \
  -v "$PWD":/srv \
  -v "${VOLUME}":/gems \
  -w /srv \
  -e BUNDLE_PATH=/gems \
  "${PUBLISH[@]}" \
  "$IMAGE" \
  bash -lc "
    set -e
    command -v git >/dev/null || {
      apt-get update -qq >/dev/null && apt-get install -y -qq build-essential git >/dev/null
    }
    gem list -i bundler -v 4.0.19 >/dev/null 2>&1 || gem install bundler:4.0.19 --no-document -q
    bundle check >/dev/null 2>&1 || bundle install
    ${CMD}
  "
