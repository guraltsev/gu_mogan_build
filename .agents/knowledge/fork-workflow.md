# Rolling fork workflow (decided 2026-10-21)

Goal: anyone can clone `github` (`guraltsev/mogan`) and build Mogan with all my patches. So the
fork's `main` is public and **append-only: never reset, rebase or force-push it.**

## Branches
| Branch | What it is | Rules |
|---|---|---|
| `upstream-main` | pure mirror of `upstream/main` (MoganLab) | no local commits; moved only with `git branch -f upstream-main upstream/main` (sync-main does it) |
| `main` | public build = `upstream-main` + every unmerged patch | only ever gets merge commits; fast-forward pushes only |
| `pr/<name>` | one change, one commit, based on `upstream-main` | the unit of a PR to upstream; deleted after upstream merges it |

Do NOT base new branches on `main` (the PR would carry every other patch) and do not use
`--changed-since=main` for `gf fmt`; use `upstream-main`. `gh pr create --base main --repo MoganLab/mogan`
is the upstream's `main`, unrelated to the fork's `main`.

## Routine
- New change: `git switch -c pr/<name> upstream-main`, commit, push the branch to `github`, open the PR
  against MoganLab/mogan. Add it to the build: `git switch main; git merge --no-ff pr/<name>`.
- Upstream moved: `scripts\sync-main.cmd` (fetch, fast-forward `upstream-main`, merge it into `main`).
  Then push `main` and `upstream-main` to `github` (plain pushes).
- README of the fork: `scripts/update-fork-readme.cmd -Commit` regenerates the generated section at the top
  (base commit, patch list with PR status) from the branches and `gh`; run it after sync/prune, then push `main`.
- A PR got merged upstream: sync first, then `scripts\prune-merged.cmd` (dry run; `-Apply`, and `-Remote` for
  the fork copies). Squash merges are invisible to `git branch --merged`, so it asks `gh pr list --state merged`.
  Deleting the `pr/*` branch changes nothing in `main`: the same content already arrived via upstream.

## Conflicts when syncing
Happens when upstream merged a PR in a *different final form* than my branch (reviewer edits, formatting).
Resolve only the conflicting hunks in favour of upstream (`git merge-file --theirs` on the stage 2/1/3 blobs,
or edit by hand). Do NOT use `git checkout --theirs <file>` on a file with unrelated patches of mine: it takes
upstream's whole file and silently drops them. After resolving, check `git diff` against the expectation
(e.g. a rebuilt `upstream-main` + remaining branches tree). Add/add conflicts in test files that are the
same change: take theirs.

## History
2026-10-21: after PRs #4744 #4745 #4753 #4755 were merged, `main` was merged with `upstream-main`
(fast-forward-pushable). The old `main` is kept as `backup/main-before-reset-2026-10-21`; `main-new` is obsolete.
`latex-user-table-envs` was retired as `archive/latex-user-table-envs`: all its patches are in `main` or were dropped.
The `pr/*` branches were NOT rebased onto the new base: they apply cleanly, and rebasing would duplicate patches
in the append-only `main`.
