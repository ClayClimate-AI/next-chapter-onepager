# Checkpoints — Gate Reference & Per-Unit Loop

> Companion to `SPEC.md` (source of truth) and `progress.md` (living state).
> Derived from BUILD-ENGINE.md's C0–C4 gates, with C1 made explicit as its
> own assert/evaluate cycle per the Pilot's stated working style.

## Roles

- **Pilot** — the human. Owns every decision, every approval, every commit call.
- **Agent** — the AI. PIOFs, asserts, implements only after explicit approval,
  never self-approves past a gate.

## The gates

| Gate | Where | What it guards |
|------|-------|----------------|
| C0 | Before any building | SPEC.md understanding + DoD + scope confirmed by the Pilot |
| C1 | Before any implementation, per action item | Assertion evaluated and explicitly approved by the Pilot |
| C2 | After implementation, per action item | Pilot review against SPEC.md → commit → docs updated → check-in |
| C3 | On any failure | Failure logged before it's patched |
| C4 | After all DoD items are met | Reflection interview → `reflections.md` |

## The per-action-item loop (C1 → C2, in full)

For each unfinished item in SPEC.md's Definition of Done:

1. **PIOF** — Agent states Purpose / Inputs / Outputs / Flow for this one
   action item only. No implementation yet.
2. **Pilot confirms understanding** of what the action item requires —
   opportunity to interject if anything is unclear or SPEC.md needs
   amending first.
3. **Assertion** — Agent asserts what it will implement and how.
4. **Evaluation** — Pilot evaluates the assertion against SPEC.md
   (source of truth / authoritative criteria).
5. **Gate C1** — Implementation begins **only** on the Pilot's explicit
   approval. No approval, no code.
6. **Implement** — the minimum that satisfies the action item.
7. **Pilot review** — Pilot evaluates what was implemented against
   SPEC.md.
8. **Gate C2** — on Pilot confirmation: one commit, using a naming
   convention that names the action item and what was verified.
9. **Update living docs** — `progress.md` (Snapshot, DoD checklist, Unit
   log), `PROMPT_LOG.md` (append every exchange since its last update,
   not just a summary line), and this file if the gate reference itself
   needs a note.
10. **Check-in gate** — open floor for clarifying questions. If none,
    proceed.
11. **Loop** — Agent PIOFs into the next unfinished SPEC.md DoD item.

Repeat until every SPEC.md DoD checkbox is complete → **C4**: reflection
interview, `reflections.md` written verbatim in the Pilot's own words.

## On failure (C3)

If an implementation or check fails at any point: log the failure in
`progress.md`'s Failure log **before** touching a fix. Fix, then re-run
the step that failed. No silent patches.

## On drift

If, at any PIOF or evaluation step, the actual work looks like it no
longer matches SPEC.md: **pause, don't patch.** Bring it back to the
Pilot, amend SPEC.md if needed, log the amendment in `progress.md`,
then resume.

## Resume protocol (cold start)

1. Read `progress.md`'s Snapshot.
2. Cross-check the DoD checklist, Unit log, Failure log, Amendments log.
3. Cross-check actual git history + CI status against what `progress.md` claims.
4. State the current action item + current gate + the ONE next action.
5. Wait for the Pilot.
