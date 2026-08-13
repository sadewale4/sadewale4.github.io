# Repository Context

## Overview
Personal portfolio website for Samson Adewale, deployed at [sadewale4.github.io](https://sadewale4.github.io) via GitHub Pages + Jekyll.

## Tech Stack
- **Static Site Generator**: Jekyll (GitHub Pages)
- **CSS Framework**: TailwindCSS (CDN)
- **Hosting**: GitHub Pages (`main` branch auto-deploys)
- **Fonts**: Self-hosted SF Mono

## File Structure

### Core Files
| File | Purpose |
|------|---------|
| `index.html` | Main single-page portfolio (Hero, Publications, Projects, Contact) |
| `404.html` | Custom 404 page |
| `preview.html` | Staging/preview page |
| `_config.yml` | Jekyll site configuration |
| `Gemfile` | Ruby dependencies for local Jekyll dev |
| `CNAME` | Custom domain config |
| `sitemap.xml` | SEO sitemap |
| `robots.txt` | Search engine crawl rules |

### Content Collections
- **`_publications/`** — Jekyll collection; one `.md` file per publication/presentation.
  Frontmatter fields: `title`, `date`, `type` (presentation/paper/blog), `venue`, `location`,
  `status`, `tags`, `description`, `youtube`, `github`, `slides_url`, `paper_url`,
  `external_url`, `recording_url`
- **`publications/`** — Static PDF assets (slides, papers) referenced from `_publications/` entries
- **`_layouts/`** — Jekyll layout templates (`post.html` for publication detail pages)

### Assets
| Path | Contents |
|------|---------|
| `css/` | `main.scss` (primary styles), `fonts.css`, legacy Bootstrap/FA |
| `_sass/` | SASS source compiled into `css/` |
| `img/` | Profile photo, SVG icons (github, linkedin, twitter, youtube, file, link) |
| `fonts/` | SF Mono family: Regular, Medium, Semibold, Bold (`.woff`, `.woff2`, `.otf`) |

### Build Output
- `_site/` — Jekyll build output, gitignored

## Sections in `index.html`
1. **Header / Nav** — Sticky, backdrop-blur, dark-mode toggle, mobile hamburger
2. **Hero** — Bio, skill pills, CTA buttons, location on the left; profile photo on the right
3. **Publications** — Filter buttons + Jekyll `site.publications` loop (sorted by date desc)
4. **Projects** — 2-column grid of featured project cards
5. **Contact** — Social link buttons (LinkedIn, Twitter, GitHub, Email)
6. **Footer**

## Projects (display order)
| # | Project | Org | Status |
|---|---------|-----|--------|
| 1 | Agents on Alert | Personal (DEF CON 34) | Public — github.com/sadewale4/agents-on-alert |
| 2 | Appsudo Platform | Appsudo | Contributing (private) |
| 3 | ZainGuard | ZainGuard | Contributing |
| 4 | Chainwatch | ZainGuard | Active / v0.1.0 (private → public) |
| 5 | ZainGuard AI Platform | ZainGuard | Contributing (open source) |
| 6 | Open Source Security Catalog | ZainGuard | Contributing |
| 7 | SecOps Content Hub | Personal | Coming Soon |

## Local Development
```bash
bundle install
RUBYOPT="-r./scripts/ruby4-compat.rb" bundle exec jekyll build   # rebuild after edits
cd _site && python3 -m http.server 4000
# → http://localhost:4000
```
The `RUBYOPT` shim (`scripts/ruby4-compat.rb`) is required on Ruby >= 3.2: github-pages
pins Jekyll 3.9/Liquid 4.0.3, which call the removed `Object#tainted?`. The Gemfile also
pins stdlib gems (`csv`, `webrick`, `base64`, `bigdecimal`, `logger`, `ostruct`) that
modern Ruby no longer bundles. GitHub Pages' production build is unaffected by both.

Note: `jekyll serve` intermittently segfaults on Ruby 4.0.1 (VM crash in document write).
Build + static-serve `_site/` with python's http.server is the reliable local workflow.

## Adding a Publication
Create `_publications/YYYY-MM-DD-slug.md` with appropriate frontmatter (see existing files for reference). Jekyll auto-picks it up on next build. Slide PDFs go in `publications/`.

## Key Design Decisions
- No build step beyond Jekyll; all CSS via Tailwind CDN for zero-config deployment
- Dark mode via `class` strategy — stored in `localStorage`
- Publications filtered client-side via `data-type` attributes, no page reload
- DEF CON 34 talk constraints: never link `sadewale4/defcon-demo` (private); do not
  present the demo as a hosted service (environment torn down; reproducible from the
  public repo); no credentials/account IDs/webhook URLs on the site
