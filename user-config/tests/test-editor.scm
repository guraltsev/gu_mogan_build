;; Typing \name and Enter in the editor, and the Alt+T action. Drives the same steps
;; as the keys (start a hybrid command, type the name, activate), because simulated
;; key presses need GUI-only completion code that headless Mogan does not load.
(load (string-append (getenv "UC_TESTS") "/helpers.scm"))

;; In a fresh math formula: run \name, then type `after`; return (body tree, styles).
(define (typed name . after)
  (new-buffer)
  (set-style-list '("generic"))
  (make 'math)
  (make-hybrid)
  (insert name)
  (activate-hybrid #f)
  (for-each insert after)
  (cons (cadr (tree->stree (buffer-tree))) (get-style-list)))

(define (body-of-typed . args)
  (with r (apply typed args)
    (cadr (car r))))

(define (styles-of-typed . args)
  (cdr (apply typed args)))

;; the shorthands behave exactly like the long forms they stand for
(define (test-fonts)
  (for-each
    (lambda (p)
      (check (body-of-typed (car p) "A") => (body-of-typed (cadr p) "A")))
    '(("mc" "mathcal") ("mb" "mathbb") ("mbf" "mathbf") ("mf" "mathfrak")))
  (check (body-of-typed "mc" "A") => '(with "font" "cal" "A"))
  (check (body-of-typed "ms" "L") => '(with "font" "cal*" "L")))

(define (test-symbols)
  (for-each
    (lambda (l) (check (body-of-typed l) => (tex "<bbb-" l ">")))
    '("R" "C" "Q" "Z" "N"))
  (check (body-of-typed "1") => "<bbb-1>"))

;; these tags need their style package: the command adds it
(define (test-package-macros)
  (with r (typed "lga" "x")
    (check (cadr (car r)) => '(lga "t" (table (row (cell "x")))))
    (check (member "lga" (cdr r)) => '("lga")))
  (with r (typed "oper" "foo")
    (check (cadr (car r)) => '(oper "foo"))
    (check (member "oper" (cdr r)) => '("oper"))))

;; the Alt+T binding calls user-insert-lga
(define (test-alt-t)
  (new-buffer)
  (set-style-list '("generic"))
  (make 'math)
  (user-insert-lga)
  (insert "x")
  (check (cadr (cadr (tree->stree (buffer-tree))))
         => '(lga "t" (table (row (cell "x")))))
  (check (member "lga" (get-style-list)) => '("lga"))
  ;; used twice: the package is added once
  (user-insert-lga)
  (check (length (filter (lambda (s) (== s "lga")) (get-style-list))) => 1))

;; Alt+T is the key A-t (not "math t"): the key binding itself must give lga,
;; not Mogan's built-in tabular
(define (test-alt-t-key)
  (for-each
    (lambda (key)
      (new-buffer)
      (set-style-list '("generic"))
      (make 'equation*)
      (insert "1=")
      ((car (kbd-find-key-binding key)))
      (check (tree-has? (tree->stree (buffer-tree)) 'lga) => #t)
      (check (tree-has? (tree->stree (buffer-tree)) 'tabular*) => #f))
    '("A-t" "math t")))

;; Keys in my-init-texmacs.scm are written with Mogan's prefix names (var, math, copyto),
;; but the keyboard sends physical keys (tab, A-t, C-C). Every binding must also resolve under
;; its physical spelling to the same action. Lookup only: nothing is run, so the clipboard
;; and interactive keys are safe to include.
(define (init-keys)
  (define (read-all path)
    (call-with-input-file path
      (lambda (port)
        (let loop ((f (read port)) (acc '()))
          (if (eof-object? f) (reverse acc) (loop (read port) (cons f acc)))))))
  (let loop ((fs (read-all (url->system (url-unix "$TEXMACS_HOME_PATH/progs"
                                                   "my-init-texmacs.scm"))))
             (acc '()))
    (cond ((null? fs) (reverse acc))
          ((and (pair? (car fs)) (memq (caar fs) '(user-kbd-map user-kbd-map+)))
           (loop (cdr fs)
                 (append (reverse (filter (lambda (x) x)
                                    (map (lambda (c)
                                           (and (pair? c) (string? (car c)) (pair? (cdr c))
                                                (car c)))
                                         (cdar fs))))
                         acc)))
          (else (loop (cdr fs) acc)))))

(define (action-source key)
  (with b (kbd-find-key-binding key)
    (and b (promise-source (car b)))))

(define (test-physical-keys)
  (lazy-keyboard-force #t)
  (new-buffer)
  (set-style-list '("generic"))
  (make 'equation*)
  (let ((keys (init-keys)))
    (check (> (length keys) 50) => #t)
    (for-each
      (lambda (k)
        (with p (user-physical-key k)
          (when (!= p k)
            (check (list k (action-source p)) => (list k (action-source k))))))
      keys))
  ;; the keys that were broken before: Alt+T, its variants, Tab variants, Ctrl+Shift+C
  (for-each
    (lambda (k) (check (and (kbd-find-key-binding k) #t) => #t))
    '("A-t" "A-t tab" "A-t tab tab" "A-t tab tab tab" "( A-t" "C-/ tab" "C-C l" "C-X l"))
  (check (action-source "A-t") => (action-source "math t"))
  (check (action-source "A-t tab tab") => (action-source "math t var var")))

(test-fonts)
(test-symbols)
(test-package-macros)
(test-alt-t)
(test-alt-t-key)
(test-physical-keys)
(finish)
