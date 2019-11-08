;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

(require 'mu4e)

(setq evil-org-movement-bindings
      '((up . "l")
        (down . "a")
        (left . "i")
        (right . "e")))

(map! :leader
      (:prefix "b"
        :desc "Bury buffer"                 "b" #'bury-buffer
        :desc "Unbury buffer"               "z" #'unbury-buffer
        :desc "Switch to buffer in window"  "o" #'+ivy/switch-workspace-buffer-other-window
        :desc "Kill buffer and window"      "w" #'kill-buffer-and-window
        :desc "Kill some buffers"           "k" #'kill-some-buffers)
      (:prefix "a"
        :desc "Mail"     "m"   #'=mu4e
        :desc "Eww"      "e"   #'eww
        :desc "Gdb"      "d"   #'gdb
        :desc "Pass"     "p"   #'pass)

      ;; :desc "Search for symbol in project" "?"       #'+default/search-project-for-symbol-at-point
      :desc "Toggle last popup" "*"                  #'+popup/toggle
      :desc "Switch to buffer in other window" "*"   #'+ivy/switch-buffer-other-window
      ;; :desc "Raise popup" "+"                        #'+popup/raise
      ;; :desc "Open buffer in popup" "-"               #'+popup/buffer
      "~" nil)

(map! (:map override
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

        ;; "s-t" #'+workspace/switch-right
        ;; "s-r" #'+workspace/switch-left

        "M-t" #'split-switch-right
        "M-r" #'split-switch-below)
      ;; (:map global-map
      ;;   "M-a" nil)
      (:map dired-mode-map
        :n "-"     (lambda () (interactive) (find-alternate-file "..")))
      (:after evil-easymotion
        (:map evilem-map
          "c" #'evilem-motion-find-char
          "f" #'evilem--motion-function-evil-forward-arg
          "F" #'evilem--motion-function-evil-backward-arg
          "a" #'evilem-motion-next-line
          "l" #'evilem-motion-previous-line))
      (:map Info-mode-map
        "C-a"  #'Info-next-preorder
        "C-l"  #'Info-last-preorder
        :prefix "g"
        :n "b" #'what-cursor-position
        :n "a" #'Info-next
        :n "l" #'Info-prev)
      (:map evil-normal-state-map
        "g a" nil
        "g b" #'what-cursor-position)
      (:map org-mode-map
        ;; "M-i"        #'org-metaleft
        ;; "M-a"        #'org-metadown
        ;; "M-e"        #'org-metaright
        ;; "M-l"        #'org-metaup
        ;; "M-I"        #'org-shiftmetaleft
        ;; "M-A"        #'org-shiftmetadown
        ;; "M-E"        #'org-shiftmetaright
        ;; "M-L"        #'org-shiftmetaup
        "s-<return>"     #'org-insert-todo-heading
        "S-s-<return>"   #'org-insert-todo-subheading)
      (:map pdf-view-mode-map
        :n "<left>"  #'image-backward-hscroll
        :n "<right>" #'image-forward-hscroll
        :n "C-a"     #'pdf-view-next-page-command
        :n "C-l"     #'pdf-view-previous-page-command)
      (:map mu4e-view-mode-map
        :n "C-a" #'mu4e-view-headers-next
        :n "C-l" #'mu4e-view-headers-prev
        :n "t"   #'mu4e-headers-mark-subthread
        :n "C-t" #'mu4e-headers-mark-thread
        :n "C-i" #'mu4e-headers-query-prev
        :n "C-e" #'mu4e-headers-query-next)
      (:map mu4e-headers-mode-map
        :n "C-a" #'mu4e-view-headers-next
        :n "C-l" #'mu4e-view-headers-prev
        :n "t"   #'mu4e-headers-mark-subthread
        :n "C-t" #'mu4e-headers-mark-thread
        :n "C-i" #'mu4e-headers-query-prev
        :n "C-e" #'mu4e-headers-query-next)
      (:map mu4e-main-mode-map
        "p" (λ! (mu4e-headers-search "maildir:/posteo/INBOX"))
        "z" (λ! (mu4e-headers-search "maildir:/zih/INBOX")))
      (:map evil-emacs-state-map
        "M-SPC" doom-leader-map)
      (:map evil-treemacs-state-map
        "<left>"  'treemacs-left-action
        "<right>" 'treemacs-RET-action))

(global-set-key "•" 'repeat)


(defun split-switch-right ()
  (interactive)
  (split-window-right)
  (windmove-right))

(defun split-switch-below ()
  (interactive)
  (split-window-below)
  (windmove-down))

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
    (dir-node-open    . treemacs-toggle-node)
    (dir-node-closed  . treemacs-collapse-parent-node)
    (file-node-open   . treemacs-collapse-parent-node)
    (file-node-closed . treemacs-collapse-parent-node)
    (tag-node-open    . treemacs-collapse-parent-node)
    (tag-node-closed  . treemacs-collapse-parent-node)
    (tag-node         . treemacs-collapse-parent-node)))
