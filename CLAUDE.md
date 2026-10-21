# Working in this Mogan checkout (Windows)

Before building, testing, touching LaTeX import/export, or using git here, consult
`.agents/knowledge/index.md` and read the file it points to for your task.

## Build and test (do this, not the xmake defaults)
- Build with the scripts in `scripts/`: `build-release.cmd` -> `build\dist-release`;
  `_build.cmd releasedbg dist-releasedbg` -> `build\dist-releasedbg` (console build). Run from PowerShell at
  the repo root; not while a `MoganSTEM.exe` from that dist is running.
- Do NOT use `xmake b stem` / `xmake r <test>`: `xmake r` expects `build\packages\stem\data\bin` (absent),
  and `xmake b stem` only fills `build\windows\x64\release`, whose exe has no Qt DLLs and fails silently.
- The exe takes its data directory from its own folder (`TEXMACS_PATH` is ignored). Run integration tests
  (`TeXmacs/tests/NNNN.scm`) against a dist; details in `.agents/knowledge/build-test-env.md`.
- Git Bash cannot capture the exe's console output: have the test write results with `string-save`.

## Worktrees
- **ALL worktrees live in `gu_mogan_build/worktrees/` and nowhere else.** Never create, build in, or modify
  anything outside this repo (no sibling `..\mogan-*` directories). Create/build/remove them only via the
  `worktree-*.cmd` scripts below (the scripts refuse to touch worktrees outside that folder).
- Worktrees are temporary (e.g. a clean `upstream/main` baseline, or a PR branch built beside `main`).
  Remove them (`git worktree remove`) once the task is done; the only permanent checkout is the main one.
  Branches stay; worktrees do not.

## Worktree scripts (skills: worktree-add, worktree-build, worktree-remove, mogan-configure)
All in `gu_mogan_build/scripts/`, each with a `.cmd` wrapper; run from PowerShell, refs are a branch or commit id.
- `worktree-add.cmd <ref>` -> creates `gu_mogan_build\worktrees\<ref>`.
- `worktree-build.cmd <ref> [release|releasedbg]` -> builds there into `<worktree>\build\dist-<mode>`.
- `worktree-remove.cmd <ref> [-Force]` -> deletes that worktree (branch stays).
Use these instead of hand-rolled `git worktree` + build commands.

## Branches (rolling fork; details in `.agents/knowledge/fork-workflow.md`)
- `upstream-main` mirrors MoganLab; `main` = it + my unmerged patches and is append-only (never reset/force-push).
- New work: `git switch -c pr/<name> upstream-main` (not from `main`); `gf fmt --changed-since=upstream-main`.
- After upstream changes: `scripts\sync-main.cmd`; after a PR is merged: `scripts\prune-merged.cmd`, then `scripts\update-fork-readme.cmd -Commit`.
