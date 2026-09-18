# The Build Engine — Full Sequence Documentation

> **Companion to the `builder-loop` skill.** The skill (`SKILL.md`) is the *invokable*
> form — short, imperative, "do this now," triggered with `/builder-loop`. This document
> is the *explanatory* form — what each part is, why it exists, and how the pieces fit.
> When you change one, change the other so they stay in sync.

---

## 1. What this is (in one paragraph)

The Build Engine is a **reusable way of working with an AI on an assignment** — especially
new/unfamiliar material — that keeps the human (the **Pilot**) in command and builds
genuine understanding instead of unverifiable output. It separates the **system** (the
loop, guardrails, checkpoints — identical every time) from the **subject** (the specific
deliverable — filled in from whatever source material is in context). Governing motto:
**a green checkmark is not proof; a contract is proof.**

## 2. The two roles

- **Pilot** = the human. Owns every decision, the reflective journal, and the reflection answers.
- **Agent** = the AI. Pre-fills from source, proposes, implements to contract. Never advances
  past a human checkpoint. Never writes the Pilot's reflection.

## 3. System vs. Subject (the core idea)

| | Stays the same every time (SYSTEM) | Filled per assignment (SUBJECT) |
|---|---|---|
| Examples | guardrail ladder, the loop, checkpoints, protocols | the data, imports, tests, deliverables |
| Who fills it | nobody — it's the engine | agent pre-fills from source, Pilot refines |

## 4. The governing rule

**Once source material is in context, pre-fill — then refine with the Pilot.** A pre-filled
draft is the *start* of the conversation, not a finished artifact. If there's no source
material yet, the agent asks for it — it never invents a subject.

## 5. Operating principles (always on)

- **Trust but verify** — green ≠ correct output.
- **Smallest functional working product** — build the minimum that satisfies the contract;
  add complexity only when a contract demands it. The anti-over-engineering rule.
- **Build incrementally, never all at once** — one unit at a time; never generate the whole
  deliverable in a single shot.
- **A local pass is subjective; a repository pass is objective** — see §10.
- **Diff actual-vs-declared** dependencies before any full run.
- **One unit = one commit.** Log real failures BEFORE fixing them.
- **Record decisions, not just failures** — tradeoff/non-obvious fixes get a minimal ADR (§11).

## 6. The amendment rule (unknowns & drift)

Understanding at Step 0 is a snapshot; building is empirical. The engine expects reality to
contradict the plan sometimes. When an unknown surfaces, or the built work drifts from the
agreed contract:
1. **Pause — do not silently patch.** A missing rule is a *contract* failure, not a code failure.
2. **Loop back to C0** — amend the P-I-O-F / DoD / Scope, state what changed and why.
3. **Pilot re-approves**, then work continues.

At every checkpoint, a quick **drift check**: does this still match the C0 contract? If not,
decide with the Pilot — fix the code, or amend the contract. **Silent change is a failure.**

## 7. The Guardrail Ladder (L0–L5 + SOP)

Each layer is a gate that makes a class of silent failure *loud*.

```
  L5  CI + hooks ......... same gates on a clean machine (push) + local pre-commit
  L4  Pre/post asserts ... integrity around EVERY transform
  L3  Tests as contract .. TDD; a known-bad input MUST fail
  L2  P-I-O-F ............ plan before code   == Checkpoint C1
  L1  Setup gate ......... exits 0 ONLY if every real dependency is present
  L0  Bubble ............. isolated environment per project
  SOP Specs ............. Product_Spec (wins) + Tech_Spec = standing orders
```

| Layer | Name | Rule it enforces |
|-------|------|------------------|
| 0 | Bubble | Isolated environment per project (e.g. project-local `.venv`). |
| 1 | Setup gate | Exits 0 only when every dependency the work actually uses is present. |
| 2 | P-I-O-F | Purpose, Inputs, Outputs, Flow before code. This IS C1. |
| 3 | Tests as contract | Test first (TDD). A known-bad input MUST fail. A test that can't fail isn't a gate. |
| 4 | Pre/post assertions | Integrity checks before and after every transform. |
| 5 | CI + hooks | Phase 0 gates re-run on a clean runner on push; local pre-commit runs them early. |
| SOP | Specs | Product_Spec (wins on conflict) + Tech_Spec are the standing orders. |

## 8. The full sequence, start to finish

```
STEP 0  Initial P-I-O-F + DoD + Scope  → C0 (Pilot confirms understanding)
   │
   ▼
Session-start protocol  (read docs, run setup gate, report deps, state next action → WAIT)
   │
   ▼
PHASE 0  bubble → deps → setup gate → failing tests → install → diff → specs → AGENTS → CI/hooks
   │        (dependency/env decisions → minimal ADR)
   ▼
BUILDER LOOP  (repeat per unit):
   P-I-O-F → C1 → test-first → implement → Pilot runs → C2 (commit+push+CI) / C3 (log→fix→ADR?)
   │
   ▼
DoD met + CI green
   │
   ▼
C4  Dynamic reflection interview → reflections.md (verbatim Q&A)  → deliverable done
```

