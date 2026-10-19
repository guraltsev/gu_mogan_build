# Design: a minimal Scheme API to pop up a menu

Status: design only, nothing implemented. Needs a small change to the Mogan sources (C++,
one rebuild). Scope was cut down on purpose: **expose the menu machinery that already exists
to Scheme; add no new menu handling.**

## 1. Goal and scope

Scheme code (a key binding, a click handler) can pop up an existing Scheme menu
(`tm-menu` / `menu-bind`) at a place it chooses.

Everything else about the popup is what Mogan menus already do: click an item to run it,
Esc or a click elsewhere closes it and does nothing, the item's action is an ordinary Scheme
action. Nothing about how menus are built, drawn or dispatched changes.

**Not in scope** (and not needed by the core): letter selection, telling Scheme that the menu
was dismissed, return values from C++, changes to the menu DSL, new widget types. Letters are
the one thing a user may miss; see section 5.

## 2. What exists today (read from the sources, not run)

- **Right-click already pops up a Scheme menu**, in `edit_interface_rep::mouse_adjust`
  (`src/Edit/Interface/edit_mouse.cpp` ~l. 247-275):

  ```
  SERVER (menu_widget ("(vertical (link " * menu * "))", wid));  // Scheme menu by name
  widget popup_wid = ::popup_widget (wid);
  popup_win        = ::popup_window_widget (popup_wid, "Popup menu");
  set_position (popup_win, wx + ox + x, wy + oy + y);
  set_visibility (popup_win, true);                // the menu is shown here
  send_keyboard_focus (this);
  send_mouse_grab (popup_wid, true);               // -> QMenu::exec (): blocks
  ```

- `qt_menu_rep` (`src/Plugins/Qt/qt_menu.cpp`) wraps a real `QMenu`: `SLOT_POSITION` moves it,
  `SLOT_VISIBILITY` shows or hides it, `SLOT_MOUSE_GRAB` calls `exec ()`.
- Choosing an item only **queues** a command: `QTMCommand::apply` calls
  `the_gui->process_command`, which adds a `QP_COMMAND` event to the main queue.
- Editor methods reach Scheme through `src/Scheme/Glue/glue_editor.lua`; precedent:
  `show-ghost-popup` (`editor.hpp` virtual, `edit_interface.hpp/.cpp`, glue entry).

The point to notice: the menu is already **shown** by `set_visibility`; the blocking
`exec ()` is a separate, last step. A menu shown without that step behaves like a menu-bar
menu: Qt owns it, and a chosen item comes back as a queued command.

## 3. Proposal

### 3.1 C++ (about 30 lines, no change to existing behaviour)

One new editor method, declared in `editor.hpp` and `edit_interface.hpp`:

```
void edit_interface_rep::show_popup_menu (string menu, string anchor, SI x, SI y);
```

It does the right-click sequence **without the last line** (`send_mouse_grab`), and with the
position taken from `anchor`:

| `anchor` | position |
|---|---|
| `"cursor"` | just below the text cursor (`get_cursor ()`: `cu->ox`, `cu->oy + cu->y1`), converted like `mouse_adjust` does |
| `"mouse"` | the pointer position at the call (`QCursor::pos ()`) |
| `"xy"` | the given `x`, `y` (what a click handler already has) |

Plus one glue entry in `glue_editor.lua` (`show-popup-menu`, string string int int; plain
types, nothing new for the glue). `mouse_adjust` is **left as it is**; the new method repeats
a few lines rather than refactoring the right-click path.

Cleanup reuses what right-click does: the old `popup_win` is destroyed on the next mouse event
and before a new popup is created (never while its menu is visible).

### 3.2 Scheme API

```scheme
(popup-menu 'copy-to-menu 'cursor)      ; from a key binding
(popup-menu 'copy-to-menu 'mouse)       ; from a click
(popup-menu 'copy-to-menu 100 240)      ; at x y
```

`popup-menu` is a thin wrapper that maps the second argument to the glue call. The caller
says where; nothing is guessed. The menu is an ordinary named Scheme menu, for example:

```scheme
(tm-menu (copy-to-menu)
  ("LaTeX" (clipboard-copy-export "latex" "primary"))
  ("HTML"  (clipboard-copy-export "html" "primary")))

(user-kbd-map+ ("C-C" (popup-menu 'copy-to-menu 'cursor)))     ; Ctrl+Shift+C
```

### 3.3 "Which item was chosen": Scheme only, no C++

Each entry's action already runs Scheme, so it can report the choice itself. An optional
helper builds the entries and keeps the callback on the Scheme side:

```scheme
(popup-menu-items 'cursor '(("LaTeX" . latex) ("HTML" . html))
  (lambda (choice) ...))
```

It generates entries whose action calls the callback with the item id. **Dismissal gives no
callback** (nothing is told when Esc is pressed), which is exactly "Esc does nothing". Telling
Scheme about a dismissal would need a C++ hook (`aboutToHide`), i.e. new menu handling, so it
is left out.

## 4. Why non-blocking, and why normal menus are fine

A Scheme key binding runs inside `qt_gui_rep::update ()` (key presses are queued by
`QTMWidget::keyPressEvent` and processed there; `update ()` refuses to nest, "NESTED UPDATING:
This should not happen"). If that code started a **blocking** menu (`QMenu::exec`, as
right-click does), Mogan's own pump would be frozen until the menu closed: queued events,
delayed commands and repaints pile up, and keys typed just before the menu appeared are
handled by the editor afterwards instead of by the menu.

