;; Compatibility shim for user-kbd-map / user-kbd-unmap.
;; Paste at the TOP of my-init-texmacs.scm, before the first user-kbd-map.
;;
;; Builds that have the user keyboard layer (patch 03-user-kbd-map): the guard
;; sees the real macros and this does nothing.
;; Older Mogan / TeXmacs: defines both as plain kbd-map / kbd-unmap, run 3 s
;; after startup and after forcing every lazy keyboard module, so the bindings
;; are registered last and are not shadowed by lazily loaded built-ins.
;;
;; Limits: timing based (raise 3000 on a slow start); use key NAMES (alpha,
;; A-x ...), not literal Unicode keys; user-kbd-unmap only removes what exists
;; at that moment.  See ../USAGE.md section 5.
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
