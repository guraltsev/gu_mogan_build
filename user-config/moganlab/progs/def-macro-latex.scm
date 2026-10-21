;; def-macro-latex: a Mogan macro that carries its own hand-written LaTeX (user space only).
;; Loaded from my-init-texmacs.scm, after latex-user-extensions.scm. Design: notes/def-latex-design.md.
;;
;; In the document preamble (package def-macro-latex.stem):
;;   <def-macro-latex | name | (macro "p1" ... "pn" body) | latex-preamble | latex-call>
;; defines the Mogan macro `name` and, on export, writes every use of it with the template
;; `latex-call` (#1..#n stand for the converted arguments) and, once and only if it is used,
;; `latex-preamble` verbatim into the preamble. Each of the two LaTeX fields is a string or a
;; document of strings (one line each). Mogan's own macro export is not involved.
;;
;; Errors (loud, by design): missing/empty latex-call, a `#k` beyond the macro's arity, a use
;; with the wrong number of arguments.
;; Limits: snippet export (copy as LaTeX) sees no preamble, so uses stay raw tags there;
;; macros defined in style packages are not covered.

(plugin-initialize 'latex)
(import-from (latex latex-format))
(import-from (latex convert-latex-tmtex))
(import-from (latex convert-latex-tools))

(define dml-defs (make-ahash-table))   ; name -> (arity preamble call)
(define dml-used '())                  ; names used by the current export, in order of use

(define (dml-text t)
  ;; string or (document "line" ...) -> string, else #f
  (cond ((string? t) t)
        ((and (pair? t) (eq? (car t) 'document) (list-and (map string? (cdr t))))
         (let loop ((l (cdr t)) (acc ""))
           (cond ((null? l) acc)
                 ((== acc "") (loop (cdr l) (car l)))
                 (else (loop (cdr l) (string-append acc "\n" (car l)))))))
        (else #f)))

(define (dml-error name . msg)
  (texmacs-error "def-macro-latex" (apply string-append (cons (string-append name ": ") msg))))

;; the digits k of every "#k" in the template, in order
(define (dml-placeholders call)
  (let loop ((i 0) (acc '()))
    (cond ((>= i (- (string-length call) 1)) (reverse acc))
          ((and (char=? (string-ref call i) #\#)
                (char-numeric? (string-ref call (+ i 1))))
           (loop (+ i 2) (cons (- (char->integer (string-ref call (+ i 1))) 48) acc)))
          (else (loop (+ i 1) acc)))))

;; template -> list of strings and integers: "\\lga[#1]{#2}" -> ("\\lga[" 1 "]{" 2 "}")
(define (dml-split call)
  (let loop ((i 0) (start 0) (acc '()))
    (define (flush) (if (> i start) (cons (substring call start i) acc) acc))
    (cond ((>= i (string-length call)) (reverse (flush)))
          ((and (< (+ i 1) (string-length call))
                (char=? (string-ref call i) #\#)
                (char-numeric? (string-ref call (+ i 1))))
           (loop (+ i 2) (+ i 2)
                 (cons (- (char->integer (string-ref call (+ i 1))) 48) (flush))))
          (else (loop (+ i 1) start acc)))))

(define (dml-collect-def! d)
  ;; d = (def-macro-latex name macro preamble call)
  (unless (and (= (length d) 5) (string? (cadr d)))
    (dml-error "?" "expected <def-macro-latex|name|macro|latex-preamble|latex-call>"))
  (let* ((name (cadr d)) (m (caddr d))
         (pre (dml-text (cadddr d))) (call (dml-text (car (cddddr d)))))
    (unless (and (pair? m) (eq? (car m) 'macro) (pair? (cdr m)))
      (dml-error name "the second field must be a (macro ...) value"))
    (unless (and call (!= call ""))
      (dml-error name "latex-call is required (there is no default \\name{...})"))
    (unless pre (dml-error name "latex-preamble must be a string or a document of strings"))
    (let ((arity (- (length m) 2)))
      (for-each (lambda (k)
                  (when (or (< k 1) (> k arity))
                    (dml-error name "latex-call uses #" (number->string k)
                               " but the macro has " (number->string arity) " parameter(s)")))
                (dml-placeholders call))
      (ahash-set! dml-defs name (list arity pre call)))))

;; Collect every def-macro-latex node and return the tree without them (and without a
;; preamble that became empty).
(define (dml-strip x)
  (cond ((and (pair? x) (eq? (car x) 'def-macro-latex))
         (dml-collect-def! x)
         '%drop)
        ((and (pair? x) (eq? (car x) 'hide-preamble))
         (let ((y (cons (car x) (filter (lambda (e) (not (eq? e '%drop))) (map dml-strip (cdr x))))))
           (if (and (pair? (cdr y)) (null? (cddr y)) (pair? (cadr y)) (eq? (caadr y) 'document)
                    (null? (cdadr y)))
               '%drop
               y)))
        ((pair? x) (map (lambda (e) (if (pair? e) (dml-strip e) e)) x))
        (else x)))

(define (dml-clean x)
  (cond ((pair? x) (map dml-clean (filter (lambda (e) (not (eq? e '%drop))) x)))
        (else x)))

;; Uses (name a1 ... an) -> (dml-call "name" a1 ... an), also inside macro bodies and arguments.
(define (dml-rewrite x)
  (cond ((and (pair? x) (symbol? (car x)) (ahash-ref dml-defs (symbol->string (car x))))
         `(dml-call ,(symbol->string (car x)) ,@(map dml-rewrite (cdr x))))
        ((pair? x) (map dml-rewrite x))
        (else x)))

(define dml-depth 0)   ; texmacs->latex calls itself; only the outermost call resets the state

(define (dml-preprocess x)
  (when (= dml-depth 0)
    (set! dml-used '())
    (set! dml-defs (make-ahash-table)))
  (let* ((is-tree? (tree? x))
         (st (if is-tree? (tree->stree x) x))
         (stripped (dml-clean (dml-strip st))))
    (cond ((null? (ahash-table->list dml-defs)) x)
          (is-tree? (stree->tree (dml-rewrite stripped)))
          (else (dml-rewrite stripped)))))

(define (dml-export l)
  ;; l = (name a1 ... an), raw Mogan trees
  (let* ((name (car l)) (args (cdr l)) (def (ahash-ref dml-defs name)))
    (unless (= (length args) (car def))
      (dml-error name "used with " (number->string (length args)) " argument(s), the macro has "
                 (number->string (car def))))
    (unless (member name dml-used) (set! dml-used (append dml-used (list name))))
    (let* ((conv (list->vector (map tmtex args)))
           (parts (map (lambda (p) (if (string? p) p (vector-ref conv (- p 1))))
                       (dml-split (caddr def)))))
      ;; merge neighbouring strings: texout pads separate math atoms with spaces ("{ b }"),
      ;; which would end up inside an optional argument
      (let loop ((l parts) (acc '()))
        (cond ((null? l) `(!concat ,@(reverse acc)))
              ((and (string? (car l)) (pair? acc) (string? (car acc)))
               (loop (cdr l) (cons (string-append (car acc) (car l)) (cdr acc))))
              (else (loop (cdr l) (cons (car l) acc))))))))

(eval `(logic-dispatcher tmtex-extra-methods% (dml-call ,dml-export)))

(tm-define (texmacs->latex x opts)
  (:require #t)
  (let ((y (dml-preprocess x)))
    (set! dml-depth (+ dml-depth 1))
    (dynamic-wind
      (lambda () #f)
      (lambda () (former y opts))
      (lambda () (set! dml-depth (- dml-depth 1)))))
) ;tm-define

(tm-define (latex-extra-preamble)
  (:require (pair? dml-used))
  (string-append
    (former)
    (apply string-append
           (map (lambda (n) (string-append (cadr (ahash-ref dml-defs n)) "\n")) dml-used)))
) ;tm-define
