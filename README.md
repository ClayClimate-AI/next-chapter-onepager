# README — Next Chapter (Week 1 Project)

![CI](https://github.com/ClayClimate-AI/next-chapter-onepager/actions/workflows/ci.yml/badge.svg)
![Netlify](https://img.shields.io/badge/live-netlify-00C7B7?logo=netlify&logoColor=white)

**Live**: https://next-chapter-onepager.netlify.app

A one-page site for anyone who's been impacted by the justice system, or held back by stigma, guilt, fear, or imposter syndrome, at the point of deciding to change. It names the barriers that keep people stuck, shows through lived experience that change is possible, and points to one real next step.

## What's on the page

- A headline and one-sentence description of who it's for.
- Three sections: **The Barrier**, **The Reframe**, **The Ask**.
- One call to action, linking to [nextchapterproject.org](https://www.nextchapterproject.org/).

## P-I-O-F, mapped against the assignment criteria

The assignment ("The Week 1 Project — The Controlled Build") asks for a
one-page site built for a real purpose, with a fixed spec (headline,
exactly 3 sections, 1 CTA) and graded on staying inside that spec. Here's
how this build's Purpose / Inputs / Outputs / Flow map directly onto
that:

| P-I-O-F | This project | Assignment criteria it satisfies |
|---|---|---|
| **Purpose** | A one-page site for anyone impacted by the justice system, or held back by stigma, fear, or imposter syndrome, at the point of deciding to change. | "Build a simple one-page website for a real purpose." |
| **Inputs** | The author's own lived experience; the real destination program ([nextchapterproject.org](https://www.nextchapterproject.org/)); the assignment's own spec. | Grounds the build in something real, not invented — required for "real purpose." |
| **Outputs** | `index.html` + `styles.css`; one headline + description; exactly 3 `<section>`s; exactly 1 CTA link; no JavaScript. | "Meets-the-spec": headline, three sections, one call to action. |
| **Flow** | Barrier → Reframe → Ask → CTA, one section each, nothing added beyond the three. | "Control under constraints": stayed in scope, no bonus features — the rubric's heaviest-weighted item. |

```
Purpose ──▶ Inputs ──▶ Outputs ──▶ Flow
  │            │           │          │
  ▼            ▼           ▼          ▼
real        lived exp.   headline   Barrier
audience  + real link  + 3 sections → Reframe
+ real    + assignment + 1 CTA       → Ask
change      spec       + no JS         → CTA
```

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
    └── reflections.md
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
