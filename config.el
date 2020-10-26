;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; (require 'org-msg)
(require 'warnings)
(require 'lilypond-mode)
(require 'jabber-autoloads)

(setq doom-variable-pitch-font (font-spec :family "Overpass" :size 16))
(setq mixed-pitch-set-height t)

(load! "+functions")
(load! "calfw-cal")
(load! "+irc")
(load! "+mu4e")
(load! "+org")
(load! "+org-pretty-table")
(load! "+latex")
(load! "+popup")
(load! "+bindings")

(setq +doom-dashboard-banner-file (concat doom-private-dir "splash_gruv.png"))

(setq user-full-name "Michael Wernthaler"
      user-mail-address "michael.wernthaler@posteo.de"

      doom-font-increment 1
      doom-font (font-spec :family "Source Code Pro" :size 16)
      window-combination-resize t
      fill-column 80
      message-fill-column 80
      fill-flowed-encode-column 80
      auto-save-interval 100
      doom-modeline-buffer-encoding nil
      avy-single-candidate-jump t
      +evil-want-o/O-to-continue-comments nil
      projectile-project-search-path '("~/projects")
      truncate-lines nil
      company-idle-delay nil
      +ivy-buffer-preview t
      rainbow-delimiters-max-face-count 4
      evil-snipe-scope 'visible
      abbrev-file-name (concat doom-private-dir "abbrevs.el")

      ;; Dired
      dired-recursive-deletes 'always
      dired-recursive-copies 'always)

(setq auth-sources '("~/.authinfo.gpg")
      auth-source-cache-expiry nil)

;; (setq doom-gruvbox-dark-variant "hard")

(setq ispell-dictionary "de_DE")

(setq dimmer-fraction 0.3)
(dimmer-configure-which-key)
(dimmer-configure-magit)
(dimmer-configure-company-box)
(dimmer-mode 1)

;; (custom-set-variables
;;  '(zoom-size '(0.618 . 0.618)))
;; (zoom-mode 1)

(add-to-list '+lookup-provider-url-alist
             '("Wiktionary DE" "https://de.wiktionary.org/w/index.php?search=%s"))
(add-to-list 'warning-suppress-types '(yasnippet backquote-change))
;; Prevents some cases of Emacs flickering
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

(add-hook 'ibuffer-mode-hook 'ibuffer-auto-mode)
(add-hook 'org-mode-hook 'org-pretty-table-mode)
(add-hook 'mu4e-compose-mode-hook 'auto-fill-mode)
(add-hook 'pdf-view-mode-hook 'hide-mode-line-mode)
(add-hook 'reb-mode-hook 'hide-mode-line-mode)
(add-hook 'dired-mode-hook (λ! (dired-hide-details-mode)))
(add-hook 'Info-mode-hook #'mixed-pitch-mode)
(add-hook 'LaTeX-mode-hook #'latex-extra-mode)
(add-hook '+doom-dashboard-mode-hook #'hide-mode-line-mode)
(add-hook 'rustic-mode-hook #'rainbow-delimiters-mode-enable)

;; (focus-mode 1)
(auto-save-mode)
;; (global-subword-mode 1)
(global-prettify-symbols-mode -1)

(after! pdf
  (set-evil-initial-state! 'pdf-view-mode 'emacs))

(set-evil-initial-state! 'rcirc-mode 'normal)

(use-package! info-colors
  :commands (info-colors-fontify-node))

(use-package! authinfo-mode
  :mode ("authinfo\\.gpg\\'" . authinfo-mode))

(use-package! lilypond-mode
  :mode ("\\.ly\\'" . LilyPond-mode))

(add-hook 'Info-selection-hook 'info-colors-fontify-node)

;; (custom-set-faces!
;;   '(preview-reference-face :background "white"))

(use-package flycheck-rust
  :ensure t
  :config (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))

(after! centaur-tabs
  (centaur-tabs-mode 1)
  (setq centaur-tabs-height 26
        centaur-tabs-set-icons t
        centaur-tabs-plain-icons t
        centaur-tabs-icon-scale-factor 0.8
        centaur-tabs-set-close-button nil
        centaur-tabs-set-bar 'top
        centaur-tabs-style "wave"
        centaur-tabs-set-modified-marker nil
        centaur-tabs-gray-out-icons 'buffer)
  (centaur-tabs-change-fonts "P22 Underground Book" 120))
(setq x-underline-at-descent-line t)

;; Adjust the colors of doom-gruvbox
(custom-set-faces!
  `(font-lock-type-face :foreground ,(doom-color 'violet))
  `(font-lock-variable-name-face :foreground ,(doom-color 'blue)) ;rust
  `(font-lock-function-name-face :foreground ,(doom-color 'yellow)) ;rust
  `(rustic-builtin-formatting-macro :foreground ,(doom-color 'orange)) ;rust
  ;; `(font-lock-preprocessor-face :foreground ,(doom-color 'orange))
  `(doom-modeline-buffer-modified :foreground ,(doom-color 'red))
  `(diredfl-dir-heading :foreground ,(doom-color 'olive))
  `(diredfl-dir-name :foreground ,(doom-color 'dark-cyan))
  `(diredfl-dir-priv :foreground ,(doom-color 'dark-cyan))
  '(solaire-mode-line-face :background "#202020")
  '(mode-line :background "#202020")
  '(solaire-mode-line-inactive-face :background "#242424")
  `(font-lock-builtin-face :foreground ,(doom-color 'violet)) ;;elisp
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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(custom-safe-themes
   (quote
    ("e2acbf379aa541e07373395b977a99c878c30f20c3761aac23e9223345526bcc" default))))

(load-theme 'doom-gruvbox t)

(theme-magic-from-emacs)

(provide 'config)
