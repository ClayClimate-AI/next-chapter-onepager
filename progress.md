# Progress — Living State

> Single source of "where am I?" Updated as a step of passing every gate
> (C0–C4), never at the end. See `checkpoints.md` for the gate reference
> and `SPEC.md` for the source of truth.

## Snapshot

- **Stage**: Unit 8 complete and CI-verified. Pushed to
  `origin/main`; CI run #1 (commit `22af4fa`) passed in 13s on a clean
  GitHub-hosted runner.
- **Current gate**: C2 passed for Unit 8, CI objectively confirmed.
  Check-in gate open.
- **Next single action**: PIOF into the sub-agent verifier pass against
  SPEC.md, then the intentional mistake-catching stress test.

## DoD checklist (mirrors SPEC.md)

- [x] Headline + one-sentence description present.
- [x] Exactly three `<section>` elements, matching Flow in SPEC.md.
- [x] Exactly one call-to-action link, resolving to nextchapterproject.org.
- [x] No JavaScript. No pages beyond the single `index.html`.
- [x] Layout is responsive/dynamic across mobile and desktop form factors.
- [x] One consistent, professionally-formatted visual theme applied
      uniformly across the whole page.
- [ ] Every part of the page can be explained by the author in their own words.
- [~] At least one AI mistake caught and documented (natural + intentional
      stress test). Natural half satisfied twice over (see Failure log
      #1, #2). Intentional post-build stress test still outstanding.
- [x] `PROMPT_LOG.md` contains every prompt, pre-build and in-build.
- [x] Local structural check script passes.
- [x] Same checks pass in CI on push.
- [ ] Sub-agent verifier has reviewed the finished build against SPEC.md.

## Unit log

| # | Action item | C1 approved | C2 commit | Verified against |
|---|---|---|---|---|
| 1 | Headline + one-sentence description, responsive layout, consistent theme | Yes (Pilot: "Approved") | `6bb70c1` (+ `7857612` for Phase 0 docs) | SPEC.md Flow §1, DoD headline/description, responsive, and theme items |
| 2 | Section 1 — The Barrier | Yes (Pilot: "Yes.") | `140c6a9` | SPEC.md Flow §2 |
| 3 | Section 2 — The Reframe | Yes (Pilot: "yes It does.") | `ae6aa39` | SPEC.md Flow §3 |
| 4 | Section 3 — The Ask + CTA (with Pilot's added line: "...and that you're ready to put in the work") | Yes (Pilot: "This matches the specification.") | `e00a35c` | SPEC.md Flow §4-5 |
| 5 | CTA styling refinements (centered, `--space-xl` top margin, 1.25em border-radius) | Yes (Pilot: "That works, nothing special, just keeping it simple.") | `a8ff07e` | SPEC.md's consistent-theme amendment (styling only, no content/structure change) |
| 6 | Theme switch: dark to light/warm palette (cream bg, warm-brown text, terracotta accent, new `--color-on-accent` token) | Yes (Pilot: "reads a bit better than the whole dark theme") | `6c34985` | SPEC.md's consistent-theme amendment — one theme applied uniformly via existing tokens |
| 7 | Local structural check script (`check.sh`) — headline, 3 sections, 1 CTA, no JS, no extra pages | Yes (Pilot confirmed matching script output via screenshot) | `de4af11` | SPEC.md structural DoD items + "Local structural check script passes" |
| 8 | CI workflow (Tier 1) — runs `check.sh` on push/PR, no installs/matrix/deploy | Yes (Pilot: "y") | `22af4fa` | SPEC.md "Same checks pass in CI on push" — CI run #1 passed (13s, clean runner), confirmed via Pilot screenshot |

## Failure log

| # | What failed | When | Fix | ADR? |
|---|---|---|---|---|
| 1 | `PROMPT_LOG.md` was agreed on during pre-build design (Q10) but never actually created, despite being referenced by SPEC.md/checkpoints.md/progress.md | During C1 loop for Action Item 1 — caught by Pilot asking "Where is the prompt history?" | File created retroactively, reconstructing the conversation chronologically from the start of the design session | No — self-evident fix, no tradeoff |
| 2 | `PROMPT_LOG.md` fell behind a second time — updated through the missing-file catch, then not touched again through the entire C1→C2 loop for Unit 1 (approval, two amendments, CSS work, commit) | After Unit 1's commit and doc update, caught by Pilot asking "Have all proper context documentations been updated including the prompt log?" | Backfilled the missing entries; root cause fixed by adding `PROMPT_LOG.md` explicitly to checkpoints.md's Step 9 (living-doc update), since "update docs" alone wasn't specific enough to prevent recurrence | No — process fix captured directly in checkpoints.md, no separate ADR needed |

## Amendments log

| # | What changed | Why | Approved by |
|---|---|---|---|
| 1 | Added responsive/dynamic layout requirement (mobile + desktop form factors) to SPEC.md's Outputs, DoD, and Scope | Pilot amendment during Action Item 1's C1 loop — readability shouldn't be desktop-exclusive | Pilot |
| 2 | Added a standing requirement: one consistent, professionally-formatted visual theme applied uniformly across the whole page, to SPEC.md's Outputs and DoD | Pilot amendment — content approved, but flagged that all future styling/implementation work must hold to a single consistent professional theme, not per-section drift | Pilot |
