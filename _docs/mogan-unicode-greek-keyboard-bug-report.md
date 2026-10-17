# Unicode keyboard input cannot be reliably captured by Scheme key bindings

## Observed behavior

Keyboard bindings defined in `my-init-texmacs.scm` do not capture Unicode input after restarting Mogan. This affects bindings whose left-hand side contains a Unicode character.

The problem is not specific to Greek or to a particular operating-system keyboard layout. It can occur with non-ASCII Unicode characters generally. Greek alpha (`α`) is used below only as a minimal example.

For example, this binding is placed in the user initialization file:

```scheme
(utf8-kbd-map
  ("α" "TEST-ALPHA"))
```

After restarting Mogan and typing or committing `α` through the frontend, the `TEST-ALPHA` action is not invoked. The Unicode character is not captured by the binding. The same behavior can be reproduced when the binding is restricted to a particular mode, including math mode.

The ASCII equivalent works:

```scheme
(kbd-map
  ("alpha" "<alpha>"))
```

Typing `alpha` in the corresponding context produces the TeXmacs alpha symbol.

A recent update also regressed the existing ASCII alias: after commit `ab78f9c83` (12 August 2026, `[1199] 使用 utf8-kbd-map 支持 ￥、等非 ASCII 键`), typing `alpha` no longer reliably stands for the single alpha character and may instead remain the literal sequence of letters. This commit moved UTF-8-to-Cork normalization out of ordinary `kbd-map` and into `utf8-kbd-map`, following the automatic normalization introduced by commit `2c54f8187`.

The Scheme-side registration itself can be inspected independently. In the current build:

```scheme
(string-convert "α" "UTF-8" "Cork")
```

returns `<alpha>`, and the corresponding binding is found when queried from Scheme in the binding's active context. Thus the failure is not simply that the Unicode entry is absent from the keymap.

## Environment

- Mogan STEM
- Qt frontend
- User bindings in `$TEXMACS_HOME_PATH/progs/my-init-texmacs.scm`
- Relevant source: `src/Plugins/Qt/qt_utilities.cpp`

The original minimal reproduction used a binding conditioned with `(:mode in-math?)`; this condition is not required to observe the Unicode-input failure.

## Expected behavior

Every Unicode character delivered as keyboard input should reach the keyboard handler without being changed. A binding registered with `utf8-kbd-map` should then match the normalized internal key and execute its action, regardless of the active editor mode.

## Diagnosis

The input path is approximately:

```text
Qt key/input event
  -> from_key_press_event
  -> edit_interface_rep::handle_keypress
  -> Scheme keyboard-press / kbd-find-key-binding
```

In `from_key_press_event`, the printable-key branch currently does this:

```cpp
unsigned short unic    = nss.data ()[0].unicode ();
char           text_key= (char) unic;
```

When a Qt event reports a printable key code together with non-ASCII text, the code casts the Unicode value to `char`. This loses the original code point before `handle_keypress` can perform the normal Unicode-to-Cork conversion. The same failure can therefore affect any non-ASCII character delivered through this event shape, in math mode or elsewhere.

There is also a separate keymap-encoding distinction:

- Ordinary `kbd-map` currently expects the internal key representation.
- `utf8-kbd-map` converts literal UTF-8 key names to that representation.
- An earlier repository commit, `2c54f8187`, made ordinary `kbd-map` perform this conversion automatically, which explains why a literal Unicode key in `kbd-map` worked previously.

For the original math-mode reproduction, math bindings are additionally registered lazily through `delayed-kbd-map`; custom math bindings must be installed after the built-in pending math bindings are flushed. This is a separate initialization-order issue and does not explain why Unicode text is lost in the general input path.

## Possible fix

When the event has no Ctrl/Alt/Meta modifier and its text contains a non-ASCII character, preserve the complete UTF-8 text instead of casting it to `char`:

```cpp
if ((is_empty (mods_text) || mods_text == "S-") &&
    !nss.isEmpty () && nss.data ()[0].unicode () > 255) {
  r= from_qstring_utf8 (nss);
}
else if (is_empty (mods_text) || mods_text == "S-") {
  r << text_key;
}
```

This lets `handle_keypress` perform the normal Unicode-to-Cork conversion while preserving existing ASCII shortcut behavior.

## Workaround

Use ASCII bindings. For the original math-mode use case:

```scheme
(kbd-map
  (:mode in-math?)
  ("alpha" "<alpha>")
  ("beta" "<beta>")
  ("Gamma" "<Gamma>"))
```

The active user initialization file is normally:

```text
%APPDATA%\moganlab\progs\my-init-texmacs.scm
```
