# Mogan math-mode keyboard bindings

## Configuration

The user initialization file is loaded from:

```text
%APPDATA%\moganlab\progs\my-init-texmacs.scm
```

The repository copy is [my-init-texmacs.scm](my-init-texmacs.scm). It loads the built-in math keyboard map, flushes pending delayed bindings, and then installs the custom math bindings. Greek symbols are entered through ASCII names such as `alpha`, `beta`, and `Gamma`.

## Why `kbd-map` used to work

An earlier repository commit (`2c54f8187`) converted `kbd-map` key names from UTF-8 to Cork automatically. That behavior was not retained in the current branch; ordinary `kbd-map` now expects the internal key representation, while `utf8-kbd-map` performs the conversion explicitly. For this configuration, use the ASCII names and avoid literal Unicode key bindings.

## Verification

1. Enter a math region.
2. Type `alpha`, `beta`, or another ASCII Greek name, followed by the terminating key expected by the binding.
3. The mappings should produce TeXmacs symbols such as `alpha`, `beta`, and `Gamma`.

The active user initialization file is `%APPDATA%\moganlab\progs\my-init-texmacs.scm`; restart Mogan after updating it. Clipboard paste is a text insertion operation and does not pass through the keyboard shortcut map.
