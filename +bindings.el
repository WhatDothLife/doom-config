;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

(require 'mu4e)

(setq avy-keys '(?u ?i ?a ?e ?n ?r ?t ?d))

(setq doom-font-increment 1)

(setq evil-org-movement-bindings
      '((up . "l")
        (down . "a")
        (left . "i")
        (right . "e")))

(global-set-key "•" 'repeat)


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

(map! :leader
      (:prefix "b"
        :desc "Bury buffer"                 "b" #'bury-buffer
        :desc "Unbury buffer"               "z" #'unbury-buffer
        :desc "Switch to buffer in window"  "o" #'+ivy/switch-workspace-buffer-other-window
        :desc "Kill buffer and window"      "w" #'kill-buffer-and-window
        :desc "Kill some buffers"           "k" #'kill-some-buffers
        (:prefix "f"
          :desc "Increase font size" "="    #'doom/increase-font-size
          :desc "Decrease font size" "-"    #'doom/decrease-font-size
          :desc "Reset font size"    "r"    #'doom/reset-font-size))
      (:prefix "o"
        :desc "Toggle shell popup"    "s" #'+shell/toggle
        :desc "Open shell here"       "S" #'+shell/here
        :desc "Mail"                  "m" #'=mu4e
        :desc "Eww"                   "e" #'eww
        :desc "PassWord"              "w" #'pass)

      (:prefix "w"
        "O"    #'delete-other-windows)

      :desc "Open agenda" "a"                        #'org-agenda
      :desc "Toggle last popup" "~"                  #'+popup/toggle
      :desc "Switch to buffer in other window" "*"   #'+ivy/switch-buffer-other-window)

(map!
 :i "C-p"    #'+default/newline
 "s-l" #'windmove-up
 "s-a" #'windmove-down
 "s-i" #'windmove-left
 "s-e" #'windmove-right

 "s-L" #'enlarge-window
 "s-A" #'shrink-window
 "s-I" #'shrink-window-horizontally
 "s-E" #'enlarge-window-horizontally

 "s-/" #'buf-move-left
 "s-{" #'buf-move-down
 "s-}" #'buf-move-right
 "s-[" #'buf-move-up

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

 (:after org
   :map evil-org-agenda-mode-map
   "gs" nil
   "gx" #'what-cursor-position)

 (:map evil-emacs-state-map
   "SPC" doom-leader-map)
 (:map evil-normal-state-map
   "g a" nil
   "g b" #'what-cursor-position)
 (:map evil-treemacs-state-map
   "<left>"  'treemacs-left-action
   "<right>" 'treemacs-RET-action)

 (:map Info-mode-map
   "C-a"  #'Info-next-preorder
   "C-l"  #'Info-last-preorder
   :n "b" #'what-cursor-position
   :n "a" #'Info-next
   :n "l" #'Info-prev)

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
   "s-<return>"    #'org-insert-todo-heading
   "s-g"           #'org-priority-up
   "s-r"           #'org-priority-down
   :localleader
   "^"             #'org-sort
   "x"             #'+org-toggle-checkbox
   "v"             #'org-mark-element
   "V"             #'org-mark-subtree
   "Y"             #'org-paste-subtree
   "y"             #'org-yank
   "z"             #'org-insert-drawer
   :prefix "b"
   "d"             #'org-table-copy-region
   "y"             #'org-table-cut-region
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
