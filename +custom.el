;;; ~/.doom.d/+functions.el -*- lexical-binding: t; -*-
;;
;; A file that contains several function- and variable definitions
;; to make live easier.

(defun +counsel-insert-dir-path (&optional initial-input)
  "Inserts the path of a selected directory."
  (interactive)
  (let ((counsel--find-file-predicate #'file-directory-p))
    (counsel--find-file-1
     "Insert (directory): " initial-input
     (lambda (d) (progn (insert (concat "cd "(expand-file-name d)))
                        (comint-send-input)))
     '+counsel-cd)))

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

(defun prompt-for-cwd (dir)
  "Prompt for directory and cd to it."
  (interactive "Dcd ")
  (insert (concat "cd " dir))
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