### Step 0 — Initial P-I-O-F + DoD + Scope (comprehension pass)

Runs **once, first**, on the *whole* assignment (distinct from the per-unit P-I-O-F, which
plans a single code unit). Its job is Pilot comprehension before any building.

- **Purpose** — what the assignment is really asking, and why.
- **Inputs** — what you're given (source docs, data, starter code, libraries, prerequisites).
- **Outputs** — what must be produced (deliverables, artifacts, exact form).
- **Flow** — how it moves start→finish; the major parts and how they connect.
- **DoD (Definition of Done)** — a concrete, checkable completion contract. Derived from the
  actual source; unstated criteria flagged as assumptions.
- **Scope & Constraints** — In-scope / Out-of-scope (the over-engineering defense) + fixed rules.
- **Diagrams when they help** — text trees (structure), call graphs (how steps feed each other),
  mermaid (end-to-end flow / decisions).

Ends at **C0**: the Pilot confirms understanding + DoD + scope before anything is built.

### Phase 0 — setup before real work

1. Create the Bubble (isolated env) and activate it.
2. Draft the dependency list from ACTUAL usage.
3. Write a setup gate that checks every dependency (exits 0 only if all present).
4. Add failing tests (TDD) for known-bad cases.
5. Install → setup gate exits 0 → tests green. *(A dependency/env discrepancy resolved with a
   real decision → minimal ADR.)*
6. Diff declared vs. actual deps; fix gaps.
7. Pre-fill Product_Spec + Tech_Spec from source; refine with Pilot.
8. Place AGENTS rules.
9. Wire Layer 5 (CI + pre-commit hook) to run the same gates.
10. ONLY THEN start Unit 1 at C1.

### The Builder Loop — per unit

