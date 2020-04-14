;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;;(require 'org-drill)
(require 'org-msg)

(load! "calfw-cal")
(load! "+irc")
(load! "+mu4e")
(load! "+org")
(load! "+popup")
(load! "+custom")
(load! "+bindings")

(load-theme 'doom-one)

(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e/")
(add-to-list 'default-frame-alist '(fullscreen . fullboth))
(add-to-list '+lookup-provider-url-alist
             '("Wiktionary DE" . "https://de.wiktionary.org/w/index.php?search=%s")) ;FIXME

(add-hook 'ibuffer-mode-hook 'ibuffer-auto-mode)
(add-hook 'pdf-view-mode-hook 'hide-mode-line-mode)

(setq doom-font (font-spec :family "Source Code Pro" :size 15))
;; (setq doom-font (font-spec :family "Fira Mono" :size 15))

(setq +doom-dashboard-banner-file (concat doom-private-dir "logo.png"))
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

(setq auto-save-interval 100)
(auto-save-mode)

      (provide 'config)

;;; config.el ends here
