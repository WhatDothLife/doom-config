;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

(require 'mu4e)

(after! evil-org
  (setq evil-org-movement-bindings
        '((up .    "g")
          (down .  "r")
          (left .  "n")
          (right . "t"))))

(after! avy
  (setq avy-keys '(?u ?i ?a ?e ?n ?r ?t ?d)))

(after! ace-window
  (setq aw-keys '(?n ?r ?t ?d)))

(map! :leader
      (:prefix "b"
        :desc "Bury buffer"                 "b" #'bury-buffer
        :desc "Unbury buffer"               "z" #'unbury-buffer
        :desc "Switch to buffer in window"  "o" #'+ivy/switch-workspace-buffer-other-window
        :desc "Kill buffer and window"      "w" #'kill-buffer-and-window
        :desc "Kill some buffers"           "k" #'kill-some-buffers
        :desc "Select Treemacs buffer"      "t" #'treemacs-select-window
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
        :desc "Toggle maximization"   "m"   #'toggle-frame-maximized
        :desc "Toggle Treemacs"       "t"   #'+treemacs/toggle)
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

      :desc "Open agenda" "a"                        #'org-agenda
      :desc "Toggle last popup" "~"                  #'+popup/toggle
      :desc "Switch to buffer in other window" "*"   #'+ivy/switch-buffer-other-window)

(map!
 :nimv "C-u"  #'evil-scroll-line-up
 :nimv "C-ü"  #'evil-scroll-line-down
 ;; :i    "C-p"  #'+default/newline  ;;Apparently M-RET handles this

 :n "."    #'repeat
 :n "•"    #'evil-repeat

 "M-]"     #'sp-unwrap-sexp
 "M-["     #'sp-backward-unwrap-sexp

 "M-t" #'split-switch-right
 "M-r" #'split-switch-below

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
     "," #'evil-snipe-repeat            ;I never understood why this is bound to ';'
     "–" #'evil-snipe-repeat-reverse))

 (:map evil-emacs-state-map
   "SPC" doom-leader-map)
 (:map evil-normal-state-map
   (:prefix "g"
     "<" #'evil-numbers/dec-at-pt-incremental
     ">" #'evil-numbers/inc-at-pt-incremental)
   "g a" nil
   "g b" #'what-cursor-position)
 (:map evil-treemacs-state-map
   "<left>"  'treemacs-left-action
   "<right>" 'treemacs-RET-action)

 (:map Info-mode-map
   "C-a"  #'Info-next-preorder       ;TODO Rebind
   "C-l"  #'Info-last-preorder       ;TODO Rebind

   :n "gs" #'+evil/easymotion
   :n "b" #'what-cursor-position)

 (:map LaTeX-mode-map
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

;; (global-set-key (kbd "C-x") nil)
;; (global-set-key (kbd "C-x")  #'evil-scroll-line-up)

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

;;Test
