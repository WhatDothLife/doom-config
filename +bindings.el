;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

(require 'mu4e)

(after! evil-org
  (setq evil-org-movement-bindings
        '((up .    "l")
          (down .  "a")
          (left .  "i")
          (right . "e"))))

(after! avy
  (setq avy-keys '(?u ?i ?a ?e ?n ?r ?t ?d)))

(after! ace-window
  (setq aw-keys '(?n ?r ?t ?d)))

(map!
 :nimv "C-u"  #'evil-scroll-line-up
 :nimv "C-ü"  #'evil-scroll-line-down

 :n "."    #'repeat
 :n "•"    #'evil-repeat

 "M-]"     #'sp-unwrap-sexp
 "M-["     #'sp-backward-unwrap-sexp

 "M-t"     #'split-switch-right
 "M-r"     #'split-switch-below

 "M-w"     #'fixup-whitespace)

(map! :leader
      (:prefix "b"
        :desc "Bury buffer"                 "b" #'bury-buffer
        :desc "Unbury buffer"               "z" #'unbury-buffer
        :desc "Switch to buffer in window"  "o" #'+ivy/switch-workspace-buffer-other-window
        :desc "Kill buffer and window"      "w" #'kill-buffer-and-window
        :desc "Kill some buffers"           "k" #'kill-some-buffers
        :desc "Open buffer as popup"        "*" #'+popup-buffer
        (:prefix "f"
          :desc "Increase font size"  "="   #'doom/increase-font-size
          :desc "Decrease font size"  "-"   #'doom/decrease-font-size
          :desc "Reset font size"     "r"   #'doom/reset-font-size))
      (:prefix "o"
        :desc "Snippet Table"         "t"   #'yas-describe-tables
        :desc "Toggle Shell Popup"    "s"   #'+shell/toggle
        :desc "Mail"                  "m"   #'=mu4e
        :desc "Eww"                   "b"   #'eww
        :desc "PassWord"              "w"   #'pass)
      (:prefix "t"
        :desc "Frame maximized"       "M"   #'toggle-frame-maximized
        :desc "Modeline"              "m"   #'hide-mode-line-mode
        :desc "Treemacs"              "t"   #'+treemacs/toggle)
      (:prefix "w"
        "d"    #'ace-delete-window
        "D"    #'ace-delete-other-windows
        "O"    #'delete-other-windows
        "s"    #'split-switch-right
        "v"    #'split-switch-below
        "C-w"  #'ace-swap-window
        "w"    #'ace-window

        "f"    #'doom/window-maximize-buffer
        "h"    #'doom/window-maximize-horizontally
        "m"    #'doom/window-maximize-vertically

        "n"    #'windmove-left
        "g"    #'windmove-up
        "r"    #'windmove-down
        "t"    #'windmove-right)

      "`" nil

      :desc "Select Treemacs Window"             "-"    #'treemacs-select-window
      :desc "Switch to last buffer"              "("    #'evil-switch-to-windows-last-buffer
      :desc "Open agenda"                        "a"    #'org-agenda
      :desc "Toggle last popup"                  "~"    #'+popup/toggle)


;;
;;; Module keybinds


(map!
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
     "gx" #'what-cursor-position))

 (:after evil-snipe
   (:map evil-snipe-parent-transient-map
     "," nil
     "," #'evil-snipe-repeat
     "–" #'evil-snipe-repeat-reverse))

 (:map evil-emacs-state-map
   "SPC" doom-leader-map)
 (:map evil-normal-state-map
   (:prefix "g"
     "<" #'evil-numbers/dec-at-pt-incremental
     ">" #'evil-numbers/inc-at-pt-incremental)
   "g a" nil
   "g b" #'what-cursor-position)
 (:after treemacs-evil
   (:map evil-treemacs-state-map
     "j"       nil
     "l"       nil
     "p"       #'treemacs-peek
     "l"       #'treemacs-root-up
     "a"       #'treemacs-root-down
     "M-l"     #'treemacs-previous-neighbour
     "M-a"     #'treemacs-next-neighbour
     "<left>"  #'treemacs-left-action
     "<right>" #'treemacs-RET-action)
   (:map treemacs-mode-map
     "l" nil))

 (:map Info-mode-map
   "C-a"  #'Info-next-preorder
   "C-l"  #'Info-last-preorder

   :n "gs" #'+evil/easymotion
   :n "b" #'what-cursor-position)

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
   :i "Σ" (λ! (insert "\\Sigma"))
   :i "Δ" (λ! (insert "\\Delta"))
   :i "Π" (λ! (insert "\\Pi"))
   :i "Θ" (λ! (insert "\\Theta"))
   ;; Mathematical symbols
   :i "¬" (λ! (insert "\neg"))
   )

 (:map latex-mode-map
   :localleader
   "c" #'TeX-command-run-all)

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
   "M-<up>"        #'org-previous-visible-heading
   "M-<down>"      #'org-next-visible-heading
   "s-g"           #'org-priority-up    ;;Has to be rebound at some point
   "s-r"           #'org-priority-down  ;;Same here
   :localleader
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
   "p"             #'org-table-paste-rectangle
   "+"             #'org-table-sum
   "^"             #'org-table-sort-lines
   "RET"           #'org-table-hline-and-move
   "|"             #'org-table-insert-column)

 (:after pass :map pass-mode-map
   "a" #'pass-next-entry
   "l" #'pass-prev-entry
   "d" #'pass-kill
   "A" #'pass-next-directory
   "L" #'pass-prev-directory
   "j" #'pass-goto-entry)

 (:map pdf-view-mode-map
   :n "<left>"  #'image-backward-hscroll
   :n "<right>" #'image-forward-hscroll
   :n "C-a"     #'pdf-view-next-page-command
   :n "C-l"     #'pdf-view-previous-page-command))

(evil-define-key 'treemacs treemacs-mode-map "l" nil)
(evil-define-key 'insert LaTeX-mode-map (kbd "λ") (lambda () (interactive) (insert "\\lambda")))

(defun split-switch-right ()
  (interactive)
  (split-window-right)
  (windmove-right))

(defun split-switch-below ()
  (interactive)
  (split-window-below)
  (windmove-down))

(defun +org-toggle-checkbox ()
  (interactive)
  (org-toggle-checkbox '(4)))

(defun treemacs-left-action (&optional arg)
  (interactive "P")
  (-when-let (state (treemacs--prop-at-point :state))
    (--if-let (cdr (assq state treemacs-left-actions-config))
        (progn
          (funcall it arg)
          (treemacs--evade-image))
      (treemacs-pulse-on-failure "No <left> action defined for node of type %s."
        (propertize (format "%s" state) 'face 'font-lock-type-face)))))

(defvar treemacs-left-actions-config
  '((root-node-open   . treemacs-toggle-node)
    (root-node-closed . treemacs-root-up)
    (dir-node-open    . treemacs-toggle-node)
    (dir-node-closed  . treemacs-collapse-parent-node)
    (file-node-open   . treemacs-collapse-parent-node)
    (file-node-closed . treemacs-collapse-parent-node)
    (tag-node-open    . treemacs-collapse-parent-node)
    (tag-node-closed  . treemacs-collapse-parent-node)
    (tag-node         . treemacs-collapse-parent-node)))

(provide '+bindings)
