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

(define (latex-register-symbol-command cmd symbol letter)
  (let ((sym (string->symbol cmd))
        (key (substring symbol 1 (- (string-length symbol) 1))))
    (ahash-set! latex-symbol-commands cmd symbol)
    (eval (list 'logic-table 'latex-special-symbols% (list key (list sym))))
    (eval (list 'smart-table 'latex-texmacs-preamble
                (list sym (list '!append
                                (string-append "\\NewDocumentCommand{\\" cmd "}{}{")
                                (list 'mathbb letter)
                                (string-append "}" (string #\newline))))))
  ) ;let
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
        ((and (pair? x) (eq? (car x) 'hide-preamble) (pair? (cdr x))
              (pair? (cadr x)) (eq? (caadr x) 'document))
         (let ((rest (drop-symbol-assigns (cdadr x))))
           (if (null? rest) '%drop `(hide-preamble (document ,@rest)))))
        ((pair? x) (filter (lambda (e) (not (eq? e '%drop)))
                           (map transform-symbol-commands x)))
        (else x)
  ) ;cond
) ;define

(define latex-document->texmacs-before-table-macros latex-document->texmacs)

(define (latex-document->texmacs-with-table-macros x . opts)
  (let ((res (apply latex-document->texmacs-before-table-macros (cons x opts))))
    (set! latex-table-macros-used '())
    (stree->tree
      (transform-symbol-commands
        (add-table-macro-packages (transform-table-macros (tree->stree res)))))
  ) ;let
) ;define

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
  "\\NewDocumentCommand{\\lga}{O{t} m}{\\begin{lgathered}[#1]#2\\end{lgathered}}"
  "mathtools")

(latex-register-symbol-command "R" "<bbb-R>" "R")
(latex-register-symbol-command "C" "<bbb-C>" "C")
(latex-register-symbol-command "Q" "<bbb-Q>" "Q")
(latex-register-symbol-command "Z" "<bbb-Z>" "Z")
(latex-register-symbol-command "N" "<bbb-N>" "N")
