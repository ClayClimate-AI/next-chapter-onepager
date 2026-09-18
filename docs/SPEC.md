# SPEC — Next Chapter (Week 1 Project)

> Source of truth for this build. The sub-agent verifier checks the finished
> work against this document, not against the assignment brief directly.

## Purpose

A one-page static site for anyone who has been impacted by the justice
system, or held back by stigma, fear, guilt, or imposter syndrome — someone
at the point of deciding to change and no longer let their past define them.
It names the mental/societal barriers that keep people stuck, shows (through
the author's own lived experience) that change is possible, and invites the
visitor to take the next step by visiting a real reentry-to-tech program.

## Inputs

- The author's own lived experience: incarceration, employment rejection
  despite being qualified, substance abuse and mental health struggle,
  societal stigma, the transition into learning tech/AI/software development.
- The real destination program: https://www.nextchapterproject.org/
- Course assignment brief: "The Week 1 Project — The Controlled Build"
  (headline + one-sentence description, exactly 3 sections, 1 CTA).

## Outputs

- `index.html` — the one-page site (static HTML + CSS only, no JS).
- `styles.css` — page styling, responsive across mobile and desktop form
  factors (fluid/dynamic layout, not a fixed desktop-only width).
  Professionally structured with one consistent visual theme (typography,
  spacing, color) applied uniformly across the whole page — no
  per-section style drift.
- A working CTA link that resolves to `https://www.nextchapterproject.org/`.
- `PROMPT_LOG.md` — every prompt used, pre-build and in-build.
- Local structural check script (shell/grep) + matching GitHub Actions
  workflow running the same checks.

## Flow

1. Headline + one-sentence description of who the site is for.
2. **Section 1 — The Barrier**: the mental/societal obstacles that keep
   people stuck (stigma, hopelessness, limited options, guilt).
3. **Section 2 — The Reframe**: the author's own story as proof change is
   possible; reaching out to others in the same position.
4. **Section 3 — The Ask**: a self-reflection prompt ("are you ready to put
   in the work?") leading into the one call to action.
5. CTA: "Start your next chapter" → links to nextchapterproject.org.

## Definition of Done

- [ ] Headline + one-sentence description present.
- [ ] Exactly three `<section>` elements, matching Flow above.
- [ ] Exactly one call-to-action link, resolving to
      `https://www.nextchapterproject.org/`.
- [ ] No JavaScript. No pages beyond the single `index.html`.
- [ ] Layout is responsive/dynamic across mobile and desktop form
      factors — no fixed desktop-only width, no horizontal scroll on
      narrow viewports.
- [ ] One consistent, professionally-formatted visual theme (typography,
      spacing, color) applied uniformly across the whole page.
- [ ] Every part of the page can be explained by the author in their own
      words.
- [ ] At least one AI mistake caught and documented (one naturally
      surfaced during build, one from an intentional post-build stress
      test).
- [ ] `PROMPT_LOG.md` contains every prompt, including pre-build design
      conversation.
- [ ] Local structural check script passes.
- [ ] Same checks pass in CI on push (clean-machine, reproducible).
- [ ] Sub-agent verifier has reviewed the finished build against this
      SPEC and raised edge cases (structure, accessibility, security)
      before the work is called done.

## Scope & Constraints

**In scope:**
- Static HTML + CSS, one page, three sections, one CTA.
- Responsive/dynamic CSS across mobile and desktop form factors (not
  desktop-only) — this is a layout/styling requirement, not an added
  content feature.
- Local pre-commit shell/grep structural checks.
- Minimal Tier 1 GitHub Actions workflow running the same checks.
- A sub-agent verifier reviewing the finished build against this SPEC.

**Out of scope (explicitly excluded to avoid over-engineering):**
- JavaScript / interactivity of any kind.
- Additional pages, dashboards, or admin views.
- L0 (Bubble/venv) and L1 (dependency setup gate) — no real dependencies
  exist for a static HTML/CSS page.
- Any visible feature added to the shipped page in order to "justify" the
  verification tooling. The pipeline is internal process only and must
  have zero footprint on the page a visitor sees.
- A formal `/builder-loop` Claude Code skill — BUILD-ENGINE.md is used as
  a manual reference this week, not built into an installed skill.

## Verifier's brief (for the sub-agent)

Check the finished build against this SPEC only. Ask: what edge cases in
structure, accessibility, or security could cause this to fail? Be
specific. Do not suggest features beyond what this SPEC defines.
