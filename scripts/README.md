# scripts/

## `new-post.sh`

Publishes a draft into `_posts/`, and its images and files into the
[`blog-assets`](https://github.com/salaboy/blog-assets) repo that backs the CDN.

```sh
scripts/new-post.sh draft.md
scripts/new-post.sh --dry-run draft.md      # show what would happen, change nothing
```

### Draft format

Front matter needs only a `title`; everything else is optional.

```markdown
---
title: My New Post
description: A one-line summary, used for SEO and the post listings.
tags: [kubernetes, agentic, platform engineering]
image: ./img/cover.png
---

Body text here.

![A diagram](./img/diagram.png)

Slides: [download the PDF](~/Desktop/slides.pdf)
```

Local paths — relative to the draft, absolute, or `~`-prefixed — are copied to
`blog-assets` and rewritten to CDN URLs. Anything already an `http(s)` URL, a
site-relative link like `/2026/06/08/some-post/`, or an anchor is left alone.

Images (`png jpg jpeg gif webp svg avif bmp tif tiff`) go to
`images/YYYY/MM/`; everything else goes to `files/YYYY/MM/`.

### What it generates

The front matter this repo uses, in the order the existing 542 posts use it:

```yaml
---
title: "My New Post"
date: 2026-08-29 12:09:30 +0000
permalink: /2026/08/29/my-new-post/
description: "A one-line summary, used for SEO and the post listings."
image: https://cdn.jsdelivr.net/gh/salaboy/blog-assets@v1/images/2026/08/cover.png
tags:
  - "kubernetes"
  - "agentic"
  - "platform engineering"
  - "2026"
original_url: https://www.salaboy.com/2026/08/29/my-new-post/
---
```

The slug is derived from the title (accents stripped, lowercased, non-alphanumerics
collapsed to hyphens) and is shared by the filename, the `permalink`, and the
`original_url`. The post's year is appended as a tag, matching recent posts.
No `layout:` — it comes from the `defaults:` block in `_config.yml`.

### What it does with git

| Repo | Action |
|---|---|
| `blog-assets` | commits, pushes, and **moves the `v1` tag** |
| `blog` | commits the post, then **asks** before pushing |

Moving the `v1` tag matters: every image URL in `_posts` is pinned to
`blog-assets@v1`, so files pushed to `main` are not served by jsDelivr until
the tag points at them. Allow a few minutes for the CDN cache to catch up.

The push of this repo is what deploys the site, so it is always confirmed
interactively. When stdin is not a terminal the script stops and prints the
command instead.

### Options

| Flag | Effect |
|---|---|
| `-n`, `--dry-run` | Print the post and asset list; write and commit nothing |
| `--date YYYY-MM-DD` | Override the date (`YYYY-MM-DD HH:MM:SS` also accepted) |
| `--slug my-slug` | Override the derived slug |
| `--no-asset-push` | Copy assets but do not commit, push, or move the tag |
| `-h`, `--help` | Usage |

`BLOG_ASSETS_DIR` overrides where the `blog-assets` checkout is found; it
defaults to `../blog-assets` next to this repo.

### Notes

- Dates are stamped in **UTC**, matching the `+0000` offset every post carries.
  Jekyll silently skips future-dated posts, so a local-time stamp during BST
  would make a new post build to nothing.
- The script refuses to overwrite an existing post — pass `--slug` for a
  variant, as some migrated posts already do (`...-2`).
- An asset whose name is already taken in that month is suffixed (`diagram-1.png`)
  rather than overwriting. An identical file is reused as-is.

### Verifying before you push

```sh
bundle exec jekyll build && bundle exec jekyll serve
```

Then open the permalink the script printed. If the page 404s, check that the
post's date is not in the future.
