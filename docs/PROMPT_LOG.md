# Prompt Log — Next Chapter (Week 1 Project)

> Every prompt used in this project, pre-build and in-build, as evidence
> of thinking. Per Pilot instruction, one exchange is explicitly excluded
> (see note below) — everything else is captured chronologically.

## Caught mistake (logged per SPEC.md DoD)

**What happened**: `PROMPT_LOG.md` was agreed on during the pre-build
design conversation (see entry "Prompt log location" below) but the file
was never actually created — it was referenced repeatedly in later
planning (SPEC.md, checkpoints.md, progress.md all cite it) without
existing. The Pilot caught this gap directly by asking "Where is the
prompt history?" partway through the C1 loop for Action Item 1.

**Fix**: File created retroactively at this point in the build,
reconstructing the conversation chronologically from the start of the
design/grilling session.

---

## Pre-build: design conversation (grilling session)

1. **Prompt**: Invoked `/grilling` with no topic specified.
   **Outcome**: Agent read the working directory (Week 1 Project brief,
   IronBee DevTools rule) to find the subject, then began an interview
   to scope the project via a design tree.

2. **Round 1 questions** — who the site is for, the call-to-action, and
   the build tool — asked with recommendations.

3. **Pilot's answer**: The site is for anyone impacted by the justice
   system, at a transitional point of deciding to change; framed as an
   inspirational page addressing mental barriers and encouraging forward
   movement.

4. **Round 2 questions** — real/specific anchor behind the project, the
   call-to-action, and the build tool (re-asked, still open).

5. **Pilot's answer**: Confirmed a personal, lived-experience anchor
   (incarceration, employment rejection despite qualification, substance
   abuse, mental health struggle, societal stigma). Amended the audience
   to include anyone who believes in their interest/ability to learn
   AI/software development despite stigma, competition, or imposter
   syndrome. CTA: a self-reflection prompt leading to visiting
   "nextchapter.org." Build tool: hand-coded HTML/CSS/JS with an AI
   coding assistant, spec-driven, remaining in scope, wanting local +
   repository tests, an internal builder loop, layered gates/checkpoints,
   verification hooks, and a sub-agent that tests/validates/verifies the
   codebase.

6. **Agent fact-check**: Fetched nextchapter.org — found it is an
   existing, unrelated enterprise AI-transformation consulting
   organization, not connected to this project.

7. **Round 3 questions** — where the CTA should actually point, whether
   to trim the verification pipeline given the "stay in scope" grading
   weight, and a proposed three-section structure (barrier / reframe /
   ask).

8. **Pilot's answer**: Clarified the real destination is
   `https://www.nextchapterproject.org/` — the reentry-to-tech program
   the Pilot is personally, currently enrolled in. Explained the lived
   experience behind the project in full: rejection despite
   qualification, the impact of substance abuse and mental health
   struggles, feeling hopeless, feeling like a "nobody," and eventually
   choosing to enroll in NextChapter as the turning point. CTA: visitors
   click the same link and "start their next chapter."

9. **Agent fact-check**: Attempted to fetch nextchapterproject.org twice
   — both times returned HTTP 403 (site blocks automated fetches).
   Proceeded on the Pilot's firsthand account.

10. **Round 4 questions** — Prompt Log location/format, and how to catch
    a deliberate mistake.

11. **Pilot's answer**: All Q&A from this design conversation should be
    recorded in a `PROMPT_LOG.md` in the working directory, including the
    pre-build/preliminary thinking stage, not just in-build prompts —
    reasoning that the cognitive/communication process behind
    AI-engineering is itself a valued, gradable skill.

12. **Round 5 (Q8, Q9, Q11)**: Verification pipeline scope (full vs.
    trimmed), the three-section structure, and the mistake-catching
    approach.
    **Pilot's answer**: Full scope for the verification pipeline. Agreed
    to the three-section structure (barrier → reframe → ask). For
    mistake-catching: both — let one surface naturally during the real
    build, and additionally run an intentional stress test afterward.

13. **Q12 clarification**: Agent asked whether the full-scope
    verification pipeline counts as a visible "feature" of the shipped
    page (risking the "no bonus features" rubric line) or internal
    process tooling only.
    **Pilot's answer**: Internal process tooling only — zero footprint on
    the shipped page, nothing visible added to justify the tooling.

