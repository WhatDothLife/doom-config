(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auth-source-save-behavior nil)
 '(custom-safe-themes
   '("2f1518e906a8b60fac943d02ad415f1d8b3933a5a7f75e307e6e9a26ef5bf570" "e2acbf379aa541e07373395b977a99c878c30f20c3761aac23e9223345526bcc" default))
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
 '(+eshell-prompt-pwd ((t (:foreground "#83a598"))))
 '(diredfl-dir-heading ((t (:foreground nil))))
 '(diredfl-dir-name ((t (:foreground "#689d6a"))))
 '(diredfl-dir-priv ((t (:foreground "#689d6a"))))
 '(doom-modeline-buffer-modified ((t (:foreground "#fb4934"))))
 '(eshell-git-prompt-powerline-dir-face ((t (:background "#935d6c"))))
 '(eshell-syntax-highlighting-string-face ((t (:foreground "#fabd2f"))))
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
