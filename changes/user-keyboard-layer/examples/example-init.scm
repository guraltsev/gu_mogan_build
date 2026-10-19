;; Example my-init-texmacs.scm using user-kbd-map / user-kbd-unmap.
;; Install as %APPDATA%\moganlab\progs\my-init-texmacs.scm and restart Mogan.
;; Guide: ../USAGE.md

;; --- compatibility with builds that lack user-kbd-map (see examples/fallback-shim.scm)
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

;; --- unconditional bindings (any mode)
(user-kbd-map
  ("A-x" (interactive exec-interactive-command)))

;; --- math-mode bindings
(user-kbd-map
  (:mode in-math?)

  ;; Greek letters by key name.  Typing the Greek letter on a Greek keyboard
  ;; layout delivers exactly this name (e.g. the key for α arrives as "alpha").
  ("alpha"  "<alpha>")
  ("beta"   "<beta>")
  ("gamma"  "<gamma>")
  ("Gamma"  "<Gamma>")
  ("varepsilon"     "<varepsilon>")   ; the letter ε
  ("varepsilon var" "<epsilon>")      ; then Tab: the variant ϵ

  ;; a literal Unicode key is also accepted on builds WITH the patch and means
  ;; the same as the name above; do not use it in files that must run on old builds
  ;; ("α" "<alpha>")

  ;; key sequences: `var` is the Tab key
  ("` ("         (make 'matrix))      ; ( ) matrix
  ("` ( var"     (make 'bmatrix))     ; [ ] matrix
  ("` ( var var" (make 'tabular*))    ; plain table
  ("C-/"         (make-fraction))
  ("` *"         "<times>")
  ("` + +"       (math-big-operator "sum")))

;; --- remove a built-in math sequence (also hides it if the module loads later)
(user-kbd-unmap
  (:mode in-math?)
  "| `")