14. **Q13/Q14**: Pilot described `BUILD-ENGINE.md` (already authored,
    found in the working directory) as the methodology being drawn from
    — a P-I-O-F / C0–C4 / Guardrail Ladder (L0–L5) system built
    originally for dependency-bearing ML/Jupyter projects. Pilot's
    reasoning behind it: a "PIOF" (Purpose/Input/Output/Flow) mental
    model learned during NextChapter's own pre-course technical material,
    which gave a way to cut through noise and start with the end in
    mind — building the "frame" of a project first, the way one would
    start a jigsaw puzzle from the edges inward.
    Sub-agent verifier: should check the build against a written
    `SPEC.md` (source of truth), acting adversarially — "what could go
    wrong, what's missing, be specific" — rather than a single agent
    self-checking its own work. Also referenced an instructor-shared
    resource on the software test pyramid (`image.png`, a UK government
    engineering standard) as further context, while noting it may reflect
    an older SDLC model.

15. **Round 6 (Q15, Q16, Q17)**: Whether the site needs real JS logic;
    whether to build a formal `/builder-loop` Claude Code skill now or
    work from `BUILD-ENGINE.md` manually; whether L0 (Bubble/venv) and L1
    (dependency setup gate) apply to a static site.
    **Pilot's answer**: No JS — pure static HTML/CSS, keeping Layer 3
    tests as honest structural/content assertions. Work from
    `BUILD-ENGINE.md` manually this week rather than building the formal
    skill — `BUILD-ENGINE.md` was originally written for dependency-bearing
    ML/notebook projects, which doesn't apply here. Skip L0/L1 as
    vacuous for a zero-dependency static site.

16. **Round 7 (Q18, Q19)**: What language/tooling runs the local
    structural checks; whether to use a real git repo + GitHub remote
    with CI, or stay local-only.
    **Pilot's answer**: Plain shell/grep for structural checks — zero
    dependencies. Yes to a real GitHub repo, for best practices, with the
    Pilot providing the link once created.

17. **Agent summarized the full shared understanding** (audience,
    anchor, three sections, CTA, tech stack, verification process, prompt
    log placement) and asked for confirmation before proceeding.
    **Pilot confirmed**: matches, ready to commence setup.

18. **Naming discussion**: Agent recommended repo name
    `next-chapter-onepager` and a description. Pilot asked about
    "landing page" vs. "free-flow one-page document" terminology; agent
    clarified the two aren't mutually exclusive — the spec (1 headline, 3
    sections, 1 CTA) is structurally a landing page regardless of visual
    complexity. Pilot proposed `nc_atla_p1_landingpage`; agent recommended
    `next-chapter-onepager` instead (project identity over course
    metadata) and the Pilot agreed.

19. **CI discussion**: Pilot asked whether CI was actually needed,
    reasoning it would help the site work "for anybody who would attempt
    to run it on their device." Agent clarified CI proves build/check
    reproducibility on a clean machine, not cross-device/browser
    compatibility — those are different concerns, and a static
    dependency-free page already has low risk on the reproducibility
    front. Agent recommended keeping a minimal Tier 1 CI workflow anyway,
    mirroring the local pre-commit checks exactly, since it was a
    deliberate earlier decision and costs little. Pilot agreed.

20. **Repo setup**: Pilot provided GitHub URL
    `https://github.com/ClayClimate-AI/-next-chapter-onepager.git`
    (contained a stray leading hyphen). Agent ran `git init` and added
    the remote. Pilot corrected the URL to
    `https://github.com/ClayClimate-AI/next-chapter-onepager.git`; agent
    updated the remote accordingly.

21. **SPEC.md drafted** by the agent from the full settled understanding
    (Purpose, Inputs, Outputs, Flow, DoD, Scope & Constraints, verifier's
    brief), for Pilot review.

