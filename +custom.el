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

(defun +shell/window-enlargen ()
  "Enlargen the current window to focus on this one. Does not close other
windows (unlike `doom/window-maximize-buffer'). Activate again to undo."
  (interactive)
  (setq doom--enlargen-last-wconf
        (if doom--enlargen-last-wconf
            (ignore (set-window-configuration doom--enlargen-last-wconf))
          (prog1 (current-window-configuration)
            (let* ((window (selected-window))
                   (dedicated-p (window-dedicated-p window))
                   (preserved-p (window-parameter window 'window-preserved-size))
                   (ignore-window-parameters t))
              (unwind-protect
                  (progn
                    (when dedicated-p
                      (set-window-dedicated-p window nil))
                    (when preserved-p
                      (set-window-parameter window 'window-preserved-size nil))
                    (maximize-window window))
                (set-window-dedicated-p window dedicated-p)
                (when preserved-p
                  (set-window-parameter window 'window-preserved-size preserved-p)))))))
  (evil-scroll-line-to-bottom nil))

(defun yas/insert-by-name (name)
  (flet ((dummy-prompt
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

(defun load-doom-one ()
  (load-theme 'doom-one)
  (after! org-agenda
    (custom-set-faces!
      `(org-agenda-date-today :foreground ,(doom-color 'blue))
      `(org-agenda-date :foreground ,(doom-color 'magenta))))
  (after! tex
    (custom-set-faces!
      `(org-agenda-date :foreground ,(doom-color 'blue))
      `(TeX-fold-unfolded-face :background "#282c34")))
  (setq +doom-dashboard-banner-file (concat doom-private-dir "splash.png")))


(defun +mu4e/spook ()
  (interactive)
  (save-mark-and-excursion
    (progn
      (goto-char (point-max))
           (spook))))

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
