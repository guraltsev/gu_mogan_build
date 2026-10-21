;; def-macro-latex: a macro that carries its own LaTeX (see progs/def-macro-latex.scm)
;; In the strings below "~" stands for a backslash.
(load (string-append (getenv "UC_TESTS") "/helpers.scm"))

(define (bsl s)
  (list->string
    (map (lambda (c) (if (char=? c (string-ref "~" 0)) (string-ref bs 0) c))
         (string->list s))))

(define (dml name arity pre call)
  `(def-macro-latex ,name
     (macro ,@(map (lambda (i) (string-append "p" (number->string i))) (iota arity)) "x")
     ,(bsl pre) ,(bsl call)))

(define (doc-with defs . body)
  `(document (TeXmacs "2.1.4") (style (tuple "generic"))
     (body (document (hide-preamble (document ,@defs)) (math ,@body)))))

(define (pos s sub)
  (let loop ((i 0))
    (cond ((> (+ i (string-length sub)) (string-length s)) #f)
          ((== (substring s i (+ i (string-length sub))) sub) i)
          (else (loop (+ i 1))))))

(define (err? thunk) (catch #t (lambda () (thunk) #f) (lambda args #t)))

(define (test-basic)
  (let ((e (export-doc (doc-with (list (dml "foo" 2 "~NewDocumentCommand{~foo}{O{t} m}{X}" "~foo[#1]{#2}"))
                                 '(foo "t" "x")))))
    (check (has? (body-of e) (bsl "~foo[t]{x}")) => #t)
    (check (has? (preamble-of e) (bsl "~NewDocumentCommand{~foo}")) => #t)
    (check (has? e "def-macro-latex") => #f)
    (check (has? (body-of e) "%") => #f)
    (check (has? e (bsl "~newcommand")) => #f)))

(define (test-reorder)
  (let ((e (export-doc (doc-with (list (dml "sw" 2 "% sw" "~sw{#2}{#1}{#2}")) '(sw "a" "b")))))
    (check (has? (body-of e) (bsl "~sw{b}{a}{b}")) => #t)))

(define (test-unused)
  (let ((e (export-doc (doc-with (list (dml "foo" 1 "%FOO-def" "~foo{#1}")) "x"))))
    (check (has? e "FOO-def") => #f)))

(define (test-order)
  (let* ((e (export-doc (doc-with (list (dml "aa" 1 "%AA-def" "~aa{#1}")
                                        (dml "bb" 1 "%BB-def" "~bb{#1}"))
                                  '(concat (bb "1") (aa "2")))))
         (pre (preamble-of e)))
    (check (has? pre "AA-def") => #t)
    (check (has? pre "BB-def") => #t)
    ;; order of use
    (check (< (pos pre "BB-def")
              (pos pre "AA-def")) => #t)))

(define (test-nested)
  (let ((e (export-doc (doc-with (list (dml "foo" 1 "%FOO-def" "~foo{#1}"))
                                 '(frac (foo "a") "b")))))
    (check (has? (body-of e) (bsl "~foo{a}")) => #t)))

(define (test-errors)
  (check (err? (lambda () (export-doc (doc-with (list (dml "foo" 1 "% p" "")) "x")))) => #t)
  (check (err? (lambda () (export-doc (doc-with (list (dml "foo" 1 "% p" "~foo{#2}")) "x")))) => #t)
  (check (err? (lambda () (export-doc (doc-with (list (dml "foo" 2 "% p" "~foo{#1}")) '(foo "a"))))) => #t))

(define (test-no-leak)
  (export-doc (doc-with (list (dml "foo" 1 "%FOO-def" "~foo{#1}")) '(foo "a")))
  (check (has? (export-math "x+y") "FOO-def") => #f))

(test-basic)
(test-reorder)
(test-unused)
(test-order)
(test-nested)
(test-errors)
(test-no-leak)
(finish)
