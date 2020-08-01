;;; ~/.doom.d/+latex.el -*- lexical-binding: t; -*-

(setq TeX-save-query nil
      ;; TeX-show-compilation nil
      +latex-viewers '(pdf-tools)
      reftex-default-bibliography "~/code/Latex/bib.bib"
      bibtex-completion-bibliography '("~/code/Latex/bib.bib"))

(add-hook! 'LaTeX-mode-hook
  (add-hook! 'after-save-hook :local
    (call-interactively 'TeX-command-run-all)))

(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
;; (add-hook 'LaTeX-mode-hook #'mixed-pitch-mode)
