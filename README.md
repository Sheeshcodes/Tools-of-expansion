# Tools of Expansion

An interactive index page for the ALM team's consumability tools, with a team page.

## Repo structure

```
your-repo/
├── index.html              # the cover / hub (this is what GitHub Pages serves)
├── esters-pen-v4.html      # the Ester's Pen v4 tool (add this file yourself)
├── images/                 # team photos (created by download-photos.sh)
│   ├── anvita-beohar.jpg
│   ├── ashish-john-mundu.jpg
│   └── ... (10 total)
├── download-photos.sh      # one-time helper to fetch the team photos
└── README.md
```

## Before you push

1. **Photos.** Run `./download-photos.sh` from this folder (do it soon — the Figma
   asset URLs expire ~7 days after they were generated). It fills `images/`.
   Then open `index.html` and set `const USE_LOCAL = true;` so photos load from
   `./images` instead of Figma.

2. **Ester's Pen tool.** Drop your tool file into the repo named
   `esters-pen-v4.html`. The "Ester's pen" item links to it. If your file has a
   different name, change `data-href="esters-pen-v4.html"` on that list item in
   `index.html`.

## Host on GitHub Pages

```bash
# from this folder
git init
git add .
git commit -m "Tools of Expansion index page"

# create an empty repo on github.com first, then:
git remote add origin https://github.com/<you>/<repo>.git
git branch -M main
git push -u origin main
```

Then on GitHub: **Settings → Pages → Build and deployment → Source: Deploy from a
branch → Branch: `main` / `/ (root)` → Save.**

Your site goes live at:

```
https://<you>.github.io/<repo>/
```

(If you name the repo exactly `<you>.github.io`, it serves at
`https://<you>.github.io/` with no sub-path.)

Give it a minute after the first push for Pages to build.
