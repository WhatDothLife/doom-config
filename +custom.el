;;; ~/.doom.d/+functions.el -*- lexical-binding: t; -*-
;;
;; A file that contains several function- and variable definitions
;; to make live easier.

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


;; Treemacs
(defun treemacs-left-action (&optional arg)
  (interactive "P")
  (-when-let (state (treemacs--prop-at-point :state))
    (--if-let (cdr (assq state treemacs-left-actions-config))
        (progn
          (funcall it arg)
          (treemacs--evade-image))
      (treemacs-pulse-on-failure "No <left> action defined for node of type %s."
                                 (propertize (format "%s" state) 'face 'font-lock-type-face)))))

(defun treemacs-right-action (&optional arg)
  (interactive "P")
  (-when-let (state (treemacs--prop-at-point :state))
    (--if-let (cdr (assq state treemacs-right-actions-config))
        (progn
          (funcall it arg)
          (treemacs--evade-image))
      (treemacs-pulse-on-failure "No <right> action defined for node of type %s."
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

(defvar treemacs-right-actions-config
  '((root-node-closed . treemacs-toggle-node)
    (dir-node-closed  . treemacs-toggle-node)
    (file-node-open   . treemacs-visit-node-default)
    (file-node-closed . treemacs-visit-node-default)
    (tag-node-closed  . treemacs-collapse-parent-node)
    (tag-node         . treemacs-visit-node-default)))

(defun treemacs-i-action (&optional arg)
  (interactive "P")
  (treemacs-left-action '(4)))

(defun treemacs-e-action (&optional arg)
  (interactive "P")
  (treemacs-right-action '(4)))

(defun copy-current-line-position-to-clipboard ()
  "Copy current line in file to clipboard as '</path/to/file>:<line-number>'."
  (interactive)
  (let ((path-with-line-number
         (concat buffer-file-truename ":"
                 (if (use-region-p) "test" (number-to-string (line-number-at-pos)))))) ;TODO implement true case
    (kill-new path-with-line-number)
    (message (concat path-with-line-number " copied to clipboard"))))

(defun +org-ctrl-c-ret ()
  (interactive)
  (org-ctrl-c-ret)
  (evil-insert-state))

(defun +shell/goto-end-of-prompt ()
  "Move cursor to the prompt when switching to insert mode (if point isn't
already there)."
  (interactive)
  (goto-char (point-max))
  (evil-append 1))

(defun +shell/prompt-for-cwd (dir)
  "Prompt for directory and cd to it."
  (interactive "Dcd ")
  (insert (concat "cd " dir))
  (comint-send-input))

(defun +shell/up-directory ()
  (interactive)
  (insert "cd ..")
  (comint-send-input))

(defun +shell/last-directory ()
  (interactive)
  (insert "cd -")
  (comint-send-input))

(defun mu4e-mark-set (mark &optional target)
  "Mark the header at point, or, if region is active, mark all
headers in the region. Optionally, provide TARGET (for moves)."
  (unless target
    (setq target (mu4e~mark-ask-target mark)))
  (if (not (use-region-p))
      ;; single message
      (mu4e-mark-at-point mark target)
    ;; mark all messages in the region.
    (save-excursion
      (let ((cant-go-further) (eor (region-end)))
        (goto-char (region-beginning))
        (while (and (< (point) eor) (not cant-go-further))
          (mu4e-mark-at-point mark target)
          (setq cant-go-further (not (mu4e-headers-next))))))))

(defun yas/insert-by-name (name)
  (cl-flet ((dummy-prompt
             (prompt choices &optional display-fn)
             (declare (ignore prompt))
             (or (find name choices :key display-fn :test #'string=)
                 (throw 'notfound nil))))
    (let ((yas/prompt-functions '(dummy-prompt)))
      (catch 'notfound
        (yas/insert-snippet t)))))

(defun evil-comment-dwim (&rest test)
  "Same behavior as comment-dwim but switches to insert state
   when adding a comment."
  (interactive)
  (call-interactively 'comment-dwim)
  (unless (region-active-p)
    (evil-insert-state)))

(defun +org-time-stamp (ARG)
  (interactive "P")
  (+evil/insert-newline-below 1)
  (forward-line)
  (org-time-stamp ARG))

(defun +LaTeX/new-item ()
  (interactive)
  (evil-open-below 1)
  (insert "\\item "))

(defun display-prefix (arg)
  "Display the value of the raw prefix arg."
  (interactive "P")
  (message "%s" arg))

(defun org-remove-latex-buffer ()
  (interactive)
  (org-toggle-latex-fragment '(64)))

(defun org-preview-latex-buffer ()
  (interactive)
  (org-toggle-latex-fragment '(16)))

(defun org-remove-latex-fragment ()
  (interactive)
  (org-toggle-latex-fragment '(4)))

(defun +dired-subtree-remove ()
  (interactive)
  (dired-subtree-remove)
  (revert-buffer))

(defun +dired-kill-subdir ()
  (interactive)
  (dired-kill-subdir)
  (revert-buffer))

(defun +dired-kill-all-subdir ()
  (interactive)
  (while t (+dired-kill-subdir)))


(defun +dired-subtree-toggle ()
  "Insert subtree at point or remove it if it was not present."
  (interactive)
  (if (dired-subtree--is-expanded-p)
      (progn
        (dired-next-line 1)
        (dired-subtree-remove)
        (revert-buffer))
    (save-excursion (dired-subtree-insert))))

(defun +pdf-top-next-page ()
  (interactive)
  (pdf-view-next-page-command)
  (image-bob))

(defun +pdf-bottom-last-page ()
  (interactive)
  (pdf-view-previous-page-command)
  (image-eob))

(defun +eshell-complete-recent-dir (&optional arg)
  "Switch to a recent `eshell' directory using completion.
With \\[universal-argument] also open the directory in a `dired'
buffer."
  (interactive "P")
  (evil-insert-state)
  (let ((dir (ring-elements eshell-last-dir-ring)))
    (ivy-read "Switch to recent dir: " dir :action 'insert)
    (eshell-send-input)               ; Should cd directly…
    (when arg
      (dired dir))))

(defun +eshell-open-cwd-dired ()
  (interactive)
  (dired default-directory))

(defun +eshell/prompt-for-cwd (dir)
  "Prompt for directory and cd to it."
  (interactive "Dcd ")
  (+evil/insert (format "\"%s\"" dir))
  (eshell-send-input))

(defun +eshell/up-directory ()
  (interactive)
  (+evil/insert "cd ..")
  (eshell-send-input))

(defun +eshell/last-directory ()
  (interactive)
  (+evil/insert "cd -")
  (eshell-send-input))

(defun +evil/insert (arg)
  (if evil-insert-state-minor-mode
      (insert arg)
    (evil-insert-state)
    (insert arg)
    (evil-normal-state)))