22. **`/to-spec` invoked**, found to be a mismatched skill for this
    project (no issue tracker configured; template built for
    codebase-feature specs, not a static one-pager). Agent flagged the
    mismatch; Pilot clarified they instead wanted a formalized
    `checkpoints.md` + `progress.md` loop: PIOF → Pilot confirms
    understanding → Agent asserts implementation → Pilot evaluates
    against SPEC.md → explicit approval (C1) → implement → Pilot review
    → commit (C2) → update living docs → check-in → next PIOF, looped
    until SPEC.md's DoD is fully met.
    Agent created `checkpoints.md` and `progress.md`, wired to SPEC.md's
    DoD as the action-item list.

## In-build: the Builder Loop (per SPEC.md action item)

### Action Item 1 — Headline + one-sentence description

- Pilot: "After assessing criteria no further questions at this time.
  Commence initiation of PIOF."
- Agent stated PIOF for Action Item 1 (create `index.html` +
  `styles.css` skeleton with headline + one-sentence description; no
  sections/CTA/JS in this unit).
- Pilot flagged the missing `PROMPT_LOG.md` before responding to the
  PIOF — this file was created as a result (see "Caught mistake" above).
- Pilot: "Approved" — C1 gate passed for the PIOF as scoped.
- Agent implemented `index.html` (skeleton, headline "Your Past Doesn't
  Get the Final Say", one-sentence description) and an empty
  `styles.css`, and presented the draft copy for Pilot review, noting
  the copy was a placeholder for the Pilot to own in their own words.
- Pilot: "And make sure the proper context documents are being
  sequentially updated." Agent confirmed it would commit → update docs
  → check-in in that order going forward, and asked for explicit C2
  confirmation before committing.
- Pilot: "I'd like to make an amendment to the spec." Agent paused C2
  per the amendment protocol.
- **Amendment 1**: Pilot requested the site not be desktop-exclusive —
  readability should also work on mobile, and be dynamic. Agent added
  a responsive/dynamic layout requirement to SPEC.md's Outputs, DoD,
  and Scope, and logged the amendment in `progress.md`.
- Pilot: content/copy approved ("in agreement with my perspective and
  empirical experience"), but flagged that formatting/styling across
  all future implementations needs to be professionally structured
  within one consistent theme throughout.
- **Amendment 2**: Agent logged a standing requirement — one
  consistent, professionally-formatted visual theme (typography,
  spacing, color) applied uniformly across the whole page — added to
  SPEC.md's Outputs and DoD, and to `progress.md`'s Amendments log.
- Pilot: "Let's make the CSS adjustments first before the commit."
  Agent implemented `styles.css`: a dark theme via CSS custom
  properties (color, typography, spacing tokens), fluid responsive
  type sizing with `clamp()`, and a `<main>` container capped at a
  readable width. Updated `index.html` to wrap content in `<main>` to
  match.
- Pilot: "Remove all dashes from the text and use a font that stands
  out more but is in conjunction with the consistent theme throughout."
  Agent removed the em dash from the description (restructured as one
  comma-joined sentence) and added a font pairing — Fraunces (serif
  display) for the headline, Inter (sans) for body text — loaded via
  Google Fonts, coordinated with the existing dark/gold theme. Agent
  flagged that Google Fonts introduces an external network dependency,
  which cuts against the earlier zero-dependency/L0-L1-skip decision,
  and asked whether to keep it or switch to a system-font pairing.
- Pilot: "It's simple and the Google fonts work for me." Kept as-is.
- Agent asked for final confirmation to commit; Pilot: "Commence the
  commit with the proper naming convention."
- Agent found `Screenshot 2026-09-16 at 9.58.54 PM.png`, `image.png`,
  and `.cursor/` untracked and flagged them as local reference/tooling
  material rather than deliverable content, recommending a
  `.gitignore` to exclude them from the public repo. Pilot: "Recommendation
  granted." Agent created `.gitignore`.
- Agent made two atomic commits: Phase 0 setup/process docs
  (`7857612`), then Unit 1 implementation — headline, description,
  responsive theme (`6bb70c1`). Updated `progress.md`'s Snapshot, DoD
  checklist, and Unit log to reflect C2 completion, then opened the
  check-in gate.
- Pilot: "Have all proper context documentations been updated including
  the prompt log?" — caught that `PROMPT_LOG.md` had fallen behind
  again (stopped mid-Action-Item-1). This entry is the fix.

## Caught mistake #2 (logged per SPEC.md DoD)

**What happened**: `PROMPT_LOG.md` fell behind a second time — last
updated through the missing-file catch, then not touched again through
approval, two SPEC amendments, CSS work, font/dash changes, and the
Unit 1 commit + doc update.

**Fix**: Backfilled the missing entries. Root cause addressed directly:
`checkpoints.md`'s Step 9 ("update living docs") now explicitly names
`PROMPT_LOG.md` and requires appending every exchange since its last
update, not just a summary line, so this can't silently recur the same
way again.

Pilot's response: this counts as a serious natural catch in its own
right — not a substitute for the intentional post-build stress test
still owed under SPEC.md's DoD (per the original "let's go with both"
answer), but worth recording prominently given how directly a lapsed
prompt log undermines the entire premise of the project.

### Action Item 2 — Section 1: The Barrier

- Agent stated PIOF for Section 1: add one `<section>` inside `<main>`
  after the existing headline/description, naming the mental/societal
  barriers (stigma, hopelessness, limited options, guilt) per SPEC.md
  Flow §2, styled using only the existing theme tokens.
- Pilot: "Yes." — C1 approved.
- Agent implemented the section ("The Weight That Keeps You Stuck"),
  drawing directly on the Pilot's described experience: job rejection
  despite qualification, guilt, stigma around interest in tech/AI,
  imposter syndrome, hopelessness. Styled with the existing Fraunces/
  Inter/dark-gold theme tokens, no new theme introduced.
- Pilot: "Yes." — content approved, C2 confirmed.
- Agent committed (`140c6a9`) and updated `progress.md` (Snapshot, Unit
  log) accordingly.

### Action Item 3 — Section 2: The Reframe

- Agent stated PIOF for Section 2: tell the author's own story as proof
  change is possible, per SPEC.md Flow §3, ending with direct address
  to the reader; asked what level of detail the Pilot wanted before
  drafting copy.
- Pilot: "yes It does." — C1 approved, no additional detail guidance
  given.
- Agent implemented the section ("I Know Because I Lived It"):
  incarceration, job rejection despite qualification, substance abuse
  and mental health struggle, the turning point of choosing to change
  and enrolling in NextChapter, ending with "If you're reading this and
  you recognize yourself in it, you're not stuck. You're just not
  moving yet." Reused existing section styling, no new CSS.
- Pilot: "Yes, this directly correlates with my personal experience." —
  C2 confirmed.
- Agent committed (`ae6aa39`) and updated `progress.md` (Snapshot, Unit
  log) accordingly.

### Action Item 4 — Section 3: The Ask + CTA

- Agent stated PIOF for Section 3: the closing self-reflection prompt
  and the single CTA ("Start your next chapter" →
  nextchapterproject.org), per SPEC.md Flow §4-5, and asked whether the
  CTA should look like a button or a plain styled link.
- Pilot: "This matches the specification." — C1 approved; no explicit
  button/link preference given.
- Agent implemented Section 3 ("Are You Ready?") and styled the CTA as
  a filled accent-color button using existing theme tokens, completing
  all three sections and the one CTA.
- Pilot: requested one addition — the closing line should say not only
  that showing up is about deciding you're done waiting for
  permission, but also that you're ready to put in the work. Agent
  updated the line accordingly.
- Pilot: "Good for C2, commit it." Agent committed (`e00a35c`) and
  updated `progress.md` (Snapshot, DoD checklist, Unit log) — all three
  structural DoD items (3 sections, 1 CTA, no JS) now satisfied.

### Unit 5 — CTA styling refinements

- Pilot: "Let's make the call to action button center-aligned." Agent
  changed `.cta` to `display: block; width: fit-content; margin-inline:
  auto;`.
- Pilot: "And let's give it some more margin top." Agent added
  `margin-top: var(--space-md)`.
- Pilot: "Let's give some more space in between the paragraph element
  and the call to action button. Let's make the space instead of space
  medium, we can do space large and see what that looks like." Agent
  found the file had already been changed on disk to
  `margin-top: var(--space-lg)` (flagged by the harness as an external
  change) — confirmed it already matched the request, no further edit
  needed.
- Pilot: "The button needs to be lower for the call to action." Agent
  added a new `--space-xl: 6rem` token to the existing spacing scale
  and applied it as `.cta`'s `margin-top`.
- Pilot: "Can we put more of a border radius around the call to action
  button." Agent set `border-radius: 0.75em` (from `0.25em`).
- Pilot: "Increase the border radius to one rem." Agent set
  `border-radius: 1rem`.
- Pilot: "Try 1.25em for the border radius." Agent set
  `border-radius: 1.25em`.
- Pilot: "That works, nothing special, just keeping it simple." — C2
  confirmed for the full batch (centering, spacing token, radius).
  Agent committed (`a8ff07e`) and updated `progress.md` (Snapshot, Unit
  log) accordingly.

### Unit 6 — Theme switch: dark to light/warm

- Pilot: "And can we go with a lighter more Welcoming Page, theme, and
  colour." Agent replaced the dark palette with a light, warm one
  (cream background, warm dark-brown text, terracotta accent) via the
  existing CSS custom properties, so it propagated uniformly across
  headline, sections, and CTA with no per-element edits. Added a new
  `--color-on-accent` token for the CTA's text color, since reusing
  `--color-bg` (as in the dark theme) would have broken contrast once
  the background flipped from dark to light.
- Pilot: "I've evaluated it in terms of the visibility and it looks
  pretty good. It's very simple, nothing too extravagant, reads a bit
  better than the whole dark theme." — C2 confirmed.
- Agent committed (`6c34985`) and updated `progress.md` (Snapshot, Unit
  log) accordingly.

### Action Item 5 / Unit 7 — Local structural check script

- Pilot: "Nope, I think we're good. Let's go ahead and move into that
  phase of the process." Agent stated PIOF for `check.sh`: a
  zero-dependency POSIX shell + grep script checking headline, 3
  sections, 1 CTA link, no `<script>` tags, no extra HTML pages.
- Pilot: "Scope confirmed" — C1 approved.
- Agent implemented `check.sh`, made it executable, and ran it — all
  five checks passed.
- Pilot shared a screenshot of running the same script with identical
  passing output.
- Agent committed (`de4af11`, executable bit tracked) and updated
  `progress.md` (Snapshot, DoD checklist, Unit log) accordingly.

### Action Item 6 / Unit 8 — CI workflow

- Pilot: "No questions at this point in time." Agent stated PIOF for
  `.github/workflows/ci.yml`: checkout + run `check.sh` on push/PR,
  Tier 1 only (no installs, matrix, or deploy step), per the earlier
  CI-trim decision.
- Pilot: "yes" — C1 approved.
- Agent implemented the workflow file, noted CI hasn't actually run
  yet since nothing's been pushed to the remote, and asked whether to
  push now or hold.
- Pilot: "y" — C2 confirmed for the commit. Agent committed
  (`22af4fa`) and updated `progress.md` (Snapshot, Unit log)
  accordingly. Push timing still needs an explicit Pilot decision
  before CI can actually execute.
- Pilot: "Let's go ahead and push now." Agent set the branch to `main`
  and pushed all 8 commits to `origin/main`. `gh` wasn't authenticated
  in this environment, so agent asked the Pilot to check the Actions
  tab directly.
- Pilot shared a screenshot: CI run #1 (commit `22af4fa`) passed, green
  checkmark, 13s, on `main`. Agent updated `progress.md` (Snapshot, DoD
  checklist, Unit log) to record the objective CI pass.

## Caught mistake #3 (logged per SPEC.md DoD)

**What happened**: while updating docs after the CI pass, the agent
discovered `progress.md`, `checkpoints.md`, and `PROMPT_LOG.md` had
only ever been committed once, in the Phase 0 commit (`7857612`).
Every update since (through Unit 8) existed correctly on disk but was
never committed — the version pushed to GitHub carried none of that
history. Caught by the agent itself, not the Pilot, while about to mark
a DoD item complete.

**Fix**: committed the full accumulated doc state (`7db5f33`) and
pushed. Root cause addressed in `checkpoints.md`'s per-unit loop:
Step 8 (C2) now requires doc updates and the code commit to happen
**together, in one commit**, rather than treating doc updates as a
trailing step easy to skip after the "real" commit.

### Action Item 7 — Sub-agent verifier pass

- Pilot: "yes." Agent stated PIOF for dispatching an independent
  subagent to review the build cold against SPEC.md's Verifier's
  brief — structure, accessibility, security — with no auto-fixing;
  findings would come back for Pilot review.
- Pilot: "yes." — C1 approved.
- Agent dispatched the subagent with SPEC.md's DoD, index.html,
  styles.css, check.sh, and ci.yml as its inputs.
- Subagent reported: all checkable DoD items pass. One real defect —
  CTA text/background contrast (~3.9:1) fails WCAG AA's 4.5:1
  threshold. Three latent, not-currently-triggered edge cases in
  check.sh's grep logic. No realistic security risk for a zero-JS
  static page beyond Google Fonts' inherent IP exposure (already
  accepted in Unit 1). CI workflow correctly scoped, no findings.
