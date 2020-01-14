;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(require 'org-drill)

(load! "+irc")
(load! "+mu4e")
(load! "+org")
(load! "+popup")
(load! "+bindings")

(load-theme 'doom-one)

(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e/")
(add-to-list 'default-frame-alist '(fullscreen . fullboth))
(add-to-list '+lookup-provider-url-alist
             '("Wiktionary DE" . "https://de.wiktionary.org/w/index.php?search=%s"))

(add-hook 'ibuffer-mode-hook 'ibuffer-auto-mode)

(setq +doom-dashboard-banner-file (concat doom-private-dir "logo.png"))
(setq doom-font (font-spec :family "Source Code Pro" :size 15))
(setq window-combination-resize t)
(setq doom-font-increment 1)
(setq ssh-deploy-async 0)

;; Latex
(setq +latex-viewers '(pdf-tools))
(setq reftex-default-bibliography "~/code/Latex/bib.bib")
(setq bibtex-completion-bibliography
      '("~/code/Latex/bib.bib"
        ;; "/path/to/bibtex-file-2.bib"))
        ))

(after! pdf
  (set-evil-initial-state! 'pdf-view-mode 'emacs))
(set-evil-initial-state! 'rcirc-mode 'normal)

;; I use treemacs-select-window for this
(after! treemacs
  (after! ace-window
    (add-to-list 'aw-ignored-buffers 'treemacs-mode)))

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


(setq auto-save-interval 100)
(auto-save-mode)

(provide 'config)

;;; config.el ends here
