;;; ~/.doom.d/+functions.el -*- lexical-binding: t; -*-
;;
;; A file that contains several function- and variable definitions
;; to make live easier.
(defun +org-time-stamp (ARG)
  (interactive "P")
  (+evil/insert-newline-below 1)
  (forward-line)
  (org-time-stamp ARG))

(defun +dired-kill-all-subdir ()
  (interactive)
  (goto-char (point-max))
  (while (not (dired-top-level-p)) (dired-kill-subdir))
  (revert-buffer)
  (goto-char (point-min)))

(defun dired-top-level-p ()
    (equal (dired-current-directory) (expand-file-name default-directory)))