1. **P-I-O-F** — state Purpose/Inputs/Outputs/Flow for the unit. No code yet.
2. **C1** — Pilot approves the plan before any code.
3. **Test first** — write the assertion that locks the contract; confirm known-bad fails.
4. **Implement** — the minimum to satisfy the contract.
5. **Pilot runs it** — the human executes; the agent does not self-verify past this gate.
6. **On failure → C3** — log the failure before touching the fix; if the fix carries a decision, add an ADR. Then fix and re-run.
7. **On success → C2** — one atomic commit (recording unit + what was tested + what's validated), then push and confirm CI is green.
8. Loop to the next unit.

## 9. The checkpoints (human gates)

| Gate | Where | What it guards |
|------|-------|----------------|
| C0 | After Step 0, before any setup | Understanding + DoD + scope confirmed by the Pilot |
| C1 | After P-I-O-F, before code | Plan approved before implementation |
| C2 | After a unit passes | Atomic commit (message records unit + what was tested + what's working/validated); then push → CI green |
| C3 | On any failure, before the fix | Failure logged before it's patched (ADR added if the fix carries a decision) |
| C4 | After DoD met + CI green | Dynamic reflection interview → `reflections.md` as a verbatim Q&A transcript; Pilot authors every answer |

### 9a. Optional agent auto-spawn (opt-in, per run)

By default the loop is single-agent. At the *start* of a run, the skill asks the Pilot: run
**solo** (default) or **with a specialized agent**? This removes the burden of deciding *when* to
bring an agent in — the Pilot decides only *whether*; the loop knows *where* (fixed entry points).

If an agent is selected, it **auto-spawns at its documented entry point**, under three inviolable
rules:
1. **Bounded** — spawns only at its fixed point. `be-reviewer` = **C2** (after the unit passes,
   before the commit). No other point.
2. **Announced** — the loop states "auto-spawning [agent] now for [purpose]" before spawning, so
   the Pilot always knows what's happening.
3. **Verdict → Pilot → decision** — the agent (an independent, read-only subagent) returns PASS
   (cited) or NEEDS_CHANGES (list). The verdict goes to the Pilot; the commit happens only after
   Pilot approval. The agent never commits and never crosses a human gate.

This keeps the automation fully human-in-the-loop: hands-free at the trigger point, but every
handoff is announced and every verdict is the Pilot's to act on. Future agents (e.g. a
`be-tester` at the test-first step) get their own fixed entry points when added. See
`multi-agent-design.md` for the fuller crew blueprint.

## 10. Layer 5 — why CI + hooks matter

A **local pass is a subjective claim**: "tests passed, exit code 0" on your machine is
entangled with your environment (installed packages, Python version, uncommitted files).
Nobody can verify it. **CI makes it objective**: a clean machine that has never seen your
setup clones only what you committed, follows only your declared instructions, and runs your
gates. Green there proves the result is reproducible — *anyone* following your instructions
gets it too. It also catches honesty gaps (e.g. a dependency you forgot to declare but had
installed locally).

Two gates, two moments — both run the **same** Phase 0 gates:

```
   LOCAL, before commit            REPOSITORY, after push
   ┌──────────────────┐            ┌──────────────────────┐
   │ git pre-commit    │   push →   │ CI (GitHub Actions)   │
   │ fast, YOUR machine│            │ clean machine, reruns │
   │ (subjective)      │            │ gates (objective)     │
   └──────────────────┘            └──────────────────────┘
   catches mistakes early          proves it's reproducible
```

**Tiers** (implement bottom-up; stop at "well-rounded," don't over-engineer):
- **Tier 1 (bare minimum):** CI on push → clean env, install declared deps, run setup gate + contract tests.
- **Tier 2:** local `pre-commit` hook runs the same gates; optional `commit-msg` to enforce the C2 record format.
- **Tier 3 (notebooks):** execute the notebook end-to-end in CI (`nbmake` / `nbconvert --execute`) so "runs from a fresh kernel" is enforced, not claimed.

Consequence for the DoD: a unit isn't truly **done** until its gates pass **in CI**, not just locally.

## 11. ADRs — recording decisions

An **ADR (Any Decision Record)** captures a *decision and its why* — something the failure log
and commit message don't. It pairs with C3: **C3 logs the symptom; the ADR records the reasoned
decision.** Write one when a fix or choice carries a tradeoff or a non-obvious rationale (a
version pin, a library swap, a kernel/environment change, a workaround). Trivial, self-evident
fixes stay in the commit message. Records live in `docs/adr/`, numbered (`0001-...md`).

Rule of thumb: *if someone cloning your repo would ask "why is this done this way?", it's an ADR.*

Minimal template:
```
# <NNNN> — <short title>
## Status
Accepted | Superseded by <NNNN> | Proposed
## Context
What situation/discrepancy forced a decision (the failure, the constraint).
## Decision
What was chosen, and the alternatives considered but rejected.
## Consequences
What this makes easier/harder, and anything a future reader must know.
```

## 12. C4 — the dynamic, verbatim reflection interview

The sequence ends with `reflections.md`, produced by an interview **after the DoD is
objectively met (CI green).** Two things make it different from a generic reflection:

**Dynamic — mapped to the real experience.** The questions are NOT a fixed list. The agent
reads *this project's own record* — the C0 contract and any amendments, the C3 failure logs,
the ADRs, and the C2 commit trail — and generates questions mapped to what actually happened.
A question might reference the exact failure you hit, the exact decision an ADR recorded, or
the exact unit that drifted. No two projects produce the same questions, because no two
projects produce the same trail. Coverage stays comprehensive across these dimensions:
comprehension of what was asked · new territory · what the work did · verification · change &
drift · how the sequence shaped *this* build · local-vs-objective proof · consolidation & reuse.

**Verbatim — the Pilot's authentic voice.** `reflections.md` is a transcript: each question as
asked, and the Pilot's answer **word-for-word**, in Q&A form, unedited. There is no right or
wrong answer. The agent asks and records faithfully — it never drafts, paraphrases, summarizes,
or "improves" the answers. This transcript is the authentic evidence of how the Pilot actually
thought and what they truly learned — proof the work was **piloted, not merely generated.**

## 13. Living state — progress.md & checkpoints.md (resumability)

The sequence keeps two **living context documents**, updated *as a step of passing every gate*
(C0–C4), never at the end. Their purpose is **resumability**: at any moment — after a break, a
crash, or when a fresh session starts cold — they tell you what was started, what's done, where
you left off, and what remains.

- **`progress.md`** — the single source of "where am I?": a Snapshot (current stage, checkpoint,
  next single action), the DoD checklist, a Unit log (one verified unit = one commit), a Failure
  log, and an Amendments log. It mirrors the git history in human-readable form.
- **`checkpoints.md`** — the gate reference (C0–C4) plus the resume protocol; may be copied into
  each project.

Both use call graphs and text-tree diagrams where they add clarity. The update path:

```
  C0 pass ──► write DoD + stage into progress.md
  C1 pass ──► add unit (planned) to Unit log
  C2 pass ──► mark unit verified, record commit + CI
  C3 hit  ──► append Failure-log row (+ ADR reference)
  amend   ──► append Amendments row
  C4 pass ──► mark reflections.md done → deliverable complete
```

**Resume protocol** (cold start): read `progress.md` Snapshot → Unit/Failure/Amendment logs →
cross-check git history + CI status → run the setup gate → state current unit + checkpoint +
ONE next action → WAIT for the Pilot. This is the session-start protocol, grounded in the
living state instead of memory.

## 14. How to use both resources

- **`/builder-loop`** — invoke the skill at the start of an assignment (after the source
  material and spec are in context). It drives the sequence and stops at each human gate.
- **This document** — the reference for what the sequence means and why. Read it, revise it, or
  drag it into a session when you want the AI to have the full rationale, not just the steps.

## 15. Starter files (GitHub)

For the Layer 5 wiring on GitHub, the engine uses:
- `.github/workflows/ci.yml` — GitHub Actions on push: clean Ubuntu runner → set up Python →
  install declared deps → run setup gate → run contract tests (Tier 1); optional notebook
  execution step (Tier 3).
- a `pre-commit` hook (Tier 2) that runs the same gates locally.

These reuse the existing Phase 0 gates — they don't add new verification logic. The exact
dependency list and gate commands are filled from the actual assignment at Phase 0.