- Agent proposed this pass satisfies SPEC.md's DoD requirement for an
  intentional post-build stress test (distinct from the two natural
  catches).
- Pilot: "Make sure that these results are adequately documented, and
  presents recommendations, if any, for mitigating or resolving the
  problem." Agent added a "Sub-agent verifier findings" section to
  `progress.md` with a recommendation per finding: darken
  `--color-accent` to ~`#96491c` (≈6.2:1 contrast) for Finding 1;
  accept Finding 2's latent check.sh gaps as documented, out-of-scope
  limitations rather than fix them (fixing hypothetical inputs that
  don't exist in this project would itself be the over-engineering
  SPEC.md's Scope section warns against); no action needed for
  security or the CI workflow. Marked the DoD's mistake-catching and
  sub-agent-verifier items complete.
- Pilot: "The contrast defect is not really a concern. design
  implementation on this is just something that we're keeping at a
  minimum, so there's no need to address that matter further." Agent
  logged this as an explicit accepted-tradeoff decision in
  `progress.md` (not silently dropped, not treated as fixed) and
  updated the Snapshot: all build-side DoD items are now either
  checked or explicitly accepted, with only the demo-time
  "explainable in your own words" item remaining by nature.

### C4 — Dynamic reflection interview

- Pilot: "Let's commence on to the reflections.md and let's keep it
  short and simple." Agent asked four questions, each mapped to this
  project's own record per BUILD-ENGINE.md §12 (comprehension; the
  three Failure log entries; the CI run; reuse/consolidation), rather
  than a generic fixed list.
