**Title:** `Key bindings in my-init-texmacs.scm are silently replaced by built-in ones once the keyboard modules load`

**Labels (suggested):** bug, keyboard

---

## Summary

A binding defined with `kbd-map` in the user init file works right after startup, but is
replaced by the built-in binding for the same key as soon as Mogan loads its keyboard
modules. There is no way, in the init file, to make a user binding reliably win.

## Environment

- Mogan STEM built from `main` at `c68a494fc`, xmake mode `releasedbg`
- Windows 11 Enterprise, Qt 6.8.3; empty user directory and cache

## Steps to reproduce

1. In `$TEXMACS_HOME_PATH/progs/my-init-texmacs.scm` put exactly:

   ```scheme
   (kbd-map ("alpha" "ZZZ"))
   ```

2. Start Mogan. Press the key `alpha` (what typing the Greek letter α delivers) in a text
   buffer right away: the text `ZZZ` is inserted.
3. Let the built-in keyboard modules load. In a headless session this is
   `(lazy-plugin-force)` followed by `(lazy-keyboard-force #t)`; in the application it
   happens after startup. Press `alpha` again in a new buffer.

## Expected

`ZZZ` again: the user's own binding takes precedence.

## Actual

`<#3B1>` (the Greek letter): the built-in binding from `(keyboard text-kbd-utf8)` has
replaced the user's.

## Analysis

Key lookup returns the first matching entry of a per-key list, and every registration
puts its entry at the front, so the last registration wins. Until 2026-07-19
`init-research.scm` ended with `(lazy-keyboard-force #t)`, so all built-in keyboard
modules were loaded before the user init file and the user's bindings were registered
last. `a9ea62bac` ([1143], "remove forced lazy-keyboard load at startup") removed that for
startup speed. The built-in modules are now registered after the init file, and a
built-in registration for the same key and conditions replaces the user's.

(An orthogonal problem: `utf8-kbd-map ("α" ...)` stores the key `<alpha>`, while
`handle_keypress` delivers the bare name `alpha` to Scheme, so such Unicode bindings never
match. The change below normalises literal Unicode keys.)

## Fix

Keep two layers in the per-key list, user entries always before built-in ones:
`user-kbd-map` / `user-kbd-unmap` register user entries; built-in registrations never
replace or outrank a same-condition user entry, whenever they happen. `kbd-map` and friends
keep working as before. Pull request: branch `user-keyboard-layer`. With
`(user-kbd-map ("alpha" "ZZZ"))` the result is `ZZZ` in both states above.

## Notes

The diagnosis was worked out interactively with an AI assistant (Claude Sonnet 5.5); I
observed the overridden bindings and ran the comparison above by hand.
