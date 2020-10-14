;;; private/treemacs/config.el -*- lexical-binding: t; -*-

(setq treemacs-width 30)

;; I use treemacs-select-window for this
(after! treemacs
  (after! ace-window
    (add-to-list 'aw-ignored-buffers 'treemacs-mode)))

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
