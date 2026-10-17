# 03 - User keyboard layer (`user-kbd-map`, `user-kbd-unmap`)

Patch: `0001-Add-user-keyboard-layer-user-kbd-map-user-kbd-unmap.patch`
(commit `6a5355604` on `dev/200_27/local-fixes`)

This is the real fix for "my custom keybindings stop working after startup".
A Qt key-text change that was tried first is in `../unapplied/qt-unicode-key-input/`;
it does not affect a Greek layout on Windows and is not in the tree.

## Files in this folder

| File | Contents |
|------|----------|
| `0001-Add-user-keyboard-layer-user-kbd-map-user-kbd-unmap.patch` | the change (`git am`) |
| `USAGE.md` | syntax, semantics, migration from `kbd-map`, fallback for older builds, troubleshooting |
| `examples/example-init.scm` | a complete `my-init-texmacs.scm` using the macros, with the fallback shim on top |
| `examples/fallback-shim.scm` | the compatibility shim on its own |

## What
Two new macros for user bindings, with the same syntax as `kbd-map` / `kbd-unmap`:

```scheme
(user-kbd-map
  (:mode in-math?)
  ("alpha" "<alpha>")      ; key name
  ("α"     "<alpha>"))     ; literal Unicode key, same key as "alpha"
(user-kbd-unmap (:mode in-math?) "| `")
```

Bindings made with them always take precedence over built-in bindings
(`kbd-map`, `utf8-kbd-map`, `delayed-kbd-map`, plugins), regardless of load order.

## Why (investigation)
- Key lookup returns the **first** matching entry of a per-key list, and each
  registration puts its entry at the **front**. Last registration wins.
- Until 2026-07-19 `init-research.scm` ended with `(lazy-keyboard-force #t)`,
  so all built-in keyboard modules were loaded **before** the user init file
  (`my-init-texmacs.scm`) ran, and user bindings were registered last.
- `a9ea62bac` ("[1143] remove forced lazy-keyboard load at startup") removed
  that for startup speed; later commits (`db571d083`, `b5ab3decd`) moved the
  `lazy-keyboard` registrations into plugins initialised on idle timers
  (`lazy-plugin-initialize`, `(delayed (:idle 10) ...)`). Built-in modules (e.g.
  `(keyboard text-kbd-utf8)`, which binds `alpha -> <#3B1>`) now register
  **after** the user init file and shadow its bindings.
- Evidence (log, 2026-10-17): right after the init file ran `alpha` resolved to
  the user's binding; after the first keypress it resolved to `("<#3B1>" "")`.
- Separately, `utf8-kbd-map ("α" ...)` stored the key `<alpha>`, but
  `handle_keypress` (`src/Edit/Interface/edit_keyboard.cpp`) strips the brackets
  from single named symbols, so Scheme sees `alpha`. Those bindings never match
  (hex-coded symbols such as `<#FFE5>` keep their brackets and do match).

Rejected: forcing all plugins at startup when a user init file exists (slow for
everyone with an init file); a fixed delay in the init file (timing guess);
guessing "user code" via a global flag (delayed blocks escape it).

## How (`TeXmacs/progs/kernel/gui/kbd-define.scm`)
- Two layers in the existing per-key list. Invariant: all user entries precede all
  built-in entries. `kbd-user-table` (key -> conditions registered by the user)
  records which entries are user entries, so entry data is unchanged.
- `kbd-insert-key-binding` (built-in) skips a registration whose conditions are
  already held by a user entry, and inserts after the user entries otherwise.
- `kbd-insert-user-key-binding` replaces any same-condition entry and inserts at
  the front.
- `user-kbd-unmap` inserts a tombstone (`kbd-unmapped`) in the user layer.
  `kbd-resolve-map` skips tombstones (only used once a tombstone exists, so the
  per-keypress path is unchanged otherwise); other conditions still fall back.
- `user-kbd-key`: ASCII key specs are untouched; tokens with non-ASCII characters
  are converted to Cork and, like the C++ side, a single named symbol loses its
  `<>` (`α` -> `alpha`, `￥` -> `<#FFE5>`). One macro serves both what
  `kbd-map` and `utf8-kbd-map` do.
- `kbd-map-one`, `kbd-map-body`, `kbd-remove-body` gained `*` variants taking the
  binder, so user macros reuse them; the old names are thin wrappers.
- `TeXmacs/progs/source/shortcut-edit.scm`: saved user shortcuts load via
  `user-kbd-map`.

No startup cost: built-in modules still load lazily.

## Verify
```
build\dist-releasedbg\bin\MoganSTEM.exe -headless -d -b TeXmacs\progs\kernel\gui\kbd-define-test.scm ^
  -x "(catch #t (lambda () (regtest-kbd-define) (quit-TeXmacs)) (lambda args (display args) (exit 1)))"
```
Expect `22 correct, 0 failed` (6 existing + 16 new: user beats later/earlier
built-in, same and different conditions, condition-false fallback, unmap masks
later built-in, unmap keeps other conditions, key normalisation, literal `α`,
multi-key sequence). Tests must run against an **installed** copy
(`xmake install -o ...`): the app takes its data directory from the exe's folder
and ignores `TEXMACS_PATH`.

## Caveats
- Existing init files using plain `kbd-map` keep the old behaviour until renamed
  to `user-kbd-map` (and `kbd-unmap` -> `user-kbd-unmap`).
- Tombstone entries are visible to code that reads the map with `ctx-find`
  (e.g. the shortcut editor listing); they show as `kbd-unmapped`.
- Inverse/reverse tables (menu shortcut labels) are not layer-aware.
- Built-in `utf8-kbd-binding` still has the `<alpha>` vs `alpha` mismatch; fixing it
  is a separate five-line change (apply the same bracket stripping) not done here.
- Not formatted with `gf fmt` (not installed); no `devel/<n>.md` task doc added
  (no task number given).
- GUI behaviour (typing alpha in math mode) was not exercised by me; the Scheme
  tests and a headless load of the converted init file were.
