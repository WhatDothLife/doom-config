;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(require 'org-drill)

(load! "+bindings")
(load! "+irc")
(load! "+mu4e")
(load! "+org")
(load! "+popup")

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

(after! evil-org
  (setq evil-org-movement-bindings
        '((up . "l")
          (down . "a")
          (left . "i")
          (right . "e"))))

(after! avy
  (setq avy-keys '(?u ?i ?a ?e ?n ?r ?t ?d)))

(after! ace-window
  (setq aw-keys '(?u ?i ?a ?e ?n ?r ?t ?d)))

(after! pdf
  (set-evil-initial-state! 'pdf-view-mode 'emacs))
(set-evil-initial-state! 'rcirc-mode 'normal)


;; (add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++17")))
;; (add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++17")))

;; (after! rtags
;;   (setq rtags-rc-binary-name (or rtags-rc-binary-name "rc")
;;         rtags-rdm-binary-name (or rtags-rdm-binary-name "rdm")))

(provide 'config)

;;; Test
;;; config.el ends here
