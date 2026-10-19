;; User-level LaTeX table macros (no Mogan source changes). Loaded from my-init-texmacs.scm.
;;
;; (latex-register-table-macro "<cmd>" "<style package>" "<default option>" ["<preamble>" "<latex package>" ...])
;; Import: \cmd[o]{a <rowbreak> b}  ->  (cmd "o" (table (row (cell a)) (row (cell b))))   (\cmd{..} uses the default)
;; Export: (cmd "o" (table ...)) -> \cmd[o]{a <rowbreak> b}  (option omitted when equal to the default),
;;         and, with a <preamble> string, that text (plus \usepackage of the listed LaTeX
;;         packages) is injected into the exported preamble; without one, \usepackage{<cmd>}
;;         is added instead, so <cmd>.sty must be findable by LaTeX.

(plugin-initialize 'latex)
(import-from (latex latex-format))
(import-from (latex convert-latex-tmtex))
(import-from (latex convert-latex-tools))

(define latex-table-macros (make-ahash-table))      ; name -> (package default preamble)
(define latex-table-macros-used '())

(define (latex-register-table-macro name pkg default . opt)
  (let ((sym (string->symbol name))
        (h (lambda (l) (table-macro-export name l)))
        (preamble (and (pair? opt) (car opt)))
        (latex-pkgs (if (pair? opt) (cdr opt) '())))
    (ahash-set! latex-table-macros name (list pkg default preamble latex-pkgs))
    (eval `(logic-dispatcher tmtex-extra-methods% (,sym ,h)))
    (when preamble
      (let ((body (list '!append preamble (string #\newline))))
        (eval `(smart-table latex-texmacs-preamble (,sym ,body)))
      ) ;let
    ) ;when
  ) ;let
) ;define

;; ---- export ----
(define (table-macro-export name l)
  (let* ((reg (ahash-ref latex-table-macros name))
         (opt (if (> (length l) 1) (car l) (cadr reg)))
         (res (tmtex (list 'table-macro-rows (cAr l))))
         (rows (if (and (pair? res) (pair? (car res)) (eq? (caar res) '!begin))
                   (cadr res)
                   res))
        ) ;
    (if (caddr reg)
        (for-each latex-add-extra (cadddr reg))
        (latex-add-extra (car reg)))
    `(,(string->symbol name)
      ,@(if (== opt (cadr reg)) '() `((!option ,opt)))
      ,(if (and (pair? rows) (memq (car rows) '(!group !table))) rows `(!group ,rows)))
  ) ;let*
) ;define

;; ---- import ----
(define (table-macro-rows body*)
  (define body
    (if (and (pair? body*) (eq? (car body*) 'document)
             (pair? (cdr body*)) (null? (cddr body*)))
        (cadr body*)
        body*))
  (let loop ((l (if (and (pair? body) (eq? (car body) 'concat)) (cdr body) (list body)))
             (cur '())
             (rows '()))
    (define (cell)
      `(cell ,(cond ((null? cur) "")
                    ((null? (cdr cur)) (car cur))
                    (else `(concat ,@(reverse cur))))))
    (cond ((null? l) (reverse (cons `(row ,(cell)) rows)))
          ((equal? (car l) '(next-line))
           (loop (cdr l) '() (cons `(row ,(cell)) rows)))
          (else (loop (cdr l) (cons (car l) cur) rows)))
  ) ;let
) ;define

(define (table-macro-star-name s)
  (let ((n (string-length s)))
    (and (> n 1) (== (substring s (- n 1) n) "*") (substring s 0 (- n 1)))
  ) ;let
) ;define

(define (transform-table-macros x)
  (define (reg-of s) (ahash-ref latex-table-macros s))
  (define (use! reg) (set! latex-table-macros-used (cons (car reg) latex-table-macros-used)))
  (cond ((and (pair? x) (symbol? (car x)) (pair? (cdr x)))
         (let* ((s (symbol->string (car x)))
                (base (table-macro-star-name s)))
           (cond ((and (null? (cddr x)) (reg-of s))
                  (use! (reg-of s))
                  `(,(car x) ,(cadr (reg-of s)) (table ,@(table-macro-rows (transform-table-macros (cadr x))))))
                 ((and base (reg-of base) (pair? (cddr x)) (null? (cdddr x)) (string? (cadr x)))
                  (use! (reg-of base))
                  `(,(string->symbol base) ,(cadr x) (table ,@(table-macro-rows (transform-table-macros (caddr x))))))
                 (else (cons (car x) (map transform-table-macros (cdr x)))))))
        ((pair? x) (map transform-table-macros x))
        (else x)
  ) ;cond
) ;define

(define (add-table-macro-packages st)
  (let ((pkgs (list-remove-duplicates
                (filter (lambda (p) (and (string? p) (!= p ""))) latex-table-macros-used))))
    (if (or (null? pkgs) (not (pair? st)) (not (eq? (car st) 'document)))
        st
        (map (lambda (e)
               (if (and (pair? e) (eq? (car e) 'style) (pair? (cdr e))
                        (pair? (cadr e)) (eq? (caadr e) 'tuple))
                   `(style (tuple ,@(cdadr e) ,@pkgs))
                   e))
             st))
  ) ;let
) ;define

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Symbol commands: \R \C \Q \Z \N <-> <bbb-R> ... (the symbols typed as RR, CC, ...)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; (latex-register-symbol-command "R" "<bbb-R>" "R")
;; Export: the symbol becomes \R, and (only when it occurs) the preamble gets
;;         \NewDocumentCommand{\R}{}{\mathbb{R}}. Import: \R, \mathbb{R} and \mathbb R
;;         (the latter two are already native) all give <bbb-R>.

(define latex-symbol-commands (make-ahash-table))   ; "R" -> "<bbb-R>"

;; Optional: LaTeX font command (default mathbb; mathbbm for a double-struck 1),
;; math-font names whose wrapped letter also imports as the symbol, and the keys typed
;; in Mogan (default: the letter twice).
(define latex-symbol-font-aliases '())   ; ((font-name letter symbol) ...)

(define (latex-register-symbol-command cmd symbol letter . opt)
  (let* ((sym (string->symbol cmd))
         (key (substring symbol 1 (- (string-length symbol) 1)))
         (font (if (pair? opt) (car opt) 'mathbb))
         (aliases (if (and (pair? opt) (pair? (cdr opt))) (cadr opt) '()))
         (typed (if (and (pair? opt) (pair? (cdr opt)) (pair? (cddr opt)))
                    (caddr opt)
                    (string-append letter letter))))
    (ahash-set! latex-symbol-commands cmd symbol)
    (for-each (lambda (f)
                (set! latex-symbol-font-aliases
                      (cons (list f letter symbol) latex-symbol-font-aliases)))
              aliases)
    (eval (list 'logic-table 'latex-special-symbols% (list key (list sym))))
    (eval (list 'smart-table 'latex-texmacs-preamble
                (list sym (list '!append
                                (string-append "\\NewDocumentCommand{\\" cmd "}{}{")
                                (list font letter)
                                (string-append "} % \\" cmd ": blackboard bold " letter
                                               " (Mogan " typed ")"
                                               (string #\newline))))))
  ) ;let*
) ;define

(define (drop-symbol-assigns doc)
  (filter (lambda (e)
            (not (and (pair? e) (eq? (car e) 'assign) (pair? (cdr e))
                      (string? (cadr e)) (ahash-ref latex-symbol-commands (cadr e)))))
          doc))

(define (transform-symbol-commands x)
  (cond ((and (pair? x) (symbol? (car x)) (null? (cdr x))
              (ahash-ref latex-symbol-commands (symbol->string (car x))))
         => (lambda (s) s))
        ;; \1: a control symbol (non-letter), which the importer returns as ((symbol "1"))
        ((and (pair? x) (pair? (car x)) (null? (cdr x)) (eq? (caar x) 'symbol)
              (pair? (cdar x)) (string? (cadar x))
              (ahash-ref latex-symbol-commands (cadar x)))
         => (lambda (s) s))
        ;; \mathbbm{1} (and \mathbb{1}) wrap a plain letter in a font
        ((and (pair? x) (eq? (car x) 'with) (= (length x) 4)
              (equal? (cadr x) "math-font") (string? (cadddr x))
              (let loop ((l latex-symbol-font-aliases))
                (cond ((null? l) #f)
                      ((and (equal? (caar l) (caddr x)) (equal? (cadar l) (cadddr x)))
                       (caddar l))
                      (else (loop (cdr l))))))
         => (lambda (s) s))
        ((and (pair? x) (eq? (car x) 'hide-preamble) (pair? (cdr x))
              (pair? (cadr x)) (eq? (caadr x) 'document))
         (let ((rest (drop-symbol-assigns (cdadr x))))
           (if (null? rest) '%drop `(hide-preamble (document ,@rest)))))
        ;; \oper{foo}: the importer reads the argument as math ("f*o*o")
        ((and (pair? x) (eq? (car x) 'oper) (pair? (cdr x)) (null? (cddr x))
              (string? (cadr x)))
         (set! latex-table-macros-used (cons "oper" latex-table-macros-used))
         `(oper ,(list->string (filter (lambda (c) (not (char=? c #\*)))
                                       (string->list (cadr x))))))
        ;; \mc \mb \mbf \mf \ms: same result as \mathcal \mathbb \mathbf \mathfrak \mathscr
        ((and (pair? x) (symbol? (car x)) (pair? (cdr x)) (null? (cddr x))
              (assoc (symbol->string (car x)) math-font-shorthands))
         => (lambda (row) (math-font-shorthand->tm row (transform-symbol-commands (cadr x)))))
        ((pair? x) (filter (lambda (e) (not (eq? e '%drop)))
                           (map transform-symbol-commands x)))
        (else x)
  ) ;cond
) ;define

(define latex-document->texmacs-before-table-macros latex-document->texmacs)

(define (apply-user-import-passes tree)
  (set! latex-table-macros-used '())
  (stree->tree
    (add-table-macro-packages
      (transform-symbol-commands (transform-table-macros (tree->stree tree)))))
) ;define

(define (latex-document->texmacs-with-table-macros x . opts)
  (apply-user-import-passes
    (apply latex-document->texmacs-before-table-macros (cons x opts)))
) ;define

;; Pasting LaTeX goes through latex-snippet -> latex-tree -> texmacs-tree,
;; not through the document converter above.
(define latex->texmacs-before-user-extensions latex->texmacs)

(define (latex->texmacs-with-user-extensions t)
  (apply-user-import-passes (latex->texmacs-before-user-extensions t))
) ;define

(converter latex-tree texmacs-tree (:function latex->texmacs-with-user-extensions))

(converter latex-document
  texmacs-tree
  (:function-with-options latex-document->texmacs-with-table-macros)
  (:option "latex->texmacs:fallback-on-pictures" "on")
  (:option "latex->texmacs:source-tracking" "off")
  (:option "latex->texmacs:conservative" "off")
  (:option "latex->texmacs:transparent-source-tracking" "off")
) ;converter

;; Registrations
(latex-register-table-macro "lga" "lga" "t"
  "\\NewDocumentCommand{\\lga}{O{t} m}{\\begin{lgathered}[#1]#2\\end{lgathered}} % \\lga[t|c|b]{...}: left-aligned gathered column (Mogan lga)"
  "mathtools")

(latex-register-symbol-command "R" "<bbb-R>" "R")
(latex-register-symbol-command "C" "<bbb-C>" "C")
(latex-register-symbol-command "Q" "<bbb-Q>" "Q")
(latex-register-symbol-command "Z" "<bbb-Z>" "Z")
(latex-register-symbol-command "N" "<bbb-N>" "N")
;; \1: double-struck one; mathbbm (package bbm), as plain \mathbb{1} prints an ordinary 1
(latex-register-symbol-command "1" "<bbb-1>" "1" 'mathbbm '("Bbb" "Bbb*") "1 1 var var var")

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; \oper{...}: operator names. Mogan's exporter writes unknown operator names as
;; \tmop{...}; that is renamed to \oper, and Mogan's own `oper` macro (package
;; oper.stem) exports to the same command. Defined once in the preamble.
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(eval (list 'smart-table 'latex-texmacs-preamble
            (list 'oper (list '!append
                              (string-append
                                "\\NewDocumentCommand{\\oper}{s m}{\\ensuremath{\\IfBooleanTF{#1}{\\operatorname*{#2}}{\\operatorname{#2}}}}"
                                " % \\oper[*]{...}: synonym of \\operatorname (Mogan oper, tmop)"
                                (string #\newline))))))

(define (rename-tmop x)
  (cond ((and (pair? x) (eq? (car x) 'tmop))
         (latex-add-extra "amsmath")
         (cons 'oper (map rename-tmop (cdr x))))
        ;; \mathcal -> \mc etc.
        ((and (pair? x) (symbol? (car x))
              (assoc (symbol->string (car x)) math-font-shorthand-long))
         => (lambda (row)
              (when (caddr row) (latex-add-extra (caddr row)))
              (let ((short (string->symbol (cadr row)))
                    (args (map rename-tmop (cdr x))))
                ;; \operatorname resets the math font, so \mc{\oper{AB}} would come out
                ;; upright; \oper{\mc{AB}} keeps the font
                (if (and (pair? args) (null? (cdr args))
                         (pair? (car args)) (eq? (caar args) 'oper))
                    (list 'oper (cons short (cdar args)))
                    (cons short args)))))
        ((pair? x) (map rename-tmop x))
        (else x)
  ) ;cond
) ;define

;; texmacs->latex covers both a whole file and a snippet (copy as LaTeX);
;; tmtex-postprocess is only called for whole files.
(tm-define (texmacs->latex x opts)
  (:require #t)
  (rename-tmop (former x opts))
) ;tm-define

(eval (list 'logic-dispatcher 'tmtex-extra-methods%
            (list 'oper (lambda (l)
                          (latex-add-extra "amsmath")
                          ;; a plain name is written as is; tmtex would wrap it in \tmop again
                          (list 'oper (if (and (string? (car l))
                                               (list-and (map char-alphabetic?
                                                              (string->list (car l)))))
                                          (car l)
                                          (tmtex (car l))))))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Math font shorthands: \mc \mb \mbf \mf \ms = \mathcal \mathbb \mathbf \mathfrak \mathscr
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Import: \mc{A} gives what \mathcal{A} gives (<cal-A>, or a math-font with).
;; Export: \mathcal{A} is written \mc{A}; Mogan's own mc ... ms macros (package
;;         mathfonts.stem) export the same. Each is defined once in the preamble.

;; short, long, LaTeX package, Mogan math-font (#f: math-bf), symbol prefix (or #f)
(define math-font-shorthands
  '(("mc" "mathcal" #f "cal" "cal")
    ("mb" "mathbb" "amssymb" "Bbb" "bbb")
    ("mbf" "mathbf" #f #f #f)
    ("mf" "mathfrak" "amssymb" "Euler" "frak")
    ("ms" "mathscr" "mathrsfs" "cal*" #f)))

;; (long short package), keyed by the long name for the export rename
(define math-font-shorthand-long
  (map (lambda (r) (list (cadr r) (car r) (caddr r))) math-font-shorthands))

(define (math-font-shorthand->tm row arg)
  (let ((font (cadddr row)) (prefix (car (cddddr row))))
    (cond ((not font)
           ;; \mathbf{AB} gives "AB"; the importer's invisible times would show
           `(math-bf ,(if (string? arg)
                          (list->string (filter (lambda (c) (not (char=? c #\*)))
                                                (string->list arg)))
                          arg)))
          ((and prefix (string? arg) (= (string-length arg) 1)
                (char-alphabetic? (string-ref arg 0))
                ;; \mathcal has no lowercase symbols
                (or (!= prefix "cal") (char-upper-case? (string-ref arg 0))))
           (string-append "<" prefix "-" arg ">"))
          (else `(with "math-font" ,font ,arg)))
  ) ;let
) ;define

(for-each
  (lambda (row)
    (let* ((short (string->symbol (car row))) (long (cadr row)) (pkg (caddr row)))
      (eval (list 'smart-table 'latex-texmacs-preamble
                  (list short
                        (list '!append
                              (string-append
                                "\\NewDocumentCommand{\\" (car row) "}{m}{\\" long "{#1}}"
                                " % \\" (car row) "{...}: synonym of \\" long
                                (string #\newline))))))
      (eval (list 'logic-dispatcher 'tmtex-extra-methods%
                  (list short
                        (lambda (l)
                          (when pkg (latex-add-extra pkg))
                          (list short (if (and (string? (car l))
                                               (list-and (map char-alphabetic?
                                                              (string->list (car l)))))
                                          (car l)
                                          (tmtex (car l)))))))))
  ) ;lambda
  math-font-shorthands)
