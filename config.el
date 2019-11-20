;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;;; Code:
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e/")
(add-to-list 'default-frame-alist '(fullscreen . fullboth))

(add-hook 'ibuffer-mode-hook 'ibuffer-auto-mode)

(setq +doom-dashboard-banner-file (concat doom-private-dir "logo.png"))

(set-evil-initial-state! 'pdf-view-mode 'emacs)
(set-evil-initial-state! 'rcirc-mode 'normal)
;; (evil-set-initial-state 'mu4e-main-mode 'emacs)
;; (evil-set-initial-state 'pdf-view-mode 'emacs)

(load! "+bindings")
(load! "+mu4e")
(load! "+popup")

;; (doom-themes-treemacs-config)

(setq doom-font (font-spec :family "Source Code Pro" :size 15))

;; (add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++17")))
;; (add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++17")))


;; (after! rtags
;;   (setq rtags-rc-binary-name (or rtags-rc-binary-name "rc")
;;         rtags-rdm-binary-name (or rtags-rdm-binary-name "rdm")))

;; Org
;; (setq org-startup-shrink-all-tables t)
(setq org-agenda-include-diary t)
;; Recording work time with org-mode
(setq org-clock-persist 'history)

;; (defun config-misc ()
;;   "Other configurations."
;;   ;; Make more room
;;   (menu-bar-mode -1)
;;   (tool-bar-mode -1)
;;   (scroll-bar-mode -1)
;;   (fringe-mode 1))


(provide 'config)

;;; config.el ends here
