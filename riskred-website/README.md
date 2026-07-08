# riskred.org — Eleventy rebuild

This is the new source for the Risk RED website, built with [Eleventy](https://www.11ty.dev/) as a static site, ready to deploy free on **Azure Static Web Apps**.

## What's in here

- `src/pages/*.md` — one Markdown file per page. Edit these to change content — no HTML knowledge required for most edits.
- `src/_includes/base.njk` — the shared page template (header, nav, footer).
- `src/css/style.css` — all styling.
- `.eleventy.js` — build configuration.

## Editing content

Every page is a Markdown file with a small metadata block at the top, e.g.:

```md
---
layout: base.njk
title: About
navTitle: About
navOrder: 2
permalink: /about/
---

Your page content goes here, in plain Markdown.
```

- `navOrder` controls where it appears in the top navigation (lower = earlier).
- To add a brand-new page, copy an existing `.md` file, change the front matter, and write your content.

## Running locally (optional)

If you have Node.js installed:

```bash
npm install
npm run serve
```

This starts a local preview at `http://localhost:8080` that live-reloads as you edit.

You don't need to do this to deploy — GitHub + Azure will build it for you automatically on every push (see below).

## Deploying to Azure Static Web Apps (free tier)

1. Push this repo to GitHub (see the steps you were given separately, or run `git init`, `git add .`, `git commit -m "Initial Eleventy site"`, then push to your new repo).
2. In the [Azure Portal](https://portal.azure.com), create a new **Static Web App** resource:
   - Plan: **Free**
   - Deployment source: **GitHub** — sign in and pick this repo/branch.
   - Build presets: choose **Custom** (or "Eleventy" if listed) with:
     - App location: `/`
     - Output location: `_site`
   - Azure will automatically add a GitHub Actions workflow file to this repo that builds and deploys on every push to `main`.
3. Once deployed, go to the Static Web App resource → **Custom domains** → add `riskred.org` and `www.riskred.org`. Azure will give you DNS records (CNAME/TXT) to add at your domain registrar.
4. After DNS propagates, Azure automatically issues a free SSL certificate for the custom domain.
5. Once confirmed working, cancel/downgrade the Wix plan.

## Known follow-ups from the migration

- **PDFs and downloadable files** currently still link to `riskred.org/_files/ugd/...` (Wix-hosted). These need to be downloaded from the old site and re-uploaded somewhere (e.g. an `src/files/` folder in this repo, or Azure Blob Storage) before the Wix account is cancelled, or the links will break.
- **Blog posts**: only a linked list of the 10 existing posts is included so far, still pointing at the old Wix URLs. Ask Claude to pull the full text of each into proper pages if you want them fully migrated.
- **Images**: page images were not yet downloaded from Wix's CDN (`static.wixstatic.com`) — same deadline concern as the PDFs above.
- **Bishnu Pandey's bio** on the Team page was blank on the live site at the time of migration — worth checking if content exists elsewhere.
