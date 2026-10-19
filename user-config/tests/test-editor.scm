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

(test-fonts)
(test-symbols)
(test-package-macros)
(test-alt-t)
(finish)
