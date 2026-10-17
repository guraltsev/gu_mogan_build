# Local patches for Mogan

Applied on top of `origin/main` (as of 2026-10-17, base `c68a494fc`), branch
`dev/200_27/local-fixes` in the mogan checkout. Patches are `git format-patch`
output; apply with `git am <file>` (or cherry-pick from the branch).

## Applied (in the branch)

| # | Folder | Summary | Verified |
|---|--------|---------|----------|
| 1 | `01-amsmath-aligned/` | Import LaTeX `aligned` as a native TeXmacs `aligned` table | headless tex -> tmu |
| 2 | `02-headless-cli-conversion/` | Make `-headless -c in out` conversion work without an active view | headless tex -> tmu |
| 3 | `03-user-kbd-map/` | `user-kbd-map` / `user-kbd-unmap`: user keybindings always outrank built-ins, fixing "custom bindings overridden by lazy-loaded modules" | 22 Scheme checks pass; GUI untested |

Apply in order. Patch 2 was written against an older `main` and was re-resolved
against upstream's PDF special case (see its README). All patch files were
generated from the branch, so they apply to the base above, not to the older
commits they were originally written on.

## Not applied

| Folder | Summary | Why not applied |
|--------|---------|-----------------|
| `unapplied/qt-unicode-key-input/` | Stop truncating non-ASCII key text to `char` in `from_key_press_event` | Does not affect the Greek layout it was written for (Qt reports key code 177, which bypasses the changed branch); no known case needs it |

Kept only as a record. It was removed from the branch on purpose: no code for
problems that have not been reproduced.

Build and run: `../_docs/windows-build-setup.md`.
Built app: `<mogan>\build\dist-releasedbg\bin\MoganSTEM.exe` (console build) or
`<mogan>\build\dist-release\bin\MoganSTEM.exe` (no console), made by
`../scripts/build-releasedbg.cmd` / `build-release.cmd`.