Ordinary menu-bar and left-click menus do not have this problem: Qt opens them from its own
event handling, outside `update ()`, and item activation only queues a command. The new popup
should behave exactly like them, so it stops after `set_visibility` and never calls `exec`.
The existing right-click popup is the one blocking case; it is left untouched.

## 5. What you get and what you do not

Get, with no new menu code: click an item, Esc or click-away dismissal, ordinary menu look,
the whole menu DSL (conditions, loops, submenus, translation), a position chosen by the
caller, the choice reported to Scheme.

**Do not get, from commit 1: choosing by a letter.** Qt supports it (`&l` in a label), but
Mogan escapes every `&` (`QTMAction::set_text`, `QTMMenuHelper.cpp`: `replace (s, "&", "&&")`),
so it is off. Turning it on is **commit 2** of the series (decided: a separate commit, see
section 8b). It is kept apart because it touches how every menu label is built, while
commit 1 touches no existing menu code.

## 6. Risks and spikes (do first, small)

| # | Question | If wrong |
|---|---|---|
| a | A `QMenu` shown with `setVisible (true)` alone grabs the keyboard, closes on Esc and click-away, and returns focus to the editor, like a menu-bar menu | use `QMenu::popup (pos)` from the same method |
| b | The menu is moved on screen when it would leave the screen (`popup` does; plain `show` may not) | clamp to the screen by hand, or use `popup` |
| c | The keystroke that opened the menu (Ctrl+Shift+C) is not delivered to it | swallow the first key event |
| d | Cleanup of the old `popup_win` is safe: never destroyed while visible | destroy from the menu's hide, or keep one |
| e | Behaviour on macOS and Linux | only matters for the upstream PR |

Residual race: keys already queued at the moment the menu is shown (one update pass) are
still processed by the editor. Accept in the first version and measure.

## 7. Tests

- **Scheme (`*-test.scm`)**: `popup-menu` maps anchors to the glue call; `popup-menu-items`
  builds the right entries and calls the callback once with the chosen id.
- **GUI integration test (`MOGAN_TEST_GUI=1`)**: open the menu from a key binding with
  `emulate-keyboard`, choose an item, then open and dismiss with Esc; assert the buffer and
  the callback.
- **Stress test for the race in 4**: shortcut and letter/arrow key in the same event batch;
  assert no stray character in the document.
- **Regression**: right-click popup unchanged.
- C++ `QTEST` only if the spikes show behaviour worth pinning; the C++ is a few lines.

## 8. Delivery

Local patch first (a commit series on `upstream/main` in `gu_mogan_build/patches/`), upstream
afterwards. **Two commits**: (1) the core (new method, glue entry, the Scheme wrapper and its
tests), which changes no existing menu code; (2) letter selection (8b), which can be dropped
or reviewed on its own. Nothing personal goes into the patch: the Ctrl+Shift+C binding and the
format list stay in `user-config/`. Follow the project conventions (no `std::`, Chinese Doxygen "why" comments,
`gf fmt`, `[NNNN]` titles, tests under `tests/`); build with `scripts/build-release.cmd`,
never `xmake b stem`; verify on a clean `upstream/main` worktree before any upstream claim,
and say in the PR what was not verified.

## 8b. Commit 2: letter selection (separate commit, decided)

Goal: a label can mark a letter that selects its item when pressed in an open menu. This is
Qt's own mnemonic mechanism; nothing is added to how menus work except that the `&` is no
longer always escaped.

- **C++, one line.** In `QTMAction::set_text`, after `replace (s, "&", "&&")`, map a marker
  character to a single `&`: `replace (s, "\x01", "&")`. Ordinary labels never contain the
  marker, so every existing menu is unchanged. The marker rather than a literal `&` keeps
  existing labels that contain `&` (for example "Q&A") displaying correctly.
- **Scheme helper** (in the Scheme layer of commit 1's file, or a new one):

  ```scheme
  (tm-define (popup-key key text)       ; "LaTeX", "l"  ->  "LaTeX (<marker>l)"
    (string-append text " (" (string #\x01) key ")"))
  ```

  It also rejects two items with the same letter in one menu (Qt would cycle between them).
- **The letter is written into the text** ("LaTeX (l)"), because on Windows Qt hides mnemonic
  underlines until Alt is pressed, so an underline alone is not a hint.
- **Spike before relying on it:** a mnemonic fires in a menu that is shown without `exec`
  (the commit-1 way). If it does not, fall back to a small `keyPressEvent` override for popups
  only, which would then be a third, optional commit.
- **Tests:** a Scheme test for `popup-key` and duplicate rejection; a GUI test that a letter
  runs the right item; a regression check that an ordinary menu label containing `&` still
  shows it.
- **If dropped:** commit 1 is complete without it; popups are then click-only.

## 9. Decided and open

Decided: reuse the existing menu popup; the caller chooses the position (`cursor`, `mouse`,
or coordinates); the chosen item is reported through Scheme only; no `exec`; local first,
upstream later; **letter selection is included, as a separate second commit**.

Open:
1. Which formats the first menu lists; paste-from gets no key (Ctrl+Shift+V is smart paste).
2. Run the spikes in 6 (and the mnemonic spike in 8b) before writing the real code.
