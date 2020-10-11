;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

(require 'mu4e)

(setq evil-org-movement-bindings
      '((up .    "l")
        (down .  "a")
        (left .  "i")
        (right . "e")))

(after! avy
  (setq avy-keys '(?u ?i ?a ?e ?n ?r ?t ?d)))

(after! ace-window
  (setq aw-keys '(?n ?r ?t ?d)))

(map!
 :nimv "C-ö" #'evil-scroll-line-up
 :nimv "C-ü" #'evil-scroll-line-down
 :m    "C-b" #'better-jumper-jump-backward
 :m    "C-f" #'better-jumper-jump-forward

 :i "C-ä"   (λ! (insert-char #x200b))

 :n "•"  #'repeat

 :n "gC" #'+nav-flash/blink-cursor

 "M-t"   #'split-switch-right
 "M-r"   #'split-switch-below

 "s-I"   #'windmove-left
 "s-L"   #'windmove-up
 "s-A"   #'windmove-down
 "s-E"   #'windmove-right

 "M-<up>"     #'drag-stuff-up
 "M-<down>"   #'drag-stuff-down

 "M-w"      #'fixup-whitespace
 "M-;"      #'evil-comment-dwim

 "<M-tab>"           #'+workspace:switch-next
 "<M-S-iso-lefttab>" #'+workspace:switch-previous
 "C-q"               #'+workspace/close-window-or-workspace
 :i "<C-tab>"        #'expand-abbrev
 "S-SPC"             #'dabbrev-expand

 "M-(" #'centaur-tabs-backward-tab
 "M-)" #'centaur-tabs-forward-tab

 :e "SPC" #'doom/leader)

(map! :leader
      (:prefix "b"
       :desc "Bury buffer"                "b" #'bury-buffer
       :desc "Unbury buffer"              "z" #'unbury-buffer
       :desc "Switch to buffer in window" "o" #'+ivy/switch-workspace-buffer-other-window
       :desc "Kill buffer and window"     "w" #'kill-buffer-and-window
       :desc "Kill some buffers"          "k" #'kill-some-buffers
       :desc "Open buffer as popup"       "*" #'+popup/buffer
       :desc "Yank current line position" "y" #'copy-current-line-position-to-clipboard
       (:prefix "f"
        :desc "Increase font size" "=" #'doom/increase-font-size
        :desc "Decrease font size" "-" #'doom/decrease-font-size
        :desc "Reset font size"    "r" #'doom/reset-font-size))
      (:prefix "c"
       :desc "Copy and comment line(s)" ";" #'evilnc-copy-and-comment-lines)
      (:prefix "f"
       :desc "Treemacs"      "t" #'+treemacs/find-file)
      (:prefix "o"
       "p" nil
       "P" nil
       :desc "PassWord"           "w" #'pass
       :desc "Calendar"           "c" #'=calendar
       :desc "Snippet Table"      "t" #'yas-describe-tables
       :desc "Toggle Shell Popup" "s" #'+shell/toggle
       :desc "Toggle Shell Popup" "S" #'+shell/here
       :desc "Mail"               "m" #'=mu4e
       :desc "Eww"                "b" #'eww)
      (:prefix "p"
       :desc "Treemacs" "t" #'treemacs)
      (:prefix "t"
       :desc "Toggle Tabs"     "TAB" #'centaur-tabs-mode
       :desc "Open Treemacs"   "t"   #'+treemacs/toggle
       :desc "Frame maximized" "M"   #'toggle-frame-maximized
       :desc "Modeline"        "m"   #'hide-mode-line-mode)
      (:prefix "TAB"
       :desc "Create new workspace"         "c" #'+workspace/new
       :desc "Clear workspace"              "q" #'doom/kill-all-buffers
       ;; :desc "Switch to previous workspace" "n" #'+workspace:switch-previous
       ;; :desc "Switch to next workspace"     "t" #'+workspace:switch-next
       )
      (:prefix "w"
       "d"   #'ace-delete-window
       "D"   #'ace-delete-other-windows
       "O"   #'delete-other-windows
       "s"   #'split-switch-right
       "v"   #'split-switch-below
       "C-w" #'ace-swap-window
       "w"   #'ace-window
       "."   #'treemacs-select-window
       ","   #'switch-window

       "f"   #'doom/window-maximize-buffer
       "h"   #'doom/window-maximize-horizontally
       "m"   #'doom/window-maximize-vertically

       ;; "n"   #'windmove-left
       ;; "g"   #'windmove-up
       ;; "r"   #'windmove-down
       ;; "t"   #'windmove-right
       )

      "`" nil

      :desc "Switch to last buffer"    "(" #'evil-switch-to-windows-last-buffer
      :desc "Switch to last window"    "[" #'evil-window-mru
      :desc "Switch to last workspace" "{" #'+workspace/other
      :desc "Open agenda"              "a" #'org-agenda
      :desc "Toggle last popup"        "~" #'+popup/toggle)


;;
;;; Module keybindings

(map!
 (:after company
  (:map company-active-map
   "<tab>" nil
   "TAB" nil
   "C-a" #'company-avy
   "C-l" #'company-show-location))

 (:map comint-mode-map
  "C-l" #'comint-previous-prompt
  "C-s" #'counsel-shell-history
  "C-a" #'comint-next-prompt)

 (:map cfw:calendar-mode-map
  "SPC" nil
  "g" nil
  "gss" #'evil-avy-goto-char-2
  "gsa" #'evilem-motion-next-line
  "gsl" #'evilem-motion-previous-line
  "x" #'cfw:org-capture
  "d" #'cfw:org-open-agenda-day
  "M-e" #'cfw:navi-next-day-command
  "M-i" #'cfw:navi-previous-day-command
  "M-l" #'cfw:navi-previous-week-command
  "M-a" #'cfw:navi-next-week-command
  "<up>"    #'evil-previous-visual-line
  "<down>"  #'evil-next-visual-line
  "<left>"  #'evil-backward-char
  "<right>" #'evil-forward-char)

 (:after dired
  (:map wdired-mode-map
   :n "RET" #'wdired-finish-edit
   :n "C-q" #'wdired-abort-changes)
  (:map dired-mode-map
   :n "TAB" nil
   :n "TAB" #'+dired-subtree-toggle
   "za" nil                             ;FIXME
   "za"  #'+dired-subtree-toggle
   :n "DEL"  #'+dired-subtree-remove
   "C-l"  #'dired-subtree-up
   "C-a"  #'dired-subtree-up
   "C-k" #'+dired-kill-subdir
   "C-q" #'+dired-kill-all-subdir
   :n "-"     (lambda () (interactive) (find-alternate-file ".."))
   :localleader
   "f" #'find-lisp-find-dired
   "/" #'dired-narrow))

 (:after evil-easymotion
  (:map evilem-map
   "c" #'evilem-motion-find-char
   "f" #'evilem--motion-function-evil-forward-arg
   "F" #'evilem--motion-function-evil-backward-arg
   "a" #'evilem-motion-next-line
   "l" #'evilem-motion-previous-line))

 (:after evil-org-agenda
  (:map evil-org-agenda-mode-map
   :m "gs" nil
   "gx" #'what-cursor-position
   "ä" #'org-agenda-day-view
   :localleader
   "p" #'org-agenda-priority))

 (:after org
  (:map org-cdlatex-mode-map
   "`" nil
   ;; "C-l" #'cdlatex
   ))

 (:after evil-snipe
  (:map evil-snipe-parent-transient-map
   "–" #'evil-snipe-repeat-reverse
   "," #'evil-snipe-repeat)
  (:map (evil-snipe-override-local-mode-map
         evil-snipe-override-mode-map)
   :m "–" #'evil-snipe-repeat-reverse
   :m "," #'evil-snipe-repeat))

 (:map evil-motion-state-map
  "C-w" #'+workspace/delete)

 (:map evil-normal-state-map
  (:prefix "g"
   "–" #'goto-last-change-reverse
   "<" #'evil-numbers/dec-at-pt-incremental
   ">" #'evil-numbers/inc-at-pt-incremental)
  "g a" nil
  "g b" #'what-cursor-position)



 (:map evil-visual-state-map
  "S" nil
  "." #'evil-repeat
  "M-s" #'evil-surround-region)

 (:map evil-surround-mode-map
  :v "S" nil)

 (:map git-rebase-mode-map
  "gl"  #'git-rebase-move-line-up
  "ga"  #'git-rebase-move-line-down
  "M-l" #'git-rebase-move-line-up
  "M-a" #'git-rebase-move-line-down)

 (:map global-map
  "M-s" nil)

 (:map Info-mode-map
  "M-a"  #'Info-next
  "M-l"  #'Info-prev
  "C-a"  #'Info-next-preorder
  "C-l"  #'Info-last-preorder
  (:after evil-easymotion
   :m "gs" evilem-map))

 (:map ivy-switch-buffer-map
  "C-k" #'ivy-switch-buffer-kill)

 (:map ivy-minibuffer-map
  "C-k"   #'ivy-kill-whole-line
  "C-a"   #'ivy-avy
  "C-RET" #'ivy-immediate-done
  "M-s"   #'ivy-kill-ring-save
  "M-m"   #'ivy-mark
  "C-d"   (λ! (ivy--cd "/")))

 (:map (LaTeX-mode-map org-mode-map)
  ;; Greek lower case letters
  "ξ" (λ! (insert "\\xi"))
  "λ" (λ! (insert "\\lambda"))
  "χ" (λ! (insert "\\chi"))
  "ω" (λ! (insert "\\omega"))
  "κ" (λ! (insert "\\kappa"))
  "ψ" (λ! (insert "\\psi"))
  "γ" (λ! (insert "\\gamma"))
  "φ" (λ! (insert "\\varphi"))
  "ϕ" (λ! (insert "\\phi"))
  "ς" (λ! (insert "\\varsigma"))
  "ι" (λ! (insert "\\iota"))
  "α" (λ! (insert "\\alpha"))
  "ε" (λ! (insert "\\varepsilon"))
  "σ" (λ! (insert "\\sigma"))
  "ν" (λ! (insert "\\nu"))
  "ρ" (λ! (insert "\\rho"))
  "τ" (λ! (insert "\\tau"))
  "δ" (λ! (insert "\\delta"))
  "υ" (λ! (insert "\\upsilon"))
  "ϵ" (λ! (insert "\\epsilon"))
  "η" (λ! (insert "\\eta"))
  "π" (λ! (insert "\\pi"))
  "ζ" (λ! (insert "\\zeta"))
  "β" (λ! (insert "\\beta"))
  "μ" (λ! (insert "\\mu"))
  "ϱ" (λ! (insert "\\varrho"))
  "ϑ" (λ! (insert "\\vartheta"))
  "θ" (λ! (insert "\\theta"))
  ;; Greek upper case letters
  "Ξ" (λ! (insert "\\Xi"))
  "Λ" (λ! (insert "\\Lambda"))
  "Ω" (λ! (insert "\\Omega"))
  "Ψ" (λ! (insert "\\Psi"))
  "Γ" (λ! (insert "\\Gamma"))
  "Φ" (λ! (insert "\\Phi"))
  "Δ" (λ! (insert "\\Delta"))
  "Θ" (λ! (insert "\\Theta"))
  "Π" (λ! (insert "\\Pi"))
  "Σ" (λ! (insert "\\Sigma"))
  ;; Mathematical symbols
  "¬" (λ! (insert "\\neg"))
  "∨" (λ! (insert "\\lor"))
  "∧" (λ! (insert "\\land"))
  "⊥" (λ! (insert "\\bot"))
  "∡" (λ! (insert "\\measuredangle"))
  "∥" (λ! (insert "\\|"))
  "→" (λ! (insert "\\to"))
  "∞" (λ! (insert "\\infty"))
  "∝" (λ! (insert "\\propto"))
  "∅" (λ! (insert "\\emptyset"))
  "√" (λ! (insert "\\sqrt"))
  "ℂ" (λ! (insert "\\mathbb{C}"))
  "ℚ" (λ! (insert "\\mathbb{Q}"))
  "∘" (λ! (insert "\\circ"))
  "⊂" (λ! (insert "\\subset"))
  "∫" (λ! (yas/insert-by-name "int"))
  "∀" (λ! (insert "\\forall"))
  "∃" (λ! (insert "\\exists"))
  "∈" (λ! (insert "\\in"))
  "ℕ" (λ! (insert "\\mathbb{N}"))
  "ℝ" (λ! (insert "\\mathbb{R}"))
  "∂" (λ! (insert "\\partial"))
  "∇" (λ! (insert "\\nabla"))
  "∪" (λ! (insert "\\cup"))
  "∩" (λ! (insert "\\cap"))
  "ℵ" (λ! (insert "\\aleph"))
  "ℤ" (λ! (insert "\\mathbb{Z}"))
  "⇐" (λ! (insert "\\Leftarrow"))
  "⇔" (λ! (insert "\\Leftrightarrow"))
  "⇒" (λ! (insert "\\Rightarrow"))
  "↦" (λ! (insert "\\mapsto"))
  ;; Misc
  "¹" (λ! (insert "^1"))
  "²" (λ! (insert "^2"))
  "³" (λ! (insert "^3"))
  ;; :i "1" (λ! (insert "")) ;;TODO
  "₂" (λ! (insert "_2"))
  "₃" (λ! (insert "_3"))
  "›" (λ! (insert ""))              ;TODO
  "‹" (λ! (insert ""))              ;TODO
  "¢" (λ! (insert "\\textcent"))
  "¥" (λ! (insert "\\textyen"))
  "‘" (λ! (insert "`"))
  "’" (λ! (insert "\'"))
  ;; :i "ſ" (λ! (insert ""))              ;too complicated
  "ª" (λ! (insert "^a"))
  "º" (λ! (insert "^o"))
  "№" (λ! (insert "\\textnumero"))
  "·" (λ! (insert "\\cdot"))
  "£" (λ! (insert "\\pounds"))
  "¤" (λ! (insert "\\textcurrency"))
  "°" (λ! (insert "\\degree"))
  "§" (λ! (insert "\\S"))
  "ℓ" (λ! (insert "\\ell"))
  "»" (λ! (insert "\\guillemotright"))
  "«" (λ! (insert "\\guillemotleft"))
  ;; :i "€" (λ! (insert ""))
  "„" (λ! (insert ",,"))
  "“" (λ! (insert "``"))
  "”" (λ! (insert "\'\'"))
  "—" (λ! (insert "\\textemdash"))
  "…" (λ! (insert "\\dots"))
  "­" (λ! (insert "\\-"))
  ;; Number block
  "␣" (λ! (insert "\\textvisiblespace"))
  "♦" (λ! (insert "\\diamondsuit"))
  "♥" (λ! (insert "\\heartsuit"))
  "♠" (λ! (insert "\\spadesuit"))
  "♣" (λ! (insert "\\clubsuit"))
  ;; :i "‣" (λ! (insert "\\-"))           ;We have \item for this
  "✔" (λ! (insert "\\checkmark"))
  "✘" (λ! (insert "\\xmark"))
  "†" (λ! (insert "\\Cross"))
  "↔" (λ! (insert "\\leftrightarrow"))
  "↓" (λ! (insert "\\downarrow"))
  "⇌" (λ! (insert "\\rightleftharpoons "))
  "←" (λ! (insert "\\leftarrow"))
  "→" (λ! (insert "\\rightarrow"))
  "↕" (λ! (insert "\\updownarrow"))
  "↑" (λ! (insert "\\uparrow"))
  ;; :i "⃗" (λ! (insert ""))               ;Weird
  "±" (λ! (insert "\\pm"))
  "÷" (λ! (insert "\\div"))
  "⋅" (λ! (insert "\\circ"))
  "−" (λ! (insert "−"))
  "∓" (λ! (insert "\\mp"))
  "≠" (λ! (insert "\\neq"))
  "∕" (λ! (insert "\\-"))
  "×" (λ! (insert "\\times"))
  "∖" (λ! (insert "\\setminus"))
  "□" (λ! (insert "\\Box"))
  "″" (λ! (insert "^{\\prime\\prime}"))
  "⌊" (λ! (insert "\\lfloor"))
  "⋃" (λ! (yas/insert-by-name "bigcup"))
  "⌋" (λ! (insert "\\rfloor"))
  "⊆" (λ! (insert "\\subseteq"))
  "⊷" (λ! (insert "\\imageof "))
  "⊇" (λ! (insert "\\supseteq"))
  "⌈" (λ! (insert "\\leftceil"))
  "⋂" (λ! (yas/insert-by-name "bigcap"))
  "⌉" (λ! (insert "\\rightceil"))
  "∔" (λ! (insert "\\dotplus"))
  "≡" (λ! (insert "\\equiv"))
  "∣" (λ! (insert "\\bigm|"))
  "⊗" (λ! (insert "\\otimes"))
  "∸" (λ! (insert "\\dotdiv"))
  "‰" (λ! (insert "\\textperthousand"))
  "′" (λ! (insert "^{\\prime}"))
  "≤" (λ! (insert "\\leq"))
  "∪" (λ! (insert "\\cup"))
  "≥" (λ! (insert "\\geq"))
  "⊂" (λ! (insert "\\subset"))
  "⊶" (λ! (insert "\\original"))
  "⊃" (λ! (insert "\\supset"))
  "≪" (λ! (insert "\\ll"))
  "∩" (λ! (insert "\\cap"))
  "≫" (λ! (insert "\\rr"))
  "⊕" (λ! (insert "\\oplus"))
  "≈" (λ! (insert "\\approx"))
  "⌀" (λ! (insert "\\emptyset"))
  "⊙" (λ! (insert "\\odot"))
  "⊖" (λ! (insert "\\ominus")))

 (:after tex
  (:map LaTeX-mode-map
   "C-RET" nil
   "C-RET" #'+LaTeX/new-item
   :localleader
   "a" #'TeX-command-run-all
   "-" #'TeX-recenter-output-buffer
   "x" #'TeX-kill-job
   "v" #'TeX-view
   "l" #'TeX-recenter-output-buffer
   "*" #'LaTeX-mark-section
   "." #'LaTeX-mark-environment
   "c" #'LaTeX-close-environment
   "e" #'LaTeX-environment
   "s" #'LaTeX-section
   (:prefix "p"
    "b" #'preview-buffer
    "c" #'preview-clearout
    "d" #'preview-document
    "e" #'preview-environment
    "f" #'preview-cache-preamble
    "p" #'preview-at-point
    "r" #'preview-region
    "s" #'preview-section)))

 (:after tex-fold
  (:map TeX-fold-mode-map
   :localleader
   "f" nil
   (:prefix "f"
    "b" #'TeX-fold-buffer
    "c" #'TeX-fold-comment
    "e" #'TeX-fold-env
    "f" #'TeX-fold-dwim
    "m" #'TeX-fold-macro
    "p" #'TeX-fold-paragraph
    "r" #'TeX-fold-region
    "B" #'TeX-fold-clearout-buffer
    "R" #'TeX-fold-clearout-region
    "P" #'TeX-fold-clearout-paragraph
    "I" #'TeX-fold-clearout-item)))

 (:map (mu4e-headers-mode-map mu4e-main-mode-map mu4e-view-mode-map)
  "C-s" #'mu4e-headers-search
  :localleader
  "p" (λ! (mu4e-headers-search "maildir:/posteo/INBOX"))
  "z" (λ! (mu4e-headers-search "maildir:/zih/INBOX")))
 (:map (mu4e-headers-mode-map mu4e-view-mode-map)
  :n "s" nil
  :n "s" #'evil-snipe-s
  :n "S" nil
  :n "S" #'evil-snipe-S
  :n "gt" #'mu4e-headers-toggle-threading
  :n "zt" nil
  :n "zt" #'evil-scroll-line-to-top
  :n "C-a" #'mu4e-view-headers-next
  :n "C-l" #'mu4e-view-headers-prev
  :n "t"   #'mu4e-headers-mark-subthread
  :n "C-t" #'mu4e-headers-mark-thread
  :n "C-i" #'mu4e-headers-query-prev
  :n "C-e" #'mu4e-headers-query-next)
 (:map  mu4e-compose-mode-map
  "C-q" #'mu4e-message-kill-buffer)

 (:after org :map org-mode-map
  :n "M-<return>" nil
  "M-<return>"    #'+org-ctrl-c-ret
  "M-<up>"        #'org-timestamp-up
  "M-<down>"      #'org-timestamp-down
  :localleader
  "dt"   #'+org-time-stamp
  "dT"   #'org-time-stamp
  "G"    #'+mu4e/spook
  "s"    #'message-send-and-exit
  "n"    #'org-add-note
  "^"    #'org-sort
  "D"    #'org-cut-special
  "P"    #'org-paste-special
  "x"    #'+org-toggle-checkbox
  "v"    #'org-mark-element
  "V"    #'org-mark-subtree
  "Y"    #'org-copy-special
  "y"    #'org-rich-yank
  "z"    #'org-insert-drawer
  :prefix "L"
  "f"   #'org-toggle-latex-fragment
  "F"   #'org-remove-latex-fragment
  "B"   #'org-remove-latex-buffer
  "b"   #'org-preview-latex-buffer
  "e"   #'cdlatex-environment
  :prefix "b"
  "y"   #'org-table-copy-region
  "d"   #'org-table-cut-region
  "D"   #'org-table-delete-column
  "p"   #'org-table-paste-rectangle
  "+"   #'org-table-sum
  "^"   #'org-table-sort-lines
  "RET" #'org-table-hline-and-move
  "|"   #'org-table-insert-column)

 (:after evil-org :map evil-org-mode-map
  :niv "M-l"           #'org-metaup
  :niv "M-i"           #'org-shiftmetaleft
  :niv "M-a"           #'org-metadown
  :niv "M-e"           #'org-shiftmetaright
  :niv "M-l"           #'org-metaup
  :niv "M-I"           #'org-metaleft
  :niv "M-A"           #'org-shiftmetadown
  :niv "M-E"           #'org-metaright
  :niv "M-L"           #'org-shiftmetaup)

 (:after pass :map pass-mode-map
  "d" #'pass-kill
  "j" #'pass-goto-entry)

 (:map pdf-view-mode-map
  :n "("       #'+pdf-bottom-last-page
  :n ")"       #'+pdf-top-next-page
  :n ">"       #'image-eob
  :n "<"       #'image-bob
  :n "<left>"  #'image-backward-hscroll
  :n "<right>" #'image-forward-hscroll
  :n "C-a"     #'pdf-view-next-page-command
  :n "C-l"     #'pdf-view-previous-page-command)

 (:map shell-mode-map
  :n "q"     #'kill-current-buffer
  "C-o"      #'comint-clear-buffer
  "C-f"      #'+shell/prompt-for-cwd
  :n "^" #'+shell/up-directory
  :n "-" #'+shell/last-directory
  :localleader
  "w" #'+shell/window-enlargen)

 (:map yas-keymap
  "M-RET" #'yas-expand)

 (:map shr-map             ;Otherwise visual-mode wouldn't be available
  "v" nil))

(add-hook! 'eshell-first-time-mode-hook
  (defun +eshell-keymap-h ()
    ;; Keys must be bound in a hook because eshell resets its keymap every
    ;; time `eshell-mode' is enabled. Why? It is not for us mere mortals to
    ;; grasp such wisdom.
    (map! :map eshell-mode-map
          :nmi "q" #'+eshell/kill-and-close
          :nmi "C-q"  #'+eshell/kill-and-close
          :nmi "C-f" #'+eshell/prompt-for-cwd
          :nmi "C-l" #'+eshell/last-directory
          :nmi "C-o" #'+eshell-open-cwd-dired
          :nmi "C-r" #'+eshell-complete-recent-dir
          :nmi "C-d" #'+eshell/up-directory
          :nmi "C-u" #'+eshell/up-directory
          :localleader
          "f" #'+eshell/prompt-for-cwd
          "d" #'+eshell/up-directory
          "l" #'+eshell/last-directory
          "o" #'+eshell-open-cwd-dired
          "r" #'+eshell-complete-recent-dir)))


(after! treemacs-evil
  (evil-define-key 'treemacs treemacs-mode-map "l" nil)
  (map!
   (:map treemacs-mode-map
    "l" nil)
   (:map evil-treemacs-state-map
    "j"       nil
    "l"       nil
    "-"       #'treemacs-root-up
    "p"       #'treemacs-peek
    "l"       #'treemacs-root-up
    "a"       #'treemacs-root-down
    "i"       #'treemacs-i-action
    "e"       #'treemacs-e-action
    "M-i"     #'treemacs-previous-line-other-window
    "M-e"     #'treemacs-next-line-other-window
    "M-l"     #'treemacs-previous-neighbour
    "M-a"     #'treemacs-next-neighbour
    "<left>"  #'treemacs-left-action
    "<right>" #'treemacs-right-action)))

(provide '+bindings)
