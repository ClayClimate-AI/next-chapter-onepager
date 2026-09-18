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
