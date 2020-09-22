;;; +org-pretty-table.el -*- lexical-binding: t; -*-

(defconst org-pretty-table-regexp (regexp-opt '("-" "+" "|")))

(defsubst org-pretty-table-is-empty-line ()
  (memq (following-char) '(? 10 ?#)))

(defun org-pretty-table-propertize-region (start end)
  "Replace org-table characters with box-drawing unicode glyphs
between START and END.
Used by jit-lock for dynamic highlighting."
  (save-excursion
    (goto-char start)
    (let (table-end)
      (while (re-search-forward org-pretty-table-regexp end t)
        ;; reached the end of the current table
        (if (and table-end
                 (> (point) table-end))
            (setq table-end nil))

        ;; check if the current match is a table if we are not in a
        ;; table right now
        (unless (and (not table-end)
                     (not (save-match-data
                            (org-at-table-p))))

          ;; get the end of the table if we found a new table, so we
          ;; don't have to check (org-at-table-p) again until then
          (unless table-end
            (save-match-data
              (setq table-end (org-table-end))))

          ;; determine the context of the character
          (let ((match (match-string 0)))
            (cond
             ((equal "-" match)
              (backward-char 1)
              (re-search-forward "-+")
              (put-text-property (match-beginning 0) (match-end 0) 'display (make-string (- (match-end 0) (match-beginning 0)) ?─))
              t)
             ((equal "|" match)
              (cond
               ((and (eq (following-char) ?-)
                     (save-excursion
                       (forward-line 1)
                       (not (org-pretty-table-is-empty-line)))
                     (save-excursion
                       (forward-line -1)
                       (not (org-pretty-table-is-empty-line))))
                (put-text-property (match-beginning 0) (match-end 0) 'display "├")
                t)
               ((and (save-excursion
                       (backward-char 1)
                       (eq (preceding-char) ?-))
                     (save-excursion
                       (forward-line 1)
                       (not (org-pretty-table-is-empty-line)))
                     (save-excursion
                       (forward-line -1)
                       (not (org-pretty-table-is-empty-line))))
                (put-text-property (match-beginning 0) (match-end 0) 'display "┤")
                t)
               ((and (save-excursion
                       (backward-char 1)
                       (eq (preceding-char) ?-))
                     (save-excursion
                       (forward-line -1)
                       (org-pretty-table-is-empty-line)))
                (put-text-property (match-beginning 0) (match-end 0) 'display "┐")
                t)
               ((and (save-excursion
                       (backward-char 1)
                       (eq (preceding-char) ?-))
                     (save-excursion
                       (forward-line 1)
                       (org-pretty-table-is-empty-line)))
                (put-text-property (match-beginning 0) (match-end 0) 'display "┘")
                t)
               ((and (eq (following-char) ?-)
                     (save-excursion
                       (forward-line -1)
                       (org-pretty-table-is-empty-line)))
                (put-text-property (match-beginning 0) (match-end 0) 'display "┌")
                t)
               ((and (eq (following-char) ?-)
                     (save-excursion
                       (forward-line 1)
                       (org-pretty-table-is-empty-line)))
                (put-text-property (match-beginning 0) (match-end 0) 'display "└")
                t)
               (t
                (put-text-property (match-beginning 0) (match-end 0) 'display "│")
                t)))
             ((equal "+" match)
              (cond
               ((and (eq (following-char) ?-)
                     (save-excursion
                       (backward-char 1)
                       (eq (preceding-char) ?-))
                     (save-excursion
                       (let ((char-pos (- (point) (line-beginning-position) 1)))
                         (forward-line -1)
                         (beginning-of-line)
                         (forward-char char-pos))
                       (eq (following-char) ?|))
                     (save-excursion
                       (backward-char 1)
                       (next-line)
                       (eq (following-char) ?|)))
                (put-text-property (match-beginning 0) (match-end 0) 'display "┼")
                t)
               ((and (eq (following-char) ?-)
                     (save-excursion
                       (backward-char 1)
                       (eq (preceding-char) ?-))
                     (save-excursion
                       (backward-char 1)
                       (previous-line)
                       (memq (following-char) '(? 10)))
                     (save-excursion
                       (let ((char-pos (- (point) (line-beginning-position) 1)))
                         (forward-line 1)
                         (beginning-of-line)
                         (forward-char char-pos))
                       (eq (following-char) ?|)))
                (put-text-property (match-beginning 0) (match-end 0) 'display "┬")
                t)
               ((and (eq (following-char) ?-)
                     (save-excursion
                       (backward-char 1)
                       (eq (preceding-char) ?-))
                     (save-excursion
                       (let ((char-pos (- (point) (line-beginning-position) 1)))
                         (forward-line -1)
                         (beginning-of-line)
                         (forward-char char-pos))
                       (eq (following-char) ?|))
                     (save-excursion
                       (backward-char 1)
                       (next-line)
                       (or (memq (following-char) '(? 10))
                           (eq (char-after (line-beginning-position)) ?#))))
                (put-text-property (match-beginning 0) (match-end 0) 'display "┴")
                t))))))))))

(defun org-pretty-table-unpropertize-region (start end)
  "Remove box-drawing compositions between START and END."
  (remove-text-properties start end '(display)))

;;; Minor mode:

;;;###autoload
(define-minor-mode org-pretty-table-mode
  "Replace org-table characters with box-drawing unicode glyphs."
  :lighter " OPT"
  (if org-pretty-table-mode
      (jit-lock-register 'org-pretty-table-propertize-region t)
    (jit-lock-unregister 'org-pretty-table-propertize-region)
    (org-pretty-table-unpropertize-region (point-min) (point-max))))

;;;###autoload
(defun turn-on-org-pretty-table-mode ()
  (org-pretty-table-mode 1))

;;;###autoload
(defun turn-off-org-pretty-table-mode ()
  (org-pretty-table-mode 0))

;;;###autoload
(define-globalized-minor-mode global-org-pretty-table-mode
  org-pretty-table-mode turn-on-org-pretty-table-mode)

(provide 'org-pretty-table)
;;; org-pretty-table.el ends here
