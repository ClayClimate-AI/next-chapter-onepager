# Progress — Living State

> Single source of "where am I?" Updated as a step of passing every gate
> (C0–C4), never at the end. See `checkpoints.md` for the gate reference
> and `SPEC.md` for the source of truth.

## Snapshot

- **Stage**: Sub-agent verifier pass complete (see "Sub-agent verifier
  findings" below). All build-side DoD items are now checked or
  explicitly accepted as a documented tradeoff. One DoD item remains
  by nature un-checkable by the agent: "every part of the page can be
  explained by the author in their own words" — that's demonstrated at
  the demo itself, not something to mark done in advance.
- **Current gate**: C4 complete — `reflections.md` written as a
  verbatim Q&A transcript. Check-in gate open.
- **Next single action**: none required by SPEC.md's DoD. Remaining:
  the demo itself (Day 5), where "explainable in your own words" is
  proven live.

## DoD checklist (mirrors SPEC.md)

- [x] Headline + one-sentence description present.
- [x] Exactly three `<section>` elements, matching Flow in SPEC.md.
- [x] Exactly one call-to-action link, resolving to nextchapterproject.org.
- [x] No JavaScript. No pages beyond the single `index.html`.
- [x] Layout is responsive/dynamic across mobile and desktop form factors.
- [x] One consistent, professionally-formatted visual theme applied
      uniformly across the whole page.
- [ ] Every part of the page can be explained by the author in their own words.
- [x] At least one AI mistake caught and documented (natural + intentional
      stress test). Natural half satisfied twice over, plus a third
      process-gap catch (Failure log #1, #2, #3). Intentional stress
      test satisfied by the sub-agent verifier pass — see "Sub-agent
      verifier findings" below.
- [x] `PROMPT_LOG.md` contains every prompt, pre-build and in-build.
- [x] Local structural check script passes.
- [x] Same checks pass in CI on push.
- [x] Sub-agent verifier has reviewed the finished build against SPEC.md.

## Sub-agent verifier findings

An independent subagent (no prior context on this build) reviewed
`index.html`, `styles.css`, `check.sh`, and `.github/workflows/ci.yml`
against `SPEC.md` only, per SPEC.md's Verifier's brief. This pass also
satisfies SPEC.md's DoD requirement for an intentional, post-build
stress test (as distinct from the two naturally-surfaced catches in
the Failure log above).

**DoD coverage**: every checkable item in SPEC.md's Definition of Done
passes (headline/description, 3 sections matching Flow, 1 CTA with
exact URL match and no `target="_blank"`, no JS, responsive layout,
consistent theme, local check + CI both green).

**Finding 1 — CTA contrast fails WCAG AA (real defect)**
- **What**: `--color-on-accent` (`#fffaf3`) on `--color-accent`
  (`#c1652c`) computes to ~3.9:1 contrast. WCAG AA requires 4.5:1 for
  normal-weight text at this size (the button text doesn't qualify as
  "large text").
- **Why it matters**: low-vision or bright-screen readers may not be
  able to read the one interactive element on the page — the CTA is
  the entire point of the site.
- **Recommendation**: darken `--color-accent` rather than lighten the
  text further (lightening `--color-on-accent` toward pure white gains
  little, since the bottleneck is the accent's mid-range lightness).
  A shade around `#96491c` brings contrast to ~6.2:1, comfortably
  clearing AA without changing the palette's warm/terracotta identity.
- **Decision: accepted, not fixed.** Pilot's call — the visual design
  is being deliberately kept minimal for this project, and this isn't
  worth further design iteration. Logged here as a known, intentional
  tradeoff rather than an unresolved defect.

**Finding 2 — `check.sh` latent edge cases (not currently triggered)**
- **What**: (a) `grep -c` counts matching *lines*, not tag
  *occurrences* — two `<h1>` tags on one line would still count as 1
  and pass; (b) the script checks for literal `<script` but not inline
  JS via event-handler attributes (e.g. `onclick=`); (c) the
  no-extra-HTML-pages check only scans the repo root
  (`find . -maxdepth 1`), not subdirectories.
- **Why it matters**: none of these are triggered by the current
  `index.html` — they're latent gaps in the check's rigor, not active
  bugs.
- **Recommendation**: accept as a documented, known limitation rather
  than fix. Hardening `check.sh` against hypothetical inputs that don't
  exist in this project would be exactly the over-engineering SPEC.md's
  Scope & Constraints section was written to avoid. Revisit only if a
  future edit to `index.html` would actually exercise one of these
  gaps (e.g., adding a second `<h1>` on the same line, which no one
  has proposed).

**Security**: no realistic risk for this zero-JS static page (no
forms, no user input, no inline scripts, no `target="_blank"`). Google
Fonts is the only third party; its only associated exposure (visitor
IP sent to Google on font load) is inherent to using the service at
all, not a defect — accepted as-is per the earlier Google Fonts
decision (Unit 1).

**CI workflow**: correctly mirrors `check.sh`, properly scoped to Tier
1 only, no scope creep found.

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
| 3 | `progress.md`, `checkpoints.md`, and `PROMPT_LOG.md` were updated correctly on disk after every unit, but never actually committed to git after the Phase 0 commit (`7857612`) — the pushed repo carried none of that history through Unit 8 | Discovered while updating docs after CI's first pass; caught by the agent, not the Pilot, while about to mark another DoD item complete | Committed the full accumulated state (`7db5f33`) and pushed; root cause: doc updates were being treated as a step separate from the code commit instead of part of it | No — going forward, living-doc updates are folded into each unit's commit rather than left as a trailing step |

## Amendments log

| # | What changed | Why | Approved by |
|---|---|---|---|
| 1 | Added responsive/dynamic layout requirement (mobile + desktop form factors) to SPEC.md's Outputs, DoD, and Scope | Pilot amendment during Action Item 1's C1 loop — readability shouldn't be desktop-exclusive | Pilot |
| 2 | Added a standing requirement: one consistent, professionally-formatted visual theme applied uniformly across the whole page, to SPEC.md's Outputs and DoD | Pilot amendment — content approved, but flagged that all future styling/implementation work must hold to a single consistent professional theme, not per-section drift | Pilot |
