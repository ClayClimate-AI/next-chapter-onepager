# Next Chapter

![CI](https://github.com/ClayClimate-AI/next-chapter-onepager/actions/workflows/ci.yml/badge.svg)

A one-page site for anyone who's been impacted by the justice system, or held back by stigma, guilt, fear, or imposter syndrome, at the point of deciding to change. It names the barriers that keep people stuck, shows through lived experience that change is possible, and points to one real next step.

## What's on the page

- A headline and one-sentence description of who it's for.
- Three sections: **The Barrier**, **The Reframe**, **The Ask**.
- One call to action, linking to [nextchapterproject.org](https://www.nextchapterproject.org/).

## Tech

Static HTML + CSS only. No JavaScript, no build step, no framework. The only external dependency is Google Fonts.

## Structure

```
.
├── index.html              # the site
├── styles.css               # the site's styling
├── scripts/
│   └── check.sh              # structural verification (zero dependencies)
├── .github/workflows/ci.yml  # runs check.sh on every push
├── .githooks/pre-commit      # runs check.sh before every local commit
└── docs/                     # process documentation
    ├── SPEC.md
    ├── checkpoints.md
    ├── progress.md
    ├── PROMPT_LOG.md
    ├── reflections.md
    └── BUILD-ENGINE.md
```

## Verification

`scripts/check.sh` runs the same structural check in three places:

```
scripts/check.sh
  ├── run manually, on demand
  ├── run automatically before every local commit (.githooks/pre-commit)
  └── run in CI on every push, on a clean runner (.github/workflows/ci.yml)
```

To enable the local pre-commit gate after cloning:

```
git config core.hooksPath .githooks
```

## Process

This project was built with a structured, spec-driven process. The full record — spec, checkpoints, progress log, prompt log, and reflections — lives in [`docs/`](docs/).
