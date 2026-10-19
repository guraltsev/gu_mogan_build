# Local patches, regrouped by change (v2)

Eight patches, one per change, made with `git format-patch` from the branch
`dev/200_27/split-fixes`. They apply, in order, to upstream head
(`upstream/main` = `c68a494fc`, fetched 2026-10-17; upstream had no newer commits):

```
git checkout -b my-branch upstream/main
git am gu_mogan_build/changes/pr-*/0001-*.patch
```

Applying them one after another with `git am` was done and succeeded. The resulting
tree is **identical** to the previous 13-patch branch (`dev/200_27/local-fixes`,
also saved as the tag `backup/local-fixes-before-split`), checked with `git diff`.
Formatting (`gf fmt`) is included in each patch, so there is no separate format
patch any more.

| # | Patch | Files |
|---|---|---|
| 1 | Skip the whole-document conversion in `get_remote_cursors` when there are none (repaint 220 ms -> 17 ms on a large document) | `edit_collab.cpp` |
| 2 | Delay the mode/focus toolbar refresh while the cursor moves; refresh at once after tree changes; notice same-path changes | `edit_interface.cpp/.hpp` |
| 3 | Style cache notices changed style and package files | `new_style.cpp` |
| 4 | Fix headless `-c` file conversion (explicit load/export, plugin formats) | `init_texmacs.cpp` |
| 5 | User keyboard layer `user-kbd-map` / `user-kbd-unmap` | `kbd-define.scm`, `kbd-define-test.scm`, `shortcut-edit.scm` |
| 6 | amsmath `aligned` and `gathered`: macro, LaTeX import and export | `env-math.stem`, `fromtex_post.cpp`, two LaTeX DRD files |
| 7 | Vertical alignment control for `aligned`/`gathered` in the focus bar and menu | `table-menu.scm` |
| 8 | Fix Enter in `aligned` nesting tables instead of adding a row | `math-edit.scm` |

The patches touch disjoint files, so each also applies on its own.

## Old numbering -> new

| Old patches (former `patches/`, now `dev-notes/` in each PR directory) | New |
|---|---|
| 4 | 1 |
| 5, 12, part of 8 | 2 |
| 13 | 3 |
| 2, 11, part of 8 | 4 |
| 3, part of 8 | 5 |
| 1, 6, 7 | 6 |
| 9 | 7 |
| 10 | 8 |

`../patches/` keeps the detailed notes from the work (how each problem was found,
measurements, caveats). They are still accurate; read them for the story behind a
patch.

## What was and was not checked

- Applying the patches in order: done (`git am`, no conflicts).
- Same result as before: the tree is byte-identical to the 13-patch branch, which
  was built and tested (`tests/headless-conversion/run-tests.sh` 31/31, key-press
  scripts, GUI checks reported by the user for the toolbar, `$`, alignment menu,
  `gathered` in `generic`).
- **Not done:** building each intermediate commit separately. The patches touch
  disjoint files and the C++ ones are independent, but only the final state was
  compiled.
- Formatting: `gf fmt --changed-since upstream/main` changes only the
  `operator tree ()` declaration in `edit_interface.cpp/.hpp` (clang-format 22 here,
  19 in CI). That change is not part of any patch; revert it after running `gf fmt`.
- Pushed nowhere.

## Not in these patches

- `user-config/my-init-texmacs.scm` (keybindings: `$`, `$$`, `Alt+Up/Down`) lives in
  `../user-config/`, not in the Mogan source.
- `-delete-style-cache` still deletes `__*` files, which never exist (the cache files
  are named by hash). Not fixed.
- `../issues/headless-c-conversion-broken.md` still lists one open item (export of
  an untitled buffer).
