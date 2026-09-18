# CLAUDE.md

Static HTML/CSS one-page site (`index.html`, `styles.css`). **No JavaScript** — this is a hard constraint, not an oversight; don't add any, even for something that "should just be a small script."

`docs/SPEC.md` is the source of truth for what this page must be (exactly 3 sections, 1 CTA, scope). Read it before changing structure or content. `docs/checkpoints.md` defines the build loop and its gates; `docs/progress.md` is current state (read its Snapshot first); `docs/PROMPT_LOG.md` is the full prompt history.

## The one rule that bites if skipped

Every commit to this repo must update `docs/progress.md` and `docs/PROMPT_LOG.md` **in the same commit**, not after. This applies to every commit, including small unplanned edits outside any formal build unit — see `docs/progress.md`'s Failure log #3 and #4, where skipping this twice already caused real drift between the docs and git history.

## Gotchas

- `scripts/check.sh` (structural verification, zero dependencies) runs in CI automatically, but the local pre-commit hook does not activate on a fresh clone — run `git config core.hooksPath .githooks` once first.
- The Netlify deploy is a manual snapshot, not continuous deployment. Pushing to `main` does not update the live site.
- `artifacts/` (local reference images) and a `BUILD-ENGINE.md` methodology doc exist locally but are gitignored/untracked on purpose — don't re-add them to the repo.
