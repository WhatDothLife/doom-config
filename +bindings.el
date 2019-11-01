;;; ~/.doom.d/+bindings.el -*- lexical-binding: t; -*-

(require 'mu4e)

(map! :leader
      (:prefix-map ("t" . "toggle")
        :desc "Treemacs"                    "t" #'+treemacs/toggle)
      (:prefix-map ("b" . "buffer")
        :desc "Bury buffer"                 "b" #'bury-buffer
        :desc "Unbury buffer"               "z" #'unbury-buffer
        :desc "Switch to buffer in window"  "o" #'+ivy/switch-workspace-buffer-other-window
        :desc "Kill some buffers"           "k" #'kill-some-buffers)
      (:prefix-map ("a" . "application")
        :desc "Mail"     "m"   #'=mu4e
        :desc "Eww"      "e"   #'eww
        :desc "Gdb"      "d"   #'gdb
        :desc "Shell"    "s"   #'shell
        :desc "Pass"     "p"   #'pass)

      :desc "Search for symbol in project" "?"       #'+default/search-project-for-symbol-at-point
      :desc "Toggle last popup" "*"                  #'+popup/toggle
      :desc "Raise popup" "+"                        #'+popup/raise
      :desc "Open buffer in popup" "-"               #'+popup/buffer)

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

        "s-t" #'+workspace/switch-right
        "s-r" #'+workspace/switch-left

        "M-t" #'split-switch-right
        "M-r" #'split-switch-below)
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
        "p" (lambda () (mu4e-headers-search "maildir:/posteo/INBOX"))
        "z" (lambda () (mu4e-headers-search "maildir:/zih/INBOX")))
      (:map evil-emacs-state-map
        "SPC" doom-leader-map)
      (:map evil-treemacs-state-map
        "<left>"  'treemacs-collapse-parent-node
        "<right>" 'treemacs-RET-action))

(defun split-switch-right ()
  (interactive)
  (split-window-right)
  (windmove-right))

(defun split-switch-below ()
  (interactive)
  (split-window-below)
  (windmove-down))
