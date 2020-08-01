;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

(require 'org-msg)
(require 'warnings)
(require 'lilypond-mode)

(setq doom-variable-pitch-font (font-spec :family "Overpass" :size 16))
(setq mixed-pitch-set-height t)

(load! "+custom")
(load! "calfw-cal")
(load! "+irc")
(load! "+mu4e")
(load! "+org")
(load! "+latex")
(load! "+popup")
(load! "+bindings")

(setq +doom-dashboard-banner-file (concat doom-private-dir "splash_gruv.png"))

(setq user-full-name "Michael Wernthaler"
      user-mail-address "michael.wernthaler@posteo.de"

      doom-font-increment 1
      doom-font (font-spec :family "Source Code Pro")
      window-combination-resize t
      fill-column 80
      message-fill-column 80
      fill-flowed-encode-column 80
      auto-save-interval 100
      doom-modeline-buffer-encoding nil
      yas-triggers-in-field t
      avy-single-candidate-jump t
      treemacs-width 30
      +evil-want-o/O-to-continue-comments nil
      projectile-project-search-path '("~/projects")
      truncate-lines nil
      company-show-numbers t

      ;; Dired
      dired-recursive-deletes 'always
      dired-recursive-copies 'always)

;; (setq ivy-read-action-function #'ivy-hydra-read-action)

(add-to-list 'default-frame-alist '(fullscreen . fullboth))
(add-to-list '+lookup-provider-url-alist
             '("Wiktionary DE" "https://de.wiktionary.org/w/index.php?search=%s"))
(add-to-list 'warning-suppress-types '(yasnippet backquote-change))
;; Prevents some cases of Emacs flickering
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

(add-hook 'ibuffer-mode-hook 'ibuffer-auto-mode)
(add-hook 'mu4e-compose-mode-hook 'auto-fill-mode)
(add-hook 'pdf-view-mode-hook 'hide-mode-line-mode)
(add-hook 'dired-mode-hook (λ! (dired-hide-details-mode)))
(add-hook 'Info-mode-hook #'mixed-pitch-mode)
(add-hook 'LaTeX-mode-hook #'latex-extra-mode)

(display-battery-mode 1)
(auto-save-mode)

(global-prettify-symbols-mode -1)

(setq evil-split-window-below t
      evil-vsplit-window-right t)

(after! pdf
  (set-evil-initial-state! 'pdf-view-mode 'emacs))

(set-evil-initial-state! 'rcirc-mode 'normal)

;; I use treemacs-select-window for this
(after! treemacs
  (after! ace-window
    (add-to-list 'aw-ignored-buffers 'treemacs-mode)))

(custom-set-faces!
  '(preview-reference-face :background "white"))


(use-package flycheck-rust
  :ensure t
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

;; (load-theme 'doom-gruvbox t)

;; Adjust the colors of doom-gruvbox
(custom-set-faces!
  `(font-lock-type-face :foreground ,(doom-color 'violet))
  `(doom-modeline-buffer-modified :foreground ,(doom-color 'red))
  `(diredfl-dir-heading :foreground ,(doom-color 'olive))
  `(diredfl-dir-name :foreground ,(doom-color 'dark-cyan))
  `(diredfl-dir-priv :foreground ,(doom-color 'dark-cyan))
  '(solaire-mode-line-face :background "#202020")
  '(mode-line :background "#202020")
  '(solaire-mode-line-inactive-face :background "#242424")
  ;; '(solaire-default-face :background "#282c34" )
  ;; '(default-face :background "#21242b" )
  `(font-lock-builtin-face :foreground ,(doom-color 'violet))
  `(mu4e-replied-face :foreground ,(doom-color 'green))
  `(mu4e-header-key-face :foreground ,(doom-color 'red) :weight bold)
  `(outline-1 :foreground ,(doom-color 'violet) :height 1.25)
  `(outline-2 :foreground ,(doom-color 'cyan) :height 1.15)
  `(outline-3 :foreground ,(doom-lighten (doom-color 'violet) 0.20) :height 1.12)
  `(outline-4 :foreground ,(doom-lighten (doom-color 'dark-cyan) 0.25) :height 1.09)
  `(outline-5 :foreground ,(doom-lighten (doom-color 'violet) 0.40) :height 1.06)
  `(outline-6 :foreground ,(doom-lighten (doom-color 'dark-cyan) 0.50) :height 1.03)
  `(outline-7 :foreground ,(doom-lighten (doom-color 'violet) 0.60))
  `(org-code :foreground ,(doom-color 'orange))
  `(org-date :foreground ,(doom-color 'yellow))
  `(org-document-info :foreground ,(doom-color 'red))
  `(org-document-title :foreground ,(doom-color 'red))
  `(org-drawer :foreground ,(doom-lighten (doom-color 'cyan) 0.40))
  `(org-formula :foreground ,(doom-color 'green))
  `(org-list-dt :foreground ,(doom-color 'cyan))
  `(org-table :foreground ,(doom-color 'blue))
  `(org-tag :foreground "#7c6f64")
  `(org-todo :foreground ,(doom-color 'green))
  `(org-verbatim :foreground ,(doom-color 'yellow)))
  '(outline-1 :weight extra-bold :height 1.25)
  '(outline-2 :weight bold :height 1.15)
  '(outline-3 :weight bold :height 1.12)
  '(outline-4 :weight semi-bold :height 1.09)
  '(outline-5 :weight semi-bold :height 1.06)
  '(outline-6 :weight semi-bold :height 1.03)


(provide 'config)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(custom-safe-themes
   (quote
    ("e2acbf379aa541e07373395b977a99c878c30f20c3761aac23e9223345526bcc" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(diredfl-dir-heading ((t (:foreground nil))))
 '(diredfl-dir-name ((t (:foreground "#689d6a"))))
 '(diredfl-dir-priv ((t (:foreground "#689d6a"))))
 '(doom-modeline-buffer-modified ((t (:foreground "#fb4934"))))
 '(font-lock-builtin-face ((t (:foreground "#d3869b"))))
 '(font-lock-type-face ((t (:foreground "#d3869b"))))
 '(mode-line ((t (:background "#202020"))))
 '(mu4e-header-key-face ((t (:foreground "#fb4934" :weight bold))))
 '(mu4e-replied-face ((t (:foreground "#b8bb26"))))
 '(org-code ((t (:foreground "#fe8019"))))
 '(org-date ((t (:foreground "#fabd2f"))))
 '(org-document-info ((t (:foreground "#fb4934"))))
 '(org-document-title ((t (:foreground "#fb4934"))))
 '(org-drawer ((t (:foreground "#bbd9b0"))))
 '(org-formula ((t (:foreground "#b8bb26"))))
 '(org-list-dt ((t (:foreground "#8ec07c"))))
 '(org-table ((t (:foreground "#8ec07c"))))
 '(org-tag ((t (:foreground "#7c6f64"))))
 '(org-todo ((t (:foreground "#b8bb26"))))
 '(org-verbatim ((t (:foreground "#fabd2f"))))
 '(outline-1 ((t (:weight bold :height 1.2))))
 '(outline-2 ((t (:weight bold :height 1.15))))
 '(outline-3 ((t (:weight bold :height 1.12))))
 '(outline-4 ((t (:weight semi-bold :height 1.09))))
 '(outline-5 ((t (:weight semi-bold :height 1.06))))
 '(outline-6 ((t (:weight semi-bold :height 1.03))))
 '(outline-7 ((t (:foreground "#b3ceb4"))))
 '(outline-8 ((t (:weight semi-bold))))
 '(outline-9 ((t (:weight semi-bold))))
 '(preview-reference-face ((t (:background "white"))))
 '(solaire-mode-line-face ((t (:background "#202020"))))
 '(solaire-mode-line-inactive-face ((t (:background "#242424")))))

(load-theme 'doom-gruvbox t)

