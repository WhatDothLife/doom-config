;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;;; Code:
(add-to-list 'load-path "/usr/share/emacs/site-lisp/mu4e/")
(add-to-list 'load-path "~/.doom.d/")
(add-to-list 'default-frame-alist '(fullscreen . maximized))

(add-hook 'shell-mode-hook #'doom-mark-buffer-as-real-h)

(evil-set-initial-state 'mu4e-main-mode 'emacs)
(evil-set-initial-state 'pdf-view-mode 'emacs)

(load "+bindings")
(load "+mu4e")
(load "+popup")


;; Apply theme to treemacs
;; (doom-themes-treemacs-config)


;; (add-hook 'c++-mode-hook (lambda () (setq flycheck-clang-language-standard "c++17")))
;; (add-hook 'c++-mode-hook (lambda () (setq flycheck-gcc-language-standard "c++17")))


;; (after! rtags
;;   (setq rtags-rc-binary-name (or rtags-rc-binary-name "rc")
;;         rtags-rdm-binary-name (or rtags-rdm-binary-name "rdm")))

;; Org
(setq org-agenda-include-diary t)

;; Recording work time with org-mode
(setq org-clock-persist 'history)
(org-clock-persistence-insinuate)


;; (defun config-misc ()
;;   "Other configurations."
;;   ;; Make more room
;;   (menu-bar-mode -1)
;;   (tool-bar-mode -1)
;;   (scroll-bar-mode -1)
;;   (fringe-mode 1))

;; pass
(map!
 (:after pass :map pass-mode-map
   "a" #'pass-next-entry
   "l" #'pass-prev-entry
   "d" #'pass-kill
   "A" #'pass-next-directory
   "L" #'pass-prev-directory
   "j" #'pass-goto-entry))


(provide 'config)

;;; config.el ends here
