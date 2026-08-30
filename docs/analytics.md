# Adding Google Analytics

The site is already wired for analytics — `_includes/head.html` includes the
tag on production builds when `site.google_analytics` is set. To switch it on
you create a GA4 property and add one line to `_config.yml`.

## Before you start

Minima ships a `google-analytics.html` include that uses `analytics.js` and
`ga('create', ...)`. That is **Universal Analytics, which stopped processing
data in July 2023** — left alone it would load a dead script and record
nothing. This repo overrides it with the current GA4 `gtag.js` tag in
`_includes/google-analytics.html`, so there is nothing to fix; just be aware
that guides written before 2023 (and the minima README) describe the old tag.

---

## 1. Create a GA4 property

1. Go to [analytics.google.com](https://analytics.google.com/) and sign in.
2. **Admin** (gear, bottom left) → **Create** → **Property**.
3. Name it (e.g. `salaboy.com`), set your timezone and currency, then **Next**.
4. Fill in the business details and **Create**, accepting the terms.

## 2. Add a web data stream

1. In the new property: **Admin** → **Data collection and modification** →
   **Data streams**.
2. **Add stream** → **Web**.
3. Website URL `https://www.salaboy.com`, stream name `salaboy.com`.
4. Leave **Enhanced measurement** on — it tracks scrolls, outbound clicks, and
   file downloads with no extra code, which is useful given how many posts link
   out to slides and PDFs.
5. **Create stream**.

## 3. Copy the Measurement ID

On the stream details page, top right, you will see the **Measurement ID** in
the form `G-XXXXXXXXXX`.

Copy that. It must start with `G-`. If you find an ID starting with `UA-`, that
is an old Universal Analytics property and will not work.

> The Measurement ID is not a secret — it ships in the HTML of every page. It
> does not need to go in a GitHub secret.

## 4. Add it to `_config.yml`

Add one line at the end of the config:

```yaml
google_analytics: G-XXXXXXXXXX
```

Commit and push:

```sh
git add _config.yml
git commit -m "Enable Google Analytics"
git push
```

The Pages workflow builds with `JEKYLL_ENV: production`, which is the condition
that switches the tag on. Give it a couple of minutes to deploy.

## 5. Verify it is working

**In the built HTML** — visit `https://www.salaboy.com`, view source, and
search for `googletagmanager`. You should see:

```html
<!-- Google tag (gtag.js) -->
<script async src="https://www.googletagmanager.com/gtag/js?id=G-XXXXXXXXXX"></script>
```

**In GA itself** — open your site in a browser, then in Google Analytics go to
**Reports** → **Realtime**. You should appear within about 30 seconds.

If the Realtime report stays empty, work through the checks below.

---

## How it works here

Two files, both already in the repo:

| File | Role |
|---|---|
| `_includes/head.html` | Decides *whether* to include the tag |
| `_includes/google-analytics.html` | The GA4 `gtag.js` tag itself |

The condition in `head.html` is:

```liquid
{%- if jekyll.environment == 'production' and site.google_analytics -%}
  {%- include google-analytics.html -%}
{%- endif -%}
```

Both halves matter:

- **`jekyll.environment == 'production'`** — set by `JEKYLL_ENV: production` in
  `.github/workflows/pages.yml`. Local `bundle exec jekyll serve` does not set
  it, so **your own local browsing never shows up in your stats**.
- **`site.google_analytics`** — the config key. Delete or comment out that line
  and the tag disappears entirely; no other edits needed.

The include also checks the ID contains `G-`. If you paste a `UA-` ID by
mistake, it emits an HTML comment explaining the problem instead of silently
shipping a tag that cannot work — so if analytics seem dead, view source and
look for `Google Analytics NOT loaded`.

## Troubleshooting

**No data at all, tag missing from page source.** Check `_config.yml` has the
`google_analytics` line and that your push actually deployed — look at the
Actions tab for a green run.

**Tag is in the source but Realtime is empty.** Usually an ad blocker or a
privacy-focused browser blocking `googletagmanager.com`. Try an incognito
window with extensions disabled, or a different network.

**Source contains `Google Analytics NOT loaded`.** The ID in `_config.yml` is
not a GA4 measurement ID. Get the `G-` value from **Admin → Data streams**.

**Works in production but not locally.** That is intentional — see above. To
test locally on purpose:

```sh
JEKYLL_ENV=production bundle exec jekyll serve
```

Remember that this *does* send hits to your real property, so avoid leaving it
running.

## Turning it off

Remove the `google_analytics` line from `_config.yml` and push. The tag is
gone from the next build — no cookies, no requests to Google.

## A note on privacy

GA4 sets `_ga` cookies and sends visitor data to Google. Depending on where
your readers are, that may bring GDPR/ePrivacy consent obligations, which this
setup does not implement — there is no consent banner. If that matters to you,
options are Google's [Consent Mode](https://developers.google.com/tag-platform/security/guides/consent),
or a cookieless analytics provider such as Plausible, Fathom, or GoatCounter,
which typically need no banner. Any of those would slot into the same
`_includes/google-analytics.html` seam.
