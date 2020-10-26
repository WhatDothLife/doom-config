(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(custom-safe-themes
   '("4f01c1df1d203787560a67c1b295423174fd49934deb5e6789abd1e61dba9552" "7d708f0168f54b90fc91692811263c995bebb9f68b8b7525d0e2200da9bc903c" "d5a878172795c45441efcd84b20a14f553e7e96366a163f742b95d65a3f55d71" "8d7684de9abb5a770fbfd72a14506d6b4add9a7d30942c6285f020d41d76e0fa" "cae81b048b8bccb7308cdcb4a91e085b3c959401e74a0f125e7c5b173b916bf9" "2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "e2acbf379aa541e07373395b977a99c878c30f20c3761aac23e9223345526bcc" default))
 '(evil-undo-system 'undo-redo)
 '(safe-local-variable-values
   '((ssh-deploy-on-explicit-save . 1)
     (ssh-deploy-root-remote . "/ssh:s8179597@taurus.hrsk.tu-dresden.de:/home/h6/s8179597/projects/DeepHPM/")
     (ssh-deploy-root-local . "/home/michael/projects/DeepHPM")
     (eval progn
           (pp-buffer)
           (indent-buffer))
     (eval when
           (and
            (buffer-file-name)
            (not
             (file-directory-p
              (buffer-file-name)))
            (string-match-p "^[^.]"
                            (buffer-file-name)))
           (unless
               (featurep 'package-build)
             (let
                 ((load-path
                   (cons "../package-build" load-path)))
               (require 'package-build)))
           (unless
               (derived-mode-p 'emacs-lisp-mode)
             (emacs-lisp-mode))
           (package-build-minor-mode)
           (setq-local flycheck-checkers nil)
           (set
            (make-local-variable 'package-build-working-dir)
            (expand-file-name "../working/"))
           (set
            (make-local-variable 'package-build-archive-dir)
            (expand-file-name "../packages/"))
           (set
            (make-local-variable 'package-build-recipes-dir)
            default-directory))
     (baz . "ham")
     (foo . "bar"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(+eshell-git-clean-face ((t (:foreground "#689d6a"))))
 '(+eshell-git-not-clean-face ((t (:foreground "#fe8019"))))
 '(+eshell-prompt-pwd ((t (:foreground "#d3869b"))))
 '(diredfl-dir-heading ((t (:foreground nil))))
 '(diredfl-dir-name ((t (:foreground "#689d6a"))))
 '(diredfl-dir-priv ((t (:foreground "#689d6a"))))
 '(doom-modeline-buffer-modified ((t (:foreground "#fb4934"))))
 '(eshell-git-prompt-powerline-dir-face ((t (:background "#935d6c"))))
 '(eshell-syntax-highlighting-string-face ((t (:foreground "#fabd2f"))))
 '(font-lock-builtin-face ((t (:foreground "#d3869b"))))
 '(font-lock-function-name-face ((t (:foreground "#fabd2f"))))
 '(font-lock-type-face ((t (:foreground "#d3869b"))))
 '(font-lock-variable-name-face ((t (:foreground "#83a598"))))
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
 '(org-table ((t (:foreground "#83a598"))))
 '(org-tag ((t (:foreground "#7c6f64"))))
 '(org-todo ((t (:foreground "#b8bb26"))))
 '(org-verbatim ((t (:foreground "#fabd2f"))))
 '(outline-1 ((t (:foreground "#d3869b" :height 1.25))))
 '(outline-2 ((t (:foreground "#8ec07c" :height 1.15))))
 '(outline-3 ((t (:foreground "#db9eaf" :height 1.12))))
 '(outline-4 ((t (:foreground "#8db58f" :height 1.09))))
 '(outline-5 ((t (:foreground "#e4b6c3" :height 1.06))))
 '(outline-6 ((t (:foreground "#b3ceb4" :height 1.03))))
 '(outline-7 ((t (:foreground "#edced7"))))
 '(outline-8 ((t (:weight semi-bold))))
 '(outline-9 ((t (:weight semi-bold))))
 '(preview-reference-face ((t (:background "white"))))
 '(rustic-builtin-formatting-macro ((t (:foreground "#fe8019"))))
 '(solaire-mode-line-face ((t (:background "#202020"))))
 '(solaire-mode-line-inactive-face ((t (:background "#242424")))))