- Pilot answered all four in full, in their own words. Agent wrote
  `reflections.md` as a verbatim Q&A transcript, unedited — no
  paraphrasing or summarizing of the Pilot's answers, per BUILD-ENGINE's
  rule that this transcript is the Pilot's authentic voice, not the
  agent's.
- This closes C4. SPEC.md's DoD is now fully satisfied or explicitly
  accepted, except the demo-time "explainable in your own words" item,
  which is proven live rather than in advance.

### Repository cleanup + full audit

- Pilot: "clean up the working directory. make sure that all
  documentations are in respective sub-directories and there's nothing
  random or loose remaining in the root of the directory and also do
  the same for the repo. the directory structure locally should match
  that of the repo as well. Run a full audit on a local level and on a
  repository level against the specifications." Agent proceeded
  directly (explicit, detailed instructions already given, not a new
  design decision needing negotiation).
- Agent moved BUILD-ENGINE.md, SPEC.md, checkpoints.md, progress.md,
  reflections.md, and PROMPT_LOG.md into `docs/`, and check.sh into
  `scripts/`, using `git mv` to preserve history. Updated
  `.github/workflows/ci.yml`'s script path accordingly, and re-ran
  `scripts/check.sh` locally post-move to confirm it still passed
  before committing.
- Agent ran a full audit: structural DoD (script passes 5/5), scope
  (no JS, no extra pages, nothing beyond SPEC.md's Outputs), git
  history integrity (13 commits, no rewrites), working-tree
  cleanliness, and local-vs-repo structure match. Found two gaps,
  flagged rather than silently fixed: no `README.md` at repo root, and
  BUILD-ENGINE.md's Tier 2 local pre-commit hook was discussed but
  never actually implemented (only Tier 1/CI exists).
- Pilot shared a screenshot confirming CI #6 (commit `7172872`) passed
  in 6s on the new `scripts/check.sh` path.
- Pilot: "Yes, there should be a readme.md. Go ahead and give a
  high-level overview... You don't need to elaborate much on the
  internal build process because I'm still figuring that out. Make
  sure that all the image files in the working directory are inside of
  a subdirectory... Make sure all of the folders, documents, and files
  that need to be in the gitignore are in the gitignore. And yes, we
  did not touch on the local pre-commit hook so we can make an
  amendment on that." Mid-turn: "And make sure that the README has the
  appropriate badges. We don't need to overpopulate it." Also mid-turn:
  "You can add text-based tree diagrams and call graphs in the README
  if and where it may be appropriate."
- Agent: moved the two local-reference images into `artifacts/`;
  updated `.gitignore` to `artifacts/`, `.cursor/`, `.DS_Store`;
  implemented the Tier 2 pre-commit hook as `.githooks/pre-commit`
  (versioned) and activated it locally via
  `git config core.hooksPath .githooks`; wrote `README.md` with one CI
  status badge (kept minimal, no badge sprawl), a repo structure tree
  diagram, and a small call graph showing where `scripts/check.sh`
  runs (manual / pre-commit / CI) — no elaboration on the internal
  BUILD-ENGINE methodology, per the Pilot's instruction.
- Pilot: "You can take the build engine.md out. That doesn't need to be
  pushed because we didn't use that in its entirety. And the README
  just says next chapter. The readme should be named with a proper
  context documentation naming convention." Agent: untracked
  `docs/BUILD-ENGINE.md` (`git rm --cached`) and moved it to
  `artifacts/` alongside the other local-only reference material,
  since it was a reference methodology doc drawn from selectively, not
  used in full; updated both structure-tree diagrams (README.md,
  progress.md) to drop it from the listing. Renamed README.md's H1
  from `# Next Chapter` to `# README — Next Chapter (Week 1 Project)`,
  matching the `<Role> — <context>` naming convention used by every
  other doc in `docs/` (SPEC, Checkpoints, Progress, Prompt Log,
  Reflections).
- Pilot: "Can you add a P I O F Mapped against the assignment criteria
  in the README as well. However, you want to visualize that, be it a
  graph or a diagram or text, is fine. I just want that to be clear."
  Agent added a "P-I-O-F, mapped against the assignment criteria"
  section to README.md: a table mapping Purpose/Inputs/Outputs/Flow to
  this project's specifics and the exact assignment rubric line each
  satisfies, plus a small text-based flow diagram underneath for a
  quick visual read.
- Pilot: "Y and go ahead and deploy this to Netlify so that I have a
  shareable link to share with the group during presentation." Agent
  checked existing Netlify projects (found one unrelated site, nothing
  for this project), created a new site (`next-chapter-onepager`,
  team `josephc1417`), and deployed the current working directory via
  the Netlify MCP CLI proxy. Deploy succeeded (`state: ready`, 8s
  build) at https://next-chapter-onepager.netlify.app. Flagged that
  this was a one-time manual upload, not GitHub-connected continuous
  deployment — future pushes won't auto-update the live link without
  that wired up separately. Added the live link + a Netlify badge to
  README.md.
- Pilot: "You can incorporate the Netlify link inside of the README as
  well, now that it's been created, for easy access." Agent found the
  link was already in README (added in the prior commit) but as plain
  text, not clickable — converted it to a markdown link. This commit
  (`e2ce540`) was made without a matching doc update, breaking the
  Step 8 fix from Failure #3.
- Pilot: "And make sure that all corresponding context documentation
  has been updated and reflects the current changes and state." Agent
  caught its own miss on `e2ce540` and backfilled this entry, logged
  it as Failure #4 in `progress.md` (the Step 8 fix from Failure #3
  had silently stopped applying once work moved to informal post-C4
  requests), and updated `checkpoints.md`'s Step 8 text to state
  explicitly that the fold-docs-into-commit rule isn't scoped to the
  numbered unit loop. Also refreshed `progress.md`'s Snapshot, which
  had gone stale (missing README, BUILD-ENGINE removal, and the
  Netlify deploy). Separately caught `.netlify/` (local CLI state from
  the deploy) sitting untracked with no `.gitignore` entry — added it.
