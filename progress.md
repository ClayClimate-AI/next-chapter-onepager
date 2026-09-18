# Progress — Living State

> Single source of "where am I?" Updated as a step of passing every gate
> (C0–C4), never at the end. See `checkpoints.md` for the gate reference
> and `SPEC.md` for the source of truth.

## Snapshot

- **Stage**: Phase 0 setup (living-state docs + verification scaffolding),
  pre-Unit-1.
- **Current gate**: C0 passed (SPEC.md confirmed by Pilot). Awaiting start
  of the per-action-item loop.
- **Next single action**: PIOF into the first unfinished SPEC.md DoD item.

## DoD checklist (mirrors SPEC.md)

- [ ] Headline + one-sentence description present.
- [ ] Exactly three `<section>` elements, matching Flow in SPEC.md.
- [ ] Exactly one call-to-action link, resolving to nextchapterproject.org.
- [ ] No JavaScript. No pages beyond the single `index.html`.
- [ ] Layout is responsive/dynamic across mobile and desktop form factors.
- [ ] One consistent, professionally-formatted visual theme applied
      uniformly across the whole page.
- [ ] Every part of the page can be explained by the author in their own words.
- [ ] At least one AI mistake caught and documented (natural + intentional
      stress test).
- [x] `PROMPT_LOG.md` contains every prompt, pre-build and in-build.
- [ ] Local structural check script passes.
- [ ] Same checks pass in CI on push.
- [ ] Sub-agent verifier has reviewed the finished build against SPEC.md.

## Unit log

_(One verified unit = one commit. Empty until the first action item clears C2.)_

| # | Action item | C1 approved | C2 commit | Verified against |
|---|---|---|---|---|

## Failure log

| # | What failed | When | Fix | ADR? |
|---|---|---|---|---|
| 1 | `PROMPT_LOG.md` was agreed on during pre-build design (Q10) but never actually created, despite being referenced by SPEC.md/checkpoints.md/progress.md | During C1 loop for Action Item 1 — caught by Pilot asking "Where is the prompt history?" | File created retroactively, reconstructing the conversation chronologically from the start of the design session | No — self-evident fix, no tradeoff |

## Amendments log

| # | What changed | Why | Approved by |
|---|---|---|---|
| 1 | Added responsive/dynamic layout requirement (mobile + desktop form factors) to SPEC.md's Outputs, DoD, and Scope | Pilot amendment during Action Item 1's C1 loop — readability shouldn't be desktop-exclusive | Pilot |
| 2 | Added a standing requirement: one consistent, professionally-formatted visual theme applied uniformly across the whole page, to SPEC.md's Outputs and DoD | Pilot amendment — content approved, but flagged that all future styling/implementation work must hold to a single consistent professional theme, not per-section drift | Pilot |
