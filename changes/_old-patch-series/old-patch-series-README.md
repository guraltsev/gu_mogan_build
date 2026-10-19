# Local patches for Mogan

> **Superseded by `../patches-v2/`** (the same changes regrouped into eight patches that apply to upstream head). This folder keeps the working notes.

Applied on top of `origin/main` (as of 2026-10-17, base `c68a494fc`), branch
`dev/200_27/local-fixes` in the mogan checkout. Patches are `git format-patch`
output; apply with `git am <file>` (or cherry-pick from the branch).

## Applied (in the branch)

| # | Folder | Summary | Verified |
|---|--------|---------|----------|
| 1 | `01-amsmath-aligned/` | Import LaTeX `aligned` as a native TeXmacs `aligned` table | headless tex -> tmu |
| 2 | `02-headless-cli-conversion/` | Make `-headless -c in out` conversion work without an active view | headless tex -> tmu |
| 3 | `03-user-kbd-map/` | `user-kbd-map` / `user-kbd-unmap`: user keybindings always outrank built-ins, fixing "custom bindings overridden by lazy-loaded modules" | 22 Scheme checks pass; GUI untested |
| 4 | `04-skip-remote-cursor-ir/` | `get_remote_cursors()` did O(document size) work on every repaint even with no collaborators; now returns early. Repaint ~220 ms -> 17 ms on an 870 KB doc | std-bench log, same file before/after |
| 5 | `05-debounce-toolbar-refresh/` | Cursor moves no longer rebuild the mode/focus toolbars synchronously; refresh 150 ms after the cursor is still (max 600 ms). Fixes choppy math editing in large docs | hand-tested; probe script `05-debounce-toolbar-refresh/probe-focus-icons.scm` |
| 6 | `06-gathered-environment/` | New `gathered` environment (centered rows, one column, one equation number inside `equation`) + amsmath LaTeX export; with Alt+Down/Up in the user init to turn `equation(*)` into multiline | tree structure + LaTeX export checked headless; layout/GUI not checked |
| 7 | `07-gathered-latex-import/` | LaTeX import of `gathered` as a native table; fixes the `[t]`/`[b]` argument of `aligned` and `gathered` | headless tex -> tmu, 8 cases; old build compared |
| 8 | `08-gf-fmt/` | `gf fmt` layout changes for patches 2, 3 and 5 (squash upstream); how to run `gf fmt` on this Windows machine | key-press tests unchanged after reformat |
| 9 | `09-aligned-valign-gui/` | Focus-bar drop-down and Focus-menu entry to set Axis/Top/Middle/Bottom alignment of `aligned`/`gathered` blocks | headless menu-expand and value round trip; GUI not seen |
| 10 | `10-aligned-enter-nesting/` | Enter in `aligned` no longer wraps the table into a cell (legacy `kbd-enter` ignored that `aligned` already holds a table) | both module load orders, headless |
| 11 | `11-headless-c-target-format/` | `-headless -c x.tm out.tex` no longer writes plain text only: format of the output file comes from its suffix after loading plugins | `tests/headless-conversion` 31/31; 16 fail without it |
| 12 | `12-toolbar-refresh-on-tree-change/` | Toolbars refresh immediately after tree changes (`$ $`, Ctrl+Tab) and notice same-path changes; only cursor moves are delayed | builds, tests pass; GUI behaviour to be checked |
| 13 | `13-style-cache-stamp/` | Style cache key includes the newest package/style file date and count, so macros added to packages are no longer hidden by stale cached styles (the `generic` `<gathered>` problem) | cache growth/reuse and PDF render checked |

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
