;; Mogan user keyboard bindings.
;; user-kbd-map / user-kbd-unmap register into the user layer: they always win
;; over built-in bindings, however late those are loaded (see
;; gu_mogan_build/changes/user-keyboard-layer/dev-notes/03-user-kbd-map.md).  Keys are written as names
;; (alpha, varepsilon, A-x ...), which also works through the fallback below;
;; a literal "α" is accepted by the real macro and means the same as "alpha".

;; Compatibility: builds without the user keyboard layer (older Mogan / TeXmacs)
;; have no user-kbd-map.  Fall back to plain kbd-map / kbd-unmap, run after a delay
;; so that the lazily loaded built-in keyboard modules are already in place and
;; these bindings are registered last.  Use key NAMES (alpha, A-x ...) in files
;; that must work on such builds: literal Unicode keys need the real macro.
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

(user-kbd-map ("A-x" (interactive exec-interactive-command)))
 
(user-kbd-unmap
        (:mode in-math?)
        "| `")


(user-kbd-map
        ("copyto l" (clipboard-copy-export "latex" "primary"))
        ("cutto l" (clipboard-cut-export "latex" "primary"))
        ("pastefrom l" (clipboard-paste-import "latex" "primary")))



;; "$" in text starts inline math (built-in); "$ $" starts display math.  The
;; built-in "$ $" binding ignores context and would nest a display equation
;; inside math.  When the sequence completes, Mogan has already undone the
;; tentative first "$", so "not in math" here means the sequence began in text.
(tm-define (user-dollar-dollar)
  (when (not (in-math?))
    (make 'equation*)))

;; Alt+Down / Alt+Up in a display equation: add a row below / above.
;;   equation*  -> equation*[gathered]     (centered rows, one column, no number)
;;   equation   -> equation[gathered]      (centered rows, one column, ONE number)
;;   inside an existing multiline environment -> just insert a row.
;; `gathered' is the amsmath name; it is defined in env-math.stem.
(define user-multiline-tags
  '(gathered gather gather* align align* aligned aligned* eqnarray eqnarray*
    eqsplit eqsplit* multline multline* flalign flalign* alignat alignat*))

(define (user-equation-rows t)
  (let ((body (tree-ref t 0)))
    (map (lambda (x) `(row (cell ,(tree->stree x))))
         (if (tree-is? body 'document)
             (tree-children body)
             (list body)))))

(define (user-with-new-row rows downwards?)
  (let ((new '(row (cell ""))))
    (if downwards? (append rows (list new)) (cons new rows))))

;; True when only document/concat nodes lie between the cursor and T, i.e. the
;; cursor is not inside a matrix, fraction, script, ... within the equation.
(define (user-directly-in? t)
  (let loop ((u (tree-up (cursor-tree))))
    (cond ((not u) #f)
          ((== (tree->path u) (tree->path t)) #t)
          ((tree-in? u '(document concat)) (loop (tree-up u)))
          (else #f))))

(tm-define (user-multiline-equation downwards?)
  (let ((t (tree-innermost (append '(equation equation*) user-multiline-tags))))
    (cond
      ((not t) (noop))
      ((not (user-directly-in? t))
       (if downwards? (structured-insert-down) (structured-insert-up)))
      ((tree-in? t user-multiline-tags)
       (table-insert-row downwards?))
      (else
        (let* ((rows (user-with-new-row (user-equation-rows t) downwards?))
               (idx  (if downwards? (- (length rows) 1) 0))
               (tab  `(tformat (table ,@rows))))
          ;; keep the display environment (numbered or not) and put the
          ;; rows in a gathered inside it
          (let ((body (tree-ref t 0)))
            (tree-set! body `(document (gathered ,tab)))
            (tree-go-to t 0 0 0 0 idx 0 :start)))))))

(user-kbd-map
        (:mode in-math?)
        ("A-down" (user-multiline-equation #t))
        ("A-up" (user-multiline-equation #f))
        ("`" "" "")
        ("` ` `" "`")
        ("` <" (math-bracket-open "<langle>" "<rangle>" #f))
        ("` < <" (math-bracket-open "<llangle>" "<rrangle>" #f))
          
        ("C-/" (make-fraction))
        ("C-/ var" (make 'frac*))

        ("` ~" (make-wide "~"))
        ("` ^" (make-wide "^"))
        ("` @" (make-wide "<abovering>"))
        ("` -" (make-wide "<wide-bar>"))
        ("` - >" (make-wide "<vect>"))

        ("` *" "<times>")
        ("` * var" "<star>")

        ;; Inside math "$" does nothing; "$ $" only upgrades empty inline math.
        ("$" (noop))
        ("$ $" (user-dollar-dollar))
        ("` $" (make 'text))

        ("` +" (math-big-operator "int"))
        ("` + var" (math-big-operator "iint"))
        ("` + var var" (math-big-operator "iiint"))
        ("` + var var var" (math-big-operator "oint"))
        ("` + o" (math-big-operator "oint"))
        ("` + +" (math-big-operator "sum"))

        ("` (" (make 'matrix))
        ("` ( var" (make 'bmatrix))
        ("` ( var var" (make 'tabular*))
        ("` ( var" (make 'bmatrix))

        ("` {" (make 'cases))
        ("` { var" (make 'choice))


        ("( math t" (make 'matrix))
        ("[ math t" (make 'bmatrix))
        ("{ math t" (make 'choice))
        ("math t" (insert-go-to '(lga "t" (table (row (cell "")))) '(1 0 0 0 0)))
        ("math t var" (make 'tabular*))
        ("math t var var" (make 'stack))
        ("math t var var var" (make 'choice))


        (":" ":")
        (": var" "<suchthat>")
        (": var var" "<of>")
        (": var var var" "<over>")
                
         
        ("alpha" "<alpha>")
        ("beta" "<beta>")
        ("delta" "<delta>")
        ("Delta" "<Delta>")
        ("varepsilon" "<varepsilon>")
        ("varepsilon var" "<epsilon>")
        ("varphi" "<varphi>")
        ("varphi var" "<phi>")
        ("Phi" "<Phi>")
        ("gamma" "<gamma>")
        ("Gamma" "<Gamma>")
        ("eta" "<eta>")
        ("theta" "<theta>")
        ("theta var" "<vartheta>")
        ("Theta" "<Theta>")
        ("kappa" "<kappa>")
        ("lambda" "<lambda>")
        ("Lambda" "<Lambda>")
        ("mu" "<mu>")
        ("nu" "<nu>")
        ("pi" "<pi>")
        ("Pi" "<Pi>")
        ("chi" "<chi>")
        ("Chi" "<Chi>")
        ("rho" "<rho>")
        ("sigma" "<sigma>")
        ("Sigma" "<Sigma>")
        ("Sigma var" "<sum>")
        ("tau" "<tau>")
        ("upsilon" "<upsilon>")
        ("Upsilon" "<Upsilon>")
        ("omega" "<omega>")
        ("Omega" "<Omega>")
        ("xi" "<xi>")
        ("Xi" "<Xi>")
        ("psi" "<psi>")
        ("psi var" "<psi>")
        ("Psi" "<Psi>")
        ("zeta" "<zeta>")
)

;; LaTeX table macros (lga) (see latex-user-extensions.scm)
(load (url->system (url-unix "$TEXMACS_HOME_PATH/progs" "latex-user-extensions.scm")))

