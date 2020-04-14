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
 :nimv "C-u" #'evil-scroll-line-up
 :nimv "C-ü" #'evil-scroll-line-down
 :m    "C-b" #'better-jumper-jump-backward
 :m    "C-f" #'better-jumper-jump-forward

 :i "C-ö"   (λ! (insert-char #x200b))

 :n "gt" nil ;overwritten by some minor modes
 :n "gT" nil ;so it has been rebound to SPC-TAB-n/t

 :n "."  #'repeat
 :n "•"  #'evil-repeat

 :n "gC" #'+nav-flash/blink-cursor

 :i "M-RET" #'yas-expand
 "M-]"   #'sp-unwrap-sexp
 "M-["   #'sp-backward-unwrap-sexp

 "M-t"   #'split-switch-right
 "M-r"   #'split-switch-below

 "M-w"   #'fixup-whitespace

 :e "SPC" #'doom/leader
 )

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
      (:prefix "f"
        :desc "Treemacs"      "t" #'+treemacs/find-file)
      (:prefix "o"
        "p" nil
        "P" nil
        :desc "Calendar"           "c" #'=calendar
        :desc "Snippet Table"      "t" #'yas-describe-tables
        :desc "Toggle Shell Popup" "s" #'+shell/toggle
        :desc "Toggle Shell Popup" "S" #'+shell/here
        :desc "Mail"               "m" #'=mu4e
        :desc "Eww"                "b" #'eww
        :desc "PassWord"           "w" #'=pass)
      (:prefix "t"
        :desc "Open Treemacs"   "t" #'+treemacs/toggle
        :desc "Frame maximized" "M" #'toggle-frame-maximized
        :desc "Modeline"        "m" #'hide-mode-line-mode)
      (:prefix "TAB"
        :desc "Create new workspace"         "c" #'+workspace/new
        :desc "Switch to previous workspace" "n" #'+workspace:switch-previous
        :desc "Switch to next workspace"     "t" #'+workspace:switch-next)
      (:prefix "w"
        "d"   #'ace-delete-window
        "D"   #'ace-delete-other-windows
        "O"   #'delete-other-windows
        "s"   #'split-switch-right
        "v"   #'split-switch-below
        "C-w" #'ace-swap-window
        "w"   #'ace-window
        "."   #'treemacs-select-window

        "f"   #'doom/window-maximize-buffer
        "h"   #'doom/window-maximize-horizontally
        "m"   #'doom/window-maximize-vertically

        "n"   #'windmove-left
        "g"   #'windmove-up
        "r"   #'windmove-down
        "t"   #'windmove-right)

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
     "C-a" #'company-avy
     "C-l" #'company-show-location))

 (:map comint-mode-map
   "C-l" #'comint-previous-prompt
   "C-a" #'comint-next-prompt)

 (:map cfw:calendar-mode-map
   "SPC" nil
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

 (:map dired-mode-map
   :n "-"     (lambda () (interactive) (find-alternate-file "..")))

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

 (:after evil-snipe
   (:map evil-snipe-parent-transient-map
     "," nil
     "," #'evil-snipe-repeat
     "–" #'evil-snipe-repeat-reverse))

 (:map evil-normal-state-map
   (:prefix "g"
     "<" #'evil-numbers/dec-at-pt-incremental
     ">" #'evil-numbers/inc-at-pt-incremental)
   "g a" nil
   "g b" #'what-cursor-position)

 (:map evil-visual-state-map
   "S" nil
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
   "C-a"  #'Info-next-preorder
   "C-l"  #'Info-last-preorder

   :nmv "gs" #'+evil/easymotion
   :n "b" #'what-cursor-position)

 (:map ivy-switch-buffer-map
   "C-k" #'ivy-switch-buffer-kill)

 (:map ivy-minibuffer-map
   "C-k"   #'ivy-kill-whole-line
   "C-a"   #'ivy-avy
   "C-RET" #'ivy-immediate-done
   "M-s"   #'ivy-kill-ring-save
   "M-m"   #'ivy-mark
   "C-d"   (λ! (ivy--cd "/")))

 (:map LaTeX-mode-map
   ;; Greek lower case letters
   :i "ξ" (λ! (insert "\\xi"))
   :i "λ" (λ! (insert "\\lambda"))
   :i "χ" (λ! (insert "\\chi"))
   :i "ω" (λ! (insert "\\omega"))
   :i "κ" (λ! (insert "\\kappa"))
   :i "ψ" (λ! (insert "\\psi"))
   :i "γ" (λ! (insert "\\gamma"))
   :i "φ" (λ! (insert "\\varphi"))
   :i "ϕ" (λ! (insert "\\phi"))
   :i "ς" (λ! (insert "\\varsigma"))
   :i "ι" (λ! (insert "\\iota"))
   :i "α" (λ! (insert "\\alpha"))
   :i "ε" (λ! (insert "\\varepsilon"))
   :i "σ" (λ! (insert "\\sigma"))
   :i "ν" (λ! (insert "\\nu"))
   :i "ρ" (λ! (insert "\\rho"))
   :i "τ" (λ! (insert "\\tau"))
   :i "δ" (λ! (insert "\\delta"))
   :i "υ" (λ! (insert "\\upsilon"))
   :i "ϵ" (λ! (insert "\\epsilon"))
   :i "η" (λ! (insert "\\eta"))
   :i "π" (λ! (insert "\\pi"))
   :i "ζ" (λ! (insert "\\zeta"))
   :i "β" (λ! (insert "\\beta"))
   :i "μ" (λ! (insert "\\mu"))
   :i "ϱ" (λ! (insert "\\varrho"))
   :i "ϑ" (λ! (insert "\\vartheta"))
   :i "θ" (λ! (insert "\\theta"))
   ;; Greek upper case letters
   :i "Ξ" (λ! (insert "\\Xi"))
   :i "Λ" (λ! (insert "\\Lambda"))
   :i "Ω" (λ! (insert "\\Omega"))
   :i "Ψ" (λ! (insert "\\Psi"))
   :i "Γ" (λ! (insert "\\Gamma"))
   :i "Φ" (λ! (insert "\\Phi"))
   :i "Δ" (λ! (insert "\\Delta"))
   :i "Θ" (λ! (insert "\\Theta"))
   ;; We treat these specially
   :i "Π" (λ! (yas/insert-by-name "prod"))
   :i "Σ" (λ! (yas/insert-by-name "sum"))
   ;; Mathematical symbols
   :i "¬" (λ! (insert "\\neg"))
   :i "∨" (λ! (insert "\\lor"))
   :i "∧" (λ! (insert "\\land"))
   :i "⊥" (λ! (insert "\\bot"))
   :i "∡" (λ! (insert "\\measuredangle"))
   :i "∥" (λ! (insert "\\|"))
   :i "→" (λ! (insert "\\rightarrow"))
   :i "∞" (λ! (insert "\\infty"))
   :i "∝" (λ! (insert "\\propto"))
   :i "∅" (λ! (insert "\\emptyset"))
   :i "√" (λ! (insert "\\sqrt"))
   :i "ℂ" (λ! (insert "\\mathbb{C}"))
   :i "ℚ" (λ! (insert "\\mathbb{Q}"))
   :i "∘" (λ! (insert "\\circ"))
   :i "⊂" (λ! (insert "\\subset"))
   :i "∫" (λ! (yas/insert-by-name "int"))
   :i "∀" (λ! (insert "\\forall"))
   :i "∃" (λ! (insert "\\exists"))
   :i "∈" (λ! (insert "\\in"))
   :i "ℕ" (λ! (insert "\\mathbb{N}"))
   :i "ℝ" (λ! (insert "\\mathbb{R}"))
   :i "∂" (λ! (insert "\\partial"))
   :i "∇" (λ! (insert "\\nabla"))
   :i "∪" (λ! (insert "\\cup"))
   :i "∩" (λ! (insert "\\cap"))
   :i "ℵ" (λ! (insert "\\aleph"))
   :i "ℤ" (λ! (insert "\\mathbb{Z}"))
   :i "⇐" (λ! (insert "\\Leftarrow"))
   :i "⇔" (λ! (insert "\\Leftrightarrow"))
   :i "⇒" (λ! (insert "\\Rightarrow"))
   :i "↦" (λ! (insert "\\mapsto"))
   ;; Misc
   :i "¹" (λ! (insert "^1"))
   :i "²" (λ! (insert "^2"))
   :i "³" (λ! (insert "^3"))
   ;; :i "1" (λ! (insert "")) ;;TODO
   :i "₂" (λ! (insert "_2"))
   :i "₃" (λ! (insert "_3"))
   :i "›" (λ! (insert ""))              ;TODO
   :i "‹" (λ! (insert ""))              ;TODO
   :i "¢" (λ! (insert "\\textcent"))
   :i "¥" (λ! (insert "\\textyen"))
   :i "‘" (λ! (insert "`"))
   :i "’" (λ! (insert "\'"))
   ;; :i "ſ" (λ! (insert ""))              ;too complicated
   :i "ª" (λ! (insert "^a"))
   :i "º" (λ! (insert "^o"))
   :i "№" (λ! (insert "\\textnumero"))
   :i "·" (λ! (insert "\\cdot"))
   :i "£" (λ! (insert "\\pounds"))
   :i "¤" (λ! (insert "\\textcurrency"))
   :i "°" (λ! (insert "\\degree"))
   :i "§" (λ! (insert "\\S"))
   :i "ℓ" (λ! (insert "\\ell"))
   :i "»" (λ! (insert "\\guillemotright"))
   :i "«" (λ! (insert "\\guillemotleft"))
   ;; :i "€" (λ! (insert ""))
   :i "„" (λ! (insert ",,"))
   :i "“" (λ! (insert "``"))
   :i "”" (λ! (insert "\'\'"))
   :i "—" (λ! (insert "\\textemdash"))
   :i "…" (λ! (insert "\\dots"))
   :i "­" (λ! (insert "\\-"))
   ;; Number block
   :i "␣" (λ! (insert "\\textvisiblespace"))
   :i "♦" (λ! (insert "\\diamondsuit"))
   :i "♥" (λ! (insert "\\heartsuit"))
   :i "♠" (λ! (insert "\\spadesuit"))
   :i "♣" (λ! (insert "\\clubsuit"))
   ;; :i "‣" (λ! (insert "\\-"))           ;We have \item for this
   :i "✔" (λ! (insert "\\checkmark"))
   :i "✘" (λ! (insert "\\xmark"))
   :i "†" (λ! (insert "\\Cross"))
   :i "↔" (λ! (insert "\\leftrightarrow"))
   :i "↓" (λ! (insert "\\downarrow"))
   :i "⇌" (λ! (insert "\\rightleftharpoons "))
   :i "←" (λ! (insert "\\leftarrow"))
   :i "→" (λ! (insert "\\rightarrow"))
   :i "↕" (λ! (insert "\\updownarrow"))
   :i "↑" (λ! (insert "\\uparrow"))
   ;; :i "⃗" (λ! (insert ""))               ;Weird
   :i "±" (λ! (insert "\\pm"))
   :i "÷" (λ! (insert "\\div"))
   :i "⋅" (λ! (insert "\\cdot"))
   :i "−" (λ! (insert "\\testest"))        ;TODO
   :i "∓" (λ! (insert "\\mp"))
   :i "≠" (λ! (insert "\\neq"))
   :i "∕" (λ! (insert "\\-"))
   :i "×" (λ! (insert "\\times"))
   :i "∖" (λ! (insert "\\setminus"))
   :i "□" (λ! (insert "\\Box"))
   :i "″" (λ! (insert "^{\\prime\\prime}"))
   :i "⌊" (λ! (insert "\\lfloor"))
   :i "⋃" (λ! (yas/insert-by-name "bigcup"))
   :i "⌋" (λ! (insert "\\rfloor"))
   :i "⊆" (λ! (insert "\\subseteq"))
   :i "⊷" (λ! (insert "\\imageof "))
   :i "⊇" (λ! (insert "\\supseteq"))
   :i "⌈" (λ! (insert "\\leftceil"))
   :i "⋂" (λ! (yas/insert-by-name "bigcap"))
   :i "⌉" (λ! (insert "\\rightceil"))
   :i "∔" (λ! (insert "\\dotplus"))
   :i "≡" (λ! (insert "\\equiv"))
   :i "∣" (λ! (insert "\\bigm|"))
   :i "⊗" (λ! (insert "\\otimes"))
   :i "∸" (λ! (insert "\\dotdiv"))
   :i "‰" (λ! (insert "\\textperthousand"))
   :i "′" (λ! (insert "^{\\prime}"))
   :i "≤" (λ! (insert "\\leq"))
   :i "∪" (λ! (insert "\\cup"))
   :i "≥" (λ! (insert "\\req"))
   :i "⊂" (λ! (insert "\\subset"))
   :i "⊶" (λ! (insert "\\original"))
   :i "⊃" (λ! (insert "\\supset"))
   :i "≪" (λ! (insert "\\ll"))
   :i "∩" (λ! (insert "\\cap"))
   :i "≫" (λ! (insert "\\rr"))
   :i "⊕" (λ! (insert "\\oplus"))
   :i "≈" (λ! (insert "\\approx"))
   :i "⌀" (λ! (insert "\\emptyset"))
   :i "⊙" (λ! (insert "\\odot"))
   :i "⊖" (λ! (insert "\\ominus")))

 (:map LaTeX-mode-map
   :localleader
   "c" #'TeX-command-run-all)           ;TODO

 (:map (mu4e-headers-mode-map mu4e-main-mode-map mu4e-view-mode-map)
   :localleader
   "p" (λ! (mu4e-headers-search "maildir:/posteo/INBOX"))
   "z" (λ! (mu4e-headers-search "maildir:/zih/INBOX")))
 (:map (mu4e-headers-mode-map mu4e-view-mode-map)
   :n "C-a" #'mu4e-view-headers-next
   :n "C-l" #'mu4e-view-headers-prev
   :n "t"   #'mu4e-headers-mark-subthread
   :n "C-t" #'mu4e-headers-mark-thread
   :n "C-i" #'mu4e-headers-query-prev
   :n "C-e" #'mu4e-headers-query-next)

 (:after org :map org-mode-map
   :n "M-<return>" nil
   "M-<return>"    #'+org-ctrl-c-ret
   "M-<up>"        #'org-previous-visible-heading
   "M-<down>"      #'org-next-visible-heading
   :localleader
   "n"             #'org-add-note
   "^"             #'org-sort
   "D"             #'org-cut-special
   "P"             #'org-paste-special
   "x"             #'+org-toggle-checkbox
   "v"             #'org-mark-element
   "V"             #'org-mark-subtree
   "Y"             #'org-copy-special
   ;; "y"             #'org-yank
   "z"             #'org-insert-drawer
   :prefix "b"
   "y"             #'org-table-copy-region
   "d"             #'org-table-cut-region
   "D"             #'org-table-delete-column
   "p"             #'org-table-paste-rectangle
   "+"             #'org-table-sum
   "^"             #'org-table-sort-lines
   "RET"           #'org-table-hline-and-move
   "|"             #'org-table-insert-column)

 (:after evil-org :map evil-org-mode-map
   "<up>"   nil
   "<down>" nil
   "<up>"   #'evil-previous-visual-line
   "<down>" #'evil-next-visual-line
   :niv "M-l"           #'org-metaup
   :niv "M-i"           #'org-metaleft
   :niv "M-a"           #'org-metadown
   :niv "M-e"           #'org-metaright
   :niv "M-l"           #'org-metaup
   :niv "M-I"           #'org-shiftmetaleft
   :niv "M-A"           #'org-shiftmetadown
   :niv "M-E"           #'org-shiftmetaright
   :niv "M-L"           #'org-shiftmetaup)

 (:after pass :map pass-mode-map
   "q" #'+workspace/delete
   "a" #'pass-next-entry
   "l" #'pass-prev-entry
   "d" #'pass-kill
   "A" #'pass-next-directory
   "L" #'pass-prev-directory
   "j" #'pass-goto-entry)

 (:map pdf-view-mode-map
   :n ">"       #'image-eob
   :n "<"       #'image-bob
   :n "<left>"  #'image-backward-hscroll
   :n "<right>" #'image-forward-hscroll
   :n "C-a"     #'pdf-view-next-page-command
   :n "C-l"     #'pdf-view-previous-page-command)

 (:map shell-mode-map
   :n "q"     #'+shell/toggle
   :n "C-RET" #'+shell/goto-end-of-prompt
   "C-o"      #'comint-clear-buffer
   "C-s"      #'prompt-for-cwd
   "C-h"      #'counsel-shell-history
   :localleader
   "w" #'+shell/window-enlargen)

 (:map yas-keymap
   "M-RET" #'yas-expand))


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
