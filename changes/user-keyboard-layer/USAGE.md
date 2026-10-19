# Using `user-kbd-map` / `user-kbd-unmap`

Companion to `README.md` (which explains the investigation and the design).
This file is the practical guide: syntax, semantics, examples, fallback for
older builds, and how to debug.

## 1. Where the file lives

User bindings go in your init file:

```
%APPDATA%\moganlab\progs\my-init-texmacs.scm        (Windows)
$TEXMACS_HOME_PATH/progs/my-init-texmacs.scm        (generally)
```

It is loaded once at startup, **before** Mogan's built-in keyboard modules
(they load lazily afterwards). Restart Mogan after editing it.

## 2. Syntax

Identical to `kbd-map` / `kbd-unmap`:

```scheme
(user-kbd-map
  ("key"  action)                 ; action: a string to insert, or a Scheme form
  ("key"  action "help text")     ; optional help shown in the status bar
  (:mode in-math?)                ; condition: applies to the entries below it
  (:require (some-predicate?))    ; extra condition
  ("key2" action2))

(user-kbd-unmap
  (:mode in-math?)
  "key")
```

- `action` as a **string** is inserted as text: `"<alpha>"` inserts α,
  `"fuck"` would insert those letters.
- `action` as a **form** is evaluated when the key is pressed:
  `(make 'bmatrix)`, `(make-fraction)`, `(variant-circulate (focus-tree) #t)`.
- A condition line `(:mode m)` / `(:require expr)` affects every entry after it
  in the same macro call, until the next condition line.

### Key specs

| You write | Meaning |
|-----------|---------|
| `"alpha"` | the single key named *alpha* (what typing the Greek letter α delivers) |
| `"α"` | same key; a literal Unicode key is normalised to the name `alpha` |
| `"A-x"` | Alt+x (`S-`, `C-`, `M-`, `A-` are Shift/Ctrl/Meta(Cmd)/Alt) |
| ``"` ( var"`` | a sequence of keys separated by spaces: backtick, then `(`, then Tab |
| `"var"` | the Tab key (variant key); `"var var"` is Tab twice |
| `"copyto l"` | wildcards such as `copyto` are rewritten to the platform key |

Literal Unicode keys that are **named symbols** (Greek, `∈`, ...) become their
bare name (`α` -> `alpha`); characters with a numeric code keep their brackets
(`￥` -> `<#FFE5>`). This mirrors what the C++ side delivers to Scheme
(`handle_keypress`, `src/Edit/Interface/edit_keyboard.cpp`).

## 3. Semantics

- **User bindings always win** over built-in ones (`kbd-map`, `utf8-kbd-map`,
  `delayed-kbd-map`, plugins) for the same key, whenever the built-in module loads.
- Among your own bindings, the later definition replaces an earlier one with the
  same key **and** same conditions. (A key can still have several entries with
  different conditions; the first whose conditions hold is used, user entries
  first.)
- If your conditions are false at that moment, the built-in binding is used as
  usual.
- `user-kbd-unmap` hides built-in bindings with the same key and the same
  conditions, including ones that load later. Bindings with other conditions are
  unaffected.
- No startup cost: nothing is force-loaded.

## 4. Example init file

See `examples/example-init.scm` (copy and trim). Short version:

```scheme
(user-kbd-map
  ;; unconditional
  ("A-x" (interactive exec-interactive-command)))

(user-kbd-map
  (:mode in-math?)
  ;; Greek by name: typing the Greek letter on a Greek layout triggers these
  ("alpha"  "<alpha>")
  ("beta"   "<beta>")
  ("Gamma"  "<Gamma>")
  ;; key sequences; `var` is the Tab key
  ("` ("         (make 'matrix))     ; ( )
  ("` ( var"     (make 'bmatrix))    ; [ ]
  ("` ( var var" (make 'tabular*))   ; plain table
  ("C-/"         (make-fraction)))

(user-kbd-unmap
  (:mode in-math?)
  "| `")                             ; remove a built-in sequence
```

### Migrating an existing file
Rename, nothing else:

| Old | New |
|-----|-----|
| `kbd-map` | `user-kbd-map` |
| `kbd-unmap` | `user-kbd-unmap` |
| `utf8-kbd-map` | `user-kbd-map` (literal Unicode keys are handled by it) |

Drop any workarounds: `(delayed ...)` wrappers, `(lazy-keyboard-force #t)`,
`(module-provide '(math math-kbd))`, `(kbd-flush-pending)`.

## 5. Fallback for builds without the patch

Put this **before** your first `user-kbd-map` (full copy in
`examples/fallback-shim.scm`):

```scheme
(if (not (defined? 'user-kbd-map))
    (begin
      (define-macro (user-kbd-map . l)
        `(delayed (:pause 3000)
           (if (defined? 'lazy-keyboard-force) (lazy-keyboard-force #t))
           (kbd-map ,@l)))
      (define-macro (user-kbd-unmap . l)
        `(delayed (:pause 3000)
           (if (defined? 'lazy-keyboard-force) (lazy-keyboard-force #t))
           (kbd-unmap ,@l)))))
```

On a build **with** the patch the guard sees the real macro and does nothing. On an
older Mogan or TeXmacs it defines the two macros as plain `kbd-map` /
`kbd-unmap`, run 3 s after startup, after forcing all lazy keyboard modules, so
your bindings are registered last.

Tested: the guard recognises the real macro (`defined?` is true); and a binding
registered through the shim is in effect after the delay, after the lazy modules
have loaded. **Not tested** on an actual older Mogan/TeXmacs.

Limits of the fallback:
- Timing based (3 s is a guess); a very slow start could let a built-in module
  register after yours and shadow it. Raise `3000` if so.
- Use key **names** (`alpha`, `A-x`), not literal Unicode keys: old `kbd-map` does
  not normalise them the way the real macro does.
- `user-kbd-unmap` only removes what exists at that moment; later-loaded built-ins
  are not hidden (no tombstone).
- Delayed registration means the bindings do not exist during the first 3 s.

## 6. Troubleshooting

**See what key arrives.** Run the console build with keyboard debugging:

```
build\dist-releasedbg\bin\MoganSTEM.exe -debug-keyboard -debug-qt
```

The console only shows the startup lines; everything after goes to the log named
on its last line (`%APPDATA%\moganlab\system\<yyyymmddhh>.log`). Look for:

```
[QTMWidget::keyPressEvent] key=177 modifiers=0
... debug-keyboard, Pressed α|alpha at 4481
... debug-keyboard,   Codes 97 108 112 104 97
```

`Pressed α|alpha` means Scheme receives the key `alpha`. Your binding must use
that name (or the literal `α`, which normalises to it).

**See what a key resolves to.** From a script or the Scheme console:

```scheme
(kbd-find-key-binding "alpha")   ; -> (action help)  or #f
```

Condition-dependent: the result reflects the current editing mode. A binding
whose `(:mode in-math?)` does not hold at that moment is not returned.

**Check the file ran.** Add as the last form
`(string-save "ran" (system->url "C:/Users/<you>/myinit-ran.txt"))`, restart, and
look for the file. If it is missing, the init file stopped before the end (syntax
error, unbalanced parenthesis).

**Common mistakes**
- `utf8-kbd-map ("α" ...)` never matches: it stores `<alpha>` while the app
  delivers `alpha`. Use `user-kbd-map`.
- Forgetting to restart: the init file is read once at startup.
- Using plain `kbd-map` for user bindings on a build without the patch: they get
  overridden by lazily loaded built-ins (that is what this patch fixes).
