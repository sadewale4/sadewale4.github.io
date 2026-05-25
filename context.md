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
2. **Hero** — Profile photo, bio, skill pills, CTA buttons, location
3. **Publications** — Filter buttons + Jekyll `site.publications` loop (sorted by date desc)
4. **Projects** — 2-column grid of featured project cards
5. **Contact** — Social link buttons (LinkedIn, Twitter, GitHub, Email)
6. **Footer**

## Projects (display order)
| # | Project | Org | Status |
|---|---------|-----|--------|
| 1 | Appsudo Platform | Appsudo | Contributing (private) |
| 2 | ZainGuard | ZainGuard | Contributing |
| 3 | Chainwatch | ZainGuard | Active / v0.1.0 (private → public) |
| 4 | ZainGuard AI Platform | ZainGuard | Contributing (open source) |
| 5 | Open Source Security Catalog | ZainGuard | Contributing |
| 6 | SecOps Content Hub | Personal | Coming Soon |

## Local Development
```bash
bundle install
bundle exec jekyll serve
# → http://localhost:4000
```

## Adding a Publication
Create `_publications/YYYY-MM-DD-slug.md` with appropriate frontmatter (see existing files for reference). Jekyll auto-picks it up on next build.

## Key Design Decisions
- No build step beyond Jekyll; all CSS via Tailwind CDN for zero-config deployment
- Dark mode via `class` strategy — stored in `localStorage`
- Publications filtered client-side via `data-type` attributes, no page reload
