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

;; Keys below use Mogan's prefix names (var, math). The user layer stores a key
;; literally, but the keyboard delivers physical keys: Tab, Alt+letter.
;; So a binding written "A-t var var" never fired from the keyboard (only through
;; emulate-keyboard). user-kbd-map+ registers each binding under both spellings.
;; var -> tab, unvar -> S-tab, "math k" -> A-k.
(define (user-key-tokens s)
  (let loop ((cs (string->list s)) (cur '()) (acc '()))
    (define (flush) (if (null? cur) acc (cons (list->string (reverse cur)) acc)))
    (cond ((null? cs) (reverse (flush)))
          ((char=? (car cs) #\space) (loop (cdr cs) '() (flush)))
          (else (loop (cdr cs) (cons (car cs) cur) acc)))))

(define (user-join-tokens ts)
  (if (null? (cdr ts)) (car ts) (string-append (car ts) " " (user-join-tokens (cdr ts)))))

(define (user-physical-key key)
  (let loop ((ts (user-key-tokens key)) (acc '()))
    (cond ((null? ts) (user-join-tokens (reverse acc)))
          ((and (equal? (car ts) "math") (pair? (cdr ts)))
           (loop (cddr ts) (cons (string-append "A-" (cadr ts)) acc)))
          ((equal? (car ts) "var") (loop (cdr ts) (cons "tab" acc)))
          ((equal? (car ts) "unvar") (loop (cdr ts) (cons "S-tab" acc)))
          (else (loop (cdr ts) (cons (car ts) acc))))))

(define-macro (user-kbd-map+ . l)
  `(user-kbd-map
     ,@(apply append
         (map (lambda (c)
                (if (and (pair? c) (string? (car c)) (pair? (cdr c))
                         (not (equal? (user-physical-key (car c)) (car c))))
                    (list c (cons (user-physical-key (car c)) (cdr c)))
                    (list c)))
              l))))

 
(user-kbd-unmap
        (:mode in-math?)
        "| `")

;; Copy to / cut to a format: Ctrl+Shift+C or Ctrl+Shift+X, then a letter. The keys are
;; written as the physical keys (C-C is Ctrl+Shift+c); Mogan's own copy-to prefix has no
;; keyboard binding in this setup. Nothing happens when no text is selected: the clipboard
;; command crashed Mogan in that case when I drove it through the key dispatcher.
;; Paste from has no key: Ctrl+Shift+V is Mogan's smart paste, which already detects LaTeX.
(tm-define (user-copy-to fmt)
  (when (selection-active-any?) (clipboard-copy-export fmt "primary")))

(tm-define (user-cut-to fmt)
  (when (selection-active-any?) (clipboard-cut-export fmt "primary")))

(user-kbd-map
        ("C-C l" (user-copy-to "latex"))
        ("C-C h" (user-copy-to "html"))
        ("C-C v" (user-copy-to "verbatim"))
        ("C-C b" (user-copy-to "bibtex"))
        ("C-C s" (user-copy-to "stem"))
        ("C-C c" (user-copy-to "code"))
        ("C-C u" (user-copy-to "tmu"))
        ("C-C t" (user-copy-to "texmacs"))
        ("C-X l" (user-cut-to "latex"))
        ("C-X h" (user-cut-to "html"))
        ("C-X v" (user-cut-to "verbatim"))
        ("C-X b" (user-cut-to "bibtex"))
        ("C-X s" (user-cut-to "stem"))
        ("C-X c" (user-cut-to "code"))
        ("C-X u" (user-cut-to "tmu"))
        ("C-X t" (user-cut-to "texmacs")))


;; "$" in text starts inline math (built-in); "$ $" starts display math.  The
;; built-in "$ $" binding ignores context and would nest a display equation
;; inside math.  When the sequence completes, Mogan has already undone the
;; tentative first "$", so "not in math" here means the sequence began in text.
;; Insert actions for the table/operator macros. The document needs the style package
;; that defines the macro; without it the tag is unknown and shows as a plain table.
(tm-define (user-ensure-package pack)
  (if (not (has-style-package? pack)) (add-style-package pack)))

(tm-define (user-insert-lga)
  (user-ensure-package "lga")
  (insert-go-to '(lga "t" (table (row (cell "")))) '(1 0 0 0 0)))

(tm-define (user-insert-oper)
  (user-ensure-package "oper")
  ;; explicit tree: (make 'oper) gives an empty tag until the new style is compiled
  (insert-go-to '(oper "") '(0 0)))

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

(user-kbd-map+
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
        ("math t" (user-insert-lga))
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


;; Typing \name and Enter: the shorthands of latex-user-extensions.scm. Without these
;; entries Mogan only finds \name if the document's style defines a macro of that name.
(kbd-commands
  ("mc" "Use calligraphic font" (make-with "font" "cal"))
  ("mb" "Use blackboard bold font" (make-with "font" "Bbb"))
  ("mbf" "Use bold font series" (make-with "font-series" "bold"))
  ("mf" "Use fraktur font" (make-with "font" "Euler"))
  ("ms" "Use script font" (make-with "font" "cal*"))
  ("R" "insert#<bbb-R>" (kbd-insert "<bbb-R>"))
  ("C" "insert#<bbb-C>" (kbd-insert "<bbb-C>"))
  ("Q" "insert#<bbb-Q>" (kbd-insert "<bbb-Q>"))
  ("Z" "insert#<bbb-Z>" (kbd-insert "<bbb-Z>"))
  ("N" "insert#<bbb-N>" (kbd-insert "<bbb-N>"))
  ("1" "insert#<bbb-1>" (kbd-insert "<bbb-1>"))
  ("oper" "Operator name" (user-insert-oper))
  ("lga" "Left-aligned column" (user-insert-lga))
) ;kbd-commands
