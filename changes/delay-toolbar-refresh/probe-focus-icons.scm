;; Diagnostic: time the per-keystroke toolbar expansion (menu-expand) for the
;; cursor position currently in the focused buffer. Appends a report to
;; %TEMP%\probe-focus-icons.txt every 6 s. Run:
;;   MoganSTEM.exe <file.tm> -x "(load \"<this file>\")"
;; then put the cursor in text / in math and wait a few seconds.

(define probe-out (string-append (getenv "TEMP") "\\probe-focus-icons.txt"))
(define probe-log "")

(define (probe-say . l)
  (set! probe-log (string-append probe-log (apply string-append l) "\n")))

(define (probe-time name thunk)
  (let* ((n 5)
         (t0 (texmacs-time)))
    (do ((i 0 (+ i 1))) ((= i n)) (thunk))
    (probe-say (string-pad-right name 34) " "
               (number->string (/ (- (texmacs-time) t0) n 1.0)) " ms")))

(define (probe-expand name menu)
  (probe-time name (lambda () (menu-expand menu))))

(define (probe-once)
  (catch #t
    (lambda ()
      (set! probe-log "")
      (let ((t (focus-tree)))
        (probe-say "---- " (number->string (texmacs-time))
                   " math=" (if (in-math?) "yes" "no")
                   " focus=" (object->string (tree-label t))
                   " depth=" (number->string (length (tree->path t))))
        (probe-expand "WHOLE focus icons"
                      '(horizontal (link texmacs-focus-icons)))
        (probe-expand "WHOLE mode icons"
                      '(horizontal (link texmacs-mode-icons)))
        (probe-time "(focus-tree)" (lambda () (focus-tree)))
        (probe-time "(tree->path focus)" (lambda () (tree->path (focus-tree))))
        (probe-time "focus-can-move?" (lambda () (focus-can-move? t)))
        (probe-time "focus-can-insert-remove?"
                    (lambda () (focus-can-insert-remove? t)))
        (for-each
          (lambda (name)
            (probe-expand (symbol->string name)
                          `(dynamic (,name ,t))))
          '(focus-ancestor-icons focus-move-icons focus-insert-icons
            focus-tag-icons focus-hidden-icons focus-extra-icons
            focus-label-icons))
        (for-each
          (lambda (name)
            (probe-expand (symbol->string name) `(link ,name)))
          '(text-icons math-icons help-icons))
        (probe-say ""))
      (string-save (string-append (or (catch #t (lambda () (string-load (system->url probe-out))) (lambda e "")) "")
                                  probe-log)
                   (system->url probe-out)))
    (lambda e (display* "probe error: " e "\n"))))

(define (probe-loop)
  (probe-once)
  (delayed (:pause 6000) (probe-loop)))

(delayed (:pause 20000) (probe-loop))
