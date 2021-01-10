(custom-set-faces!
  `(font-lock-type-face :foreground ,(doom-color 'violet))
  `(font-lock-variable-name-face :foreground ,(doom-color 'blue)) ;rust
  `(font-lock-function-name-face :foreground ,(doom-color 'yellow)) ;rust
  `(rustic-builtin-formatting-macro :foreground ,(doom-color 'orange)) ;rust
  ;; `(font-lock-preprocessor-face :foreground ,(doom-color 'orange))
  `(doom-modeline-buffer-modified :foreground ,(doom-color 'red))
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

(after! diredfl
  (custom-set-faces!
    `(diredfl-dir-name :foreground ,(doom-color 'violet))
    `(diredfl-number :foreground ,(doom-color 'cyan))
    `(diredfl-date-time :foreground ,(doom-color 'blue))
    `(diredfl-read-priv :foreground ,(doom-color 'red))
    `(diredfl-write-priv :foreground ,(doom-color 'orange))
    `(diredfl-exec-priv :foreground ,(doom-color 'yellow))
    `(diredfl-dir-heading :foreground ,(doom-color 'violet))
    `(diredfl-dir-priv :foreground ,(doom-color 'violet))))

(setq doom-themes-treemacs-theme "doom-colors")
(setq doom-gruvbox-dark-variant "hard")

(load-theme 'doom-gruvbox t)

(setq doom-font-increment 1)
(setq doom-font (font-spec :family "Hasklig" :size 16)
      doom-variable-pitch-font (font-spec :family "sans" :size 15))

(doom/reload-font)

(setq mixed-pitch-set-height t)

;; (setq +doom-dashboard-banner-file (concat doom-private-dir "splash_gruv.png"))

(add-hook '+doom-dashboard-mode-hook 'hide-mode-line-mode)

(remove-hook 'org-mode-hook #'+literate-enable-recompile-h)

(setq user-full-name "Michael Wernthaler"
      user-mail-address "michael.wernthaler@posteo.de")

(setq auth-sources '("~/.local/share/pass/.authinfo.gpg")
      auth-source-cache-expiry nil)

(setq auth-source-pass-filename "~/.local/share/pass")

(setq abbrev-file-name (concat doom-private-dir "abbrevs.el"))

(set-popup-rule! "^\\*Customize.*" :slot 2 :side 'right :modeline nil :select t :quit t)
(set-popup-rule! " \\*undo-tree\\*" :slot 2 :side 'left :size 20 :modeline nil :select t :quit t)

;; * help
(set-popup-rule! "^\\*info.*" :size 82 :side 'right :ttl nil :select t :quit nil)
(set-popup-rule! "^\\*Man.*" :size 82 :side 'right :ttl 60 :select t :quit t)
(set-popup-rule! "^\\*tldr\\*" :size 82 :side 'right :ttl 60 :select t :quit t)
(set-popup-rule! "^\\*helpful.*" :size 82 :side 'right :ttl 60 :select t :quit t)
(set-popup-rule! "^\\*YASnippet Tables.*" :size 82 :side 'right :ttl 60 :select t :quit t)
;; (set-popup-rule! "^\\*Help.*" :size 82 :height 0.6 :side 'right :ttl 60 :select t :quit t)
(set-popup-rule! "^ \\*Metahelp.*" :size 82 :side 'right :ttl 60 :select t :quit t)
(set-popup-rule! "^\\*Apropos.*" :size 82 :height 0.6 :side 'right :ttl 60 :select t :quit t)
(set-popup-rule! "^\\*Messages\\*" :vslot -10 :height 10 :side 'bottom :select t :quit t :ttl nil)
(set-popup-rule! "^\\*TeX \\(?:Help\\|errors\\)" :size 0.3 :select t :ttl nil)


(set-popup-rule! "\\*VC-history\\*" :slot 2 :side 'right :size 82 :modeline nil :select t :quit t)

;; * web
(set-popup-rule! "^\\*eww.*" :size 82 :side 'right :ttl nil :select t)
(set-popup-rule! "\\*xwidget" :side 'right :size 100 :select t)

(setq dired-recursive-deletes 'always
      dired-recursive-copies 'always)

(setq doom-modeline-buffer-encoding nil)

(setq which-key-allow-multiple-replacements t
      delete-by-moving-to-trash t
      auto-save-interval 100
      company-idle-delay nil
      truncate-lines nil)

;; (add-to-list 'warning-suppress-types '(yasnippet backquote-change))

(setq display-line-numbers-type nil)

(setq frame-title-format
      '(""
        (:eval
         (if (s-contains-p org-roam-directory (or buffer-file-name ""))
             (replace-regexp-in-string
              ".*/[0-9]*-?" "☰ "
              (subst-char-in-string ?_ ?  buffer-file-name))
           "%b"))
        (:eval
         (let ((project-name (projectile-project-name)))
           (unless (string= "-" project-name)
             (format (if (buffer-modified-p)  " ◉ %s" "  ●  %s") project-name))))))

;; Prevents some cases of Emacs flickering
(add-to-list 'default-frame-alist '(inhibit-double-buffering . t))

(setq fill-column 70
      message-fill-column 70
      fill-flowed-encode-column 70)

(setq doom-fallback-buffer-name "► Doom"
      +doom-dashboard-name "► Doom")

(setq window-combination-resize t
      +ivy-buffer-preview t
      avy-single-candidate-jump t)

(auto-save-mode)
(global-subword-mode)
(global-prettify-symbols-mode -1)

(add-hook 'reb-mode-hook 'hide-mode-line-mode)
(add-hook 'dired-mode-hook 'hide-mode-line-mode)

(add-hook 'shell-mode-hook
          (lambda ()
            (face-remap-set-base 'comint-highlight-prompt :inherit nil)))

(setq ansi-color-map
      [default bold default italic underline success warning error nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil nil
        (foreground-color . "#1d2021")
        (foreground-color . "#fb4934")
        (foreground-color . "#b8bb26")
        (foreground-color . "#fabd2f")
        (foreground-color . "#fe8019")
        (foreground-color . "#d3869b")
        (foreground-color . "#689d6a")
        (foreground-color . "#ebdbb2")
        nil nil
        (background-color . "#1d2021")
        (background-color . "#fb4934")
        (background-color . "#b8bb26")
        (background-color . "#fabd2f")
        (background-color . "#fe8019")
        (background-color . "#d3869b")
        (background-color . "#689d6a")
        (background-color . "#ebdbb2")
        nil nil]
      )

(setq comint-process-echoes t)

(setq ispell-dictionary "en_US")
(require 'auto-dictionary)
(add-hook 'flyspell-mode-hook (lambda () (auto-dictionary-mode 1)))
(setq adict-language-list '(nil "en" "de"))
(setq adict-dictionary-list '(("en" . "en_US") ("de" . "de_DE")))
(remove-hook! '(org-mode-hook
                markdown-mode-hook
                TeX-mode-hook
                rst-mode-hook
                mu4e-compose-mode-hook
                message-mode-hook
                git-commit-mode-hook)
  #'flyspell-mode)

(after! centaur-tabs
  (setq centaur-tabs-height 26
        centaur-tabs-bar-height 26
        ;;         centaur-tabs-plain-icons t
        centaur-tabs-icon-scale-factor 0.8
        centaur-tabs-set-close-button nil
        centaur-tabs-set-bar nil
        centaur-tabs-style "wave")
  (centaur-tabs-change-fonts "P22 Underground Book" 120))

(add-hook 'mu4e-view-mode-hook #'centaur-tabs-local-mode)
(add-hook 'mu4e-headers-mode-hook #'centaur-tabs-local-mode)
(add-hook 'mu4e-main-mode-hook #'centaur-tabs-local-mode)
(add-hook 'dired-mode-hook #'centaur-tabs-local-mode)
(add-hook 'shell-mode-hook #'centaur-tabs-local-mode)

(centaur-tabs-mode)

(setq TeX-save-query nil
      ;; TeX-show-compilation nil
      +latex-viewers '(pdf-tools)
      reftex-default-bibliography "~/code/Latex/bib.bib"
      bibtex-completion-bibliography '("~/code/Latex/bib.bib"))

(add-hook! 'LaTeX-mode-hook
  (add-hook! 'after-save-hook :local
    (call-interactively 'TeX-command-run-all)))

;; (require 'latex-extra)
(after! latex-extra
  (add-hook 'LaTeX-mode-hook #'latex-extra-mode))
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
;; (add-hook 'LaTeX-mode-hook #'mixed-pitch-mode)

(require 'mu4e)
(require 'smtpmail)
(require 'gnutls)


(defvar my-mu4e-account-alist
  '(("posteo"
     (mu4e-sent-folder "/posteo/Sent")
     (mu4e-drafts-folder "/posteo/Drafts")
     (mu4e-refile-folder "/posteo/Archives")
     (mu4e-trash-folder "/posteo/Trash")
     (user-mail-address "michael.wernthaler@posteo.de")
     (smtpmail-default-smtp-server "posteo.de")
     (smtpmail-smtp-user "michael.wernthaler@posteo.de")
     (smtpmail-smtp-server "posteo.de")
     (smtpmail-stream-type ssl)
     (smtpmail-smtp-service 465))
    ("zih"
     (mu4e-sent-folder "/zih/Sent")
     (mu4e-drafts-folder "/zih/Drafts")
     (mu4e-refile-folder "/zih/Archives")
     (mu4e-trash-folder "/zih/Trash")
     (user-mail-address "michael.wernthaler@mailbox.tu-dresden.de")
     (smtpmail-default-smtp-server "msx.tu-dresden.de")
     (smtpmail-local-domain "tu-dresden.de")
     (smtpmail-smtp-user "s8179597")
     (smtpmail-smtp-server "msx.tu-dresden.de")
     (smtpmail-stream-type starttls)
     (smtpmail-smtp-service 587))))

(defun my-mu4e-set-account ()
  "Set the account for composing a message."
  (let* ((account
          (if mu4e-compose-parent-message
              (let ((maildir (mu4e-message-field mu4e-compose-parent-message :maildir)))
                (string-match "/\\(.*?\\)/" maildir)
                (match-string 1 maildir))
            (completing-read (format "Compose with account: (%s) "
                                     (mapconcat #'(lambda (var) (car var))
                                                my-mu4e-account-alist "/"))
                             (mapcar #'(lambda (var) (car var)) my-mu4e-account-alist)
                             nil t nil nil (caar my-mu4e-account-alist))))
         (account-vars (cdr (assoc account my-mu4e-account-alist))))
    (if account-vars
        (mapc #'(lambda (var)
                  (set (car var) (cadr var)))
              account-vars)
      (error "No email account found"))))


(add-hook 'mu4e-compose-pre-hook 'my-mu4e-set-account)
(add-hook 'mu4e-main-mode-hook (lambda () (setq flyspell-dash-local-dictionary "deutsch8")))

(setq mu4e-attachment-dir "~/tmp/Mail"

      mu4e-use-fancy-chars nil
      smtpmail-queue-dir "~/.mail/queue/cur"

      mu4e-headers-date-format "%d/%m/%y")

(setq mu4e-contexts
      `( ,(make-mu4e-context
           :name "Private"
           :enter-func (lambda () (mu4e-message "Entering Private context"))
           :leave-func (lambda () (mu4e-message "Leaving Private context"))
           :match-func (lambda (msg)
                         (when msg
                           (mu4e-message-contact-field-matches msg
                                                               :to "michael.wernthaler@posteo.de")))
           :vars '( (user-mail-address . "michael.wernthaler@posteo.de"  )
                    (user-full-name . "Michael Wernthaler" )
                    (mu4e-sent-folder . "/posteo/Sent")
                    (mu4e-drafts-folder . "/posteo/Drafts")
                    (mu4e-refile-folder . "/posteo/Archives")
                    (mu4e-trash-folder . "/posteo/Trash")))
         ,(make-mu4e-context
           :name "Uni"
           :enter-func (lambda () (mu4e-message "Switch to the Uni context"))
           :match-func (lambda (msg)
                         (when msg
                           (string-match-p "^/zih" (mu4e-message-field msg :maildir))))
           :vars '( (user-mail-address . "michael.wernthaler@msx.tu-dresden.de" )
                    (user-full-name . "Michael Wernthaler" )
                    (mu4e-sent-folder . "/zih/Sent")
                    (mu4e-drafts-folder . "/zih/Drafts")
                    (mu4e-refile-folder . "/zih/Archives")
                    (mu4e-trash-folder . "/zih/Trash")))))

(setq mu4e-maildir-shortcuts
      '( ("/posteo/INBOX"     . ?p)
         ("/zih/INBOX"   . ?z)
         ;;("/lists"     . ?l)
         ;;("/work"      . ?w)
         ;;("/sent"      . ?s)
         ))

;; set `mu4e-context-policy` and `mu4e-compose-policy` to tweak when mu4e should
;; guess or ask the correct context, e.g.

;; start with the first (default) context;
;; default is to ask-if-none (ask when there's no context yet, and none match)
(setq mu4e-context-policy 'pick-first)

;; compose with the current context is no context matches;
;; default is to ask
(setq mu4e-compose-context-policy nil)
(setq mu4e-view-show-images nil)
(add-hook 'mu4e-view-mode-hook 'mixed-pitch-mode)
(add-hook 'mu4e-main-mode-hook 'hide-mode-line-mode)
(add-hook 'mu4e-loading-mode-hook 'hide-mode-line-mode)
(add-hook 'mu4e~update-mail-mode-hook 'hide-mode-line-mode)
(add-hook 'mu4e-compose-mode-hook 'hide-mode-line-mode)
(add-hook 'mu4e-headers-mode-hook 'hide-mode-line-mode)
(add-hook 'mu4e-view-mode-hook 'hide-mode-line-mode)

(remove-hook 'mu4e-compose-mode-hook #'org-mu4e-compose-org-mode)

(add-hook 'mu4e-compose-mode-hook 'auto-fill-mode)
(add-hook 'org-msg-mode-hook 'flyspell-lazy-mode-disable)

;; (defvar ambrevar/mu4e-compose-signed-p t)
;; (defvar ambrevar/mu4e-compose-signed-and-crypted-p nil)
;; (defun ambrevar/mu4e-compose-maybe-signed-and-crypted ()
;;   "Maybe sign or encrypt+sign message.
;; Message is signed or encrypted+signed when replying to a signed or encrypted
;; message, respectively.
;; Alternatively, message is signed or encrypted+signed if
;; `ambrevar/mu4e-compose-signed-p' or `ambrevar/mu4e-compose-signed-and-crypted-p' is
;; non-nil, respectively.
;; This function is suitable for `mu4e-compose-mode-hook'."
;;   (let ((msg mu4e-compose-parent-message))
;;     (cond
;;      ((or ambrevar/mu4e-compose-signed-and-crypted-p
;;           (and msg (member 'encrypted (mu4e-message-field msg :flags))))
;;       (mml-secure-message-sign-encrypt))
;;      ((or ambrevar/mu4e-compose-signed-p
;;           (and msg (member 'signed (mu4e-message-field msg :flags))))
;;       (mml-secure-message-sign-pgpmime)))))
;; (add-hook 'mu4e-compose-mode-hook 'ambrevar/mu4e-compose-maybe-signed-and-crypted)

;; (defun mu4e-mark-set (mark &optional target)
;;   "Mark the header at point, or, if region is active, mark all
;; headers in the region. Optionally, provide TARGET (for moves)."
;;   (unless target
;;     (setq target (mu4e~mark-ask-target mark)))
;;   (if (not (use-region-p))
;;       ;; single message
;;       (mu4e-mark-at-point mark target)
;;     ;; mark all messages in the region.
;;     (save-excursion
;;       (let ((cant-go-further) (eor (region-end)))
;;         (goto-char (region-beginning))
;;         (while (and (< (point) eor) (not cant-go-further))
;;           (mu4e-mark-at-point mark target)
;;           (setq cant-go-further (not (mu4e-headers-next))))))))

(after! pdf
  (set-evil-initial-state! 'pdf-view-mode 'emacs))

(add-hook 'pdf-view-mode-hook 'hide-mode-line-mode)

(defun +pdf-top-next-page ()
  (interactive)
  (pdf-view-next-page-command)
  (image-bob))

(defun +pdf-bottom-last-page ()
  (interactive)
  (pdf-view-previous-page-command)
  (image-eob))

;; (require 'lilypond-mode)

;; (use-package! lilypond-mode
;;   :mode ("\\.ly\\'" . LilyPond-mode))

;; (use-package! authinfo-mode
;;   :mode ("authinfo\\.gpg\\'" . authinfo-mode))

(add-hook 'rustic-mode-hook #'rainbow-delimiters-mode-enable)
;;temporary workaround
(setq-hook! 'rustic-mode-hook lsp-rust-analyzer-server-command '("~/tmp/build/rust-analyzer-linux"))

(setq projectile-project-search-path '("~/repos"))

(setq +evil-want-o/O-to-continue-comments nil
      evil-snipe-scope 'visible)

(after! evil (setq evil-ex-substitute-global t))

(after! lsp-ui
  (setq lsp-ui-doc-position 'top
        lsp-auto-execute-action nil
        lsp-enable-symbol-highlighting nil
        lsp-ui-doc-max-width 200
        lsp-ui-doc-max-height 150
        lsp-ui-imenu-colors `(,(doom-color 'violet) ,(doom-color 'cyan))))

(custom-set-faces! `(lsp-headerline-breadcrumb-separator-face :foreground ,(doom-color 'violet))
  `(lsp-headerline-breadcrumb-symbols-face :foreground ,(doom-color 'cyan)))
(setq lsp-headerline-breadcrumb-segments '(symbols)
      lsp-headerline-breadcrumb-enable-diagnostics nil)
(setq lsp-ui-doc-border (doom-color 'violet))
(add-hook 'lsp-ui-imenu-mode-hook 'hide-mode-line-mode)

(shx-global-mode 1)

(setq treemacs-width 30)

(after! treemacs
  (after! ace-window
    (add-to-list 'aw-ignored-buffers 'treemacs-mode)))

(after! treemacs-evil
  (evil-define-key 'treemacs treemacs-mode-map "l" nil)
  (map!
   (:map treemacs-mode-map
    "l" nil)
   (:map evil-treemacs-state-map
    "j"       nil
    "l"       nil
    "gd"      #'treemacs-remove-project-from-workspace
    "-"       #'treemacs-root-up
    "p"       #'treemacs-peek
    "l"       #'treemacs-root-up
    "a"       #'treemacs-root-down
    "i"       #'treemacs-i-action
    "e"       #'treemacs-e-action
    "M-i"     #'treemacs-previous-line-other-window
    "M-e"     #'treemacs-next-line-other-window
    "M-l"     #'treemacs-previous-neighbour
    "M-a"     #'treemacs-next-neighbour
    "<left>"  #'treemacs-left-action
    "<right>" #'treemacs-right-action)))

(defun treemacs-left-action (&optional arg)
  (interactive "P")
  (-when-let (state (treemacs--prop-at-point :state))
    (--if-let (cdr (assq state treemacs-left-actions-config))
        (progn
          (funcall it arg)
          (treemacs--evade-image))
      (treemacs-pulse-on-failure "No <left> action defined for node of type %s."
        (propertize (format "%s" state) 'face 'font-lock-type-face)))))

(defun treemacs-right-action (&optional arg)
  (interactive "P")
  (-when-let (state (treemacs--prop-at-point :state))
    (--if-let (cdr (assq state treemacs-right-actions-config))
        (progn
          (funcall it arg)
          (treemacs--evade-image))
      (treemacs-pulse-on-failure "No <right> action defined for node of type %s."
        (propertize (format "%s" state) 'face 'font-lock-type-face)))))


(defvar treemacs-left-actions-config
  '((root-node-open   . treemacs-toggle-node)
    (root-node-closed . treemacs-root-up)
    (dir-node-open    . treemacs-toggle-node)
    (dir-node-closed  . treemacs-collapse-parent-node)
    (file-node-open   . treemacs-collapse-parent-node)
    (file-node-closed . treemacs-collapse-parent-node)
    (tag-node-open    . treemacs-collapse-parent-node)
    (tag-node-closed  . treemacs-collapse-parent-node)
    (tag-node         . treemacs-collapse-parent-node)))

(defvar treemacs-right-actions-config
  '((root-node-closed . treemacs-toggle-node)
    (dir-node-closed  . treemacs-toggle-node)
    (dir-node-open  . dired)
    (file-node-open   . treemacs-visit-node-default)
    (file-node-closed . treemacs-visit-node-default)
    (tag-node-closed  . treemacs-collapse-parent-node)
    (tag-node         . treemacs-visit-node-default)))

(defun treemacs-i-action (&optional arg)
  (interactive "P")
  (treemacs-left-action '(4)))

(defun treemacs-e-action (&optional arg)
  (interactive "P")
  (treemacs-right-action '(4)))

(global-org-pretty-table-mode)

(setq org-fontify-quote-and-verse-blocks t)
(setq org-ellipsis " ▾ ")

;; We define this ourselves, so we can remove characters
;; with overlength, since they break our tables
(after! tex-mode
  (setq tex--prettify-symbols-alist
        '(("\\alpha" . ?α)
          ("\\beta" . ?β)
          ("\\gamma" . ?γ)
          ("\\delta" . ?δ)
          ("\\epsilon" . ?ϵ)
          ("\\zeta" . ?ζ)
          ("\\eta" . ?η)
          ("\\theta" . ?θ)
          ("\\iota" . ?ι)
          ("\\kappa" . ?κ)
          ("\\lambda" . ?λ)
          ("\\mu" . ?μ)
          ("\\nu" . ?ν)
          ("\\xi" . ?ξ)
          ;; There is no \omicron because it looks like a latin o.
          ("\\pi" . ?π)
          ("\\rho" . ?ρ)
          ("\\sigma" . ?σ)
          ("\\tau" . ?τ)
          ("\\upsilon" . ?υ)
          ("\\phi" . ?ϕ)
          ("\\chi" . ?χ)
          ("\\psi" . ?ψ)
          ("\\omega" . ?ω)
          ;; Uppercase Greek letters.
          ("\\Gamma" . ?Γ)
          ("\\Delta" . ?Δ)
          ("\\Lambda" . ?Λ)
          ("\\Phi" . ?Φ)
          ("\\Pi" . ?Π)
          ("\\Psi" . ?Ψ)
          ("\\Sigma" . ?Σ)
          ("\\Theta" . ?Θ)
          ("\\Upsilon" . ?Υ)
          ("\\Xi" . ?Ξ)
          ("\\Omega" . ?Ω)

          ;; Other math symbols (taken from leim/quail/latin-ltx.el).
          ("\\Box" . ?□)
          ("\\Bumpeq" . ?≎)
          ("\\Cap" . ?⋒)
          ("\\Cup" . ?⋓)
          ("\\Diamond" . ?◇)
          ("\\Downarrow" . ?⇓)
          ("\\H{o}" . ?ő)
          ("\\Im" . ?ℑ)
          ("\\Join" . ?⋈)
          ("\\Leftarrow" . ?⇐)
          ("\\Leftrightarrow" . ?⇔)
          ("\\Ll" . ?⋘)
          ("\\Lleftarrow" . ?⇚)
          ("\\Longleftarrow" . ?⇐)
          ("\\Longleftrightarrow" . ?⇔)
          ("\\Longrightarrow" . ?⇒)
          ("\\Lsh" . ?↰)
          ("\\Re" . ?ℜ)
          ("\\Rightarrow" . ?⇒)
          ("\\Rrightarrow" . ?⇛)
          ("\\Rsh" . ?↱)
          ("\\Subset" . ?⋐)
          ("\\Supset" . ?⋑)
          ("\\Uparrow" . ?⇑)
          ("\\Updownarrow" . ?⇕)
          ("\\Vdash" . ?⊩)
          ("\\Vert" . ?‖)
          ("\\Vvdash" . ?⊪)
          ("\\aleph" . ?ℵ)
          ("\\amalg" . ?∐)
          ("\\angle" . ?∠)
          ("\\approx" . ?≈)
          ("\\approxeq" . ?≊)
          ("\\ast" . ?∗)
          ("\\asymp" . ?≍)
          ("\\backcong" . ?≌)
          ("\\backepsilon" . ?∍)
          ("\\backprime" . ?‵)
          ("\\backsim" . ?∽)
          ("\\backsimeq" . ?⋍)
          ("\\backslash" . ?\\)
          ("\\barwedge" . ?⊼)
          ("\\because" . ?∵)
          ("\\beth" . ?ℶ)
          ("\\between" . ?≬)
          ("\\bigcap" . ?⋂)
          ("\\bigcirc" . ?◯)
          ("\\bigcup" . ?⋃)
          ("\\bigstar" . ?★)
          ("\\bigtriangledown" . ?▽)
          ("\\bigtriangleup" . ?△)
          ("\\bigvee" . ?⋁)
          ("\\bigwedge" . ?⋀)
          ("\\blacklozenge" . ?✦)
          ("\\blacksquare" . ?▪)
          ("\\blacktriangle" . ?▴)
          ("\\blacktriangledown" . ?▾)
          ("\\blacktriangleleft" . ?◂)
          ("\\blacktriangleright" . ?▸)
          ("\\bot" . ?⊥)
          ("\\bowtie" . ?⋈)
          ("\\boxminus" . ?⊟)
          ("\\boxplus" . ?⊞)
          ("\\boxtimes" . ?⊠)
          ("\\bullet" . ?•)
          ("\\bumpeq" . ?≏)
          ("\\cap" . ?∩)
          ("\\cdots" . ?⋯)
          ("\\centerdot" . ?·)
          ("\\checkmark" . ?✓)
          ("\\chi" . ?χ)
          ("\\cdot" . ?⋅)
          ("\\cdots" . ?⋯)
          ("\\circ" . ?∘)
          ("\\circeq" . ?≗)
          ("\\circlearrowleft" . ?↺)
          ("\\circlearrowright" . ?↻)
          ("\\circledR" . ?®)
          ("\\circledS" . ?Ⓢ)
          ("\\circledast" . ?⊛)
          ("\\circledcirc" . ?⊚)
          ("\\circleddash" . ?⊝)
          ("\\clubsuit" . ?♣)
          ("\\coloneq" . ?≔)
          ("\\complement" . ?∁)
          ("\\cong" . ?≅)
          ("\\coprod" . ?∐)
          ("\\cup" . ?∪)
          ("\\curlyeqprec" . ?⋞)
          ("\\curlyeqsucc" . ?⋟)
          ("\\curlypreceq" . ?≼)
          ("\\curlyvee" . ?⋎)
          ("\\curlywedge" . ?⋏)
          ("\\curvearrowleft" . ?↶)
          ("\\curvearrowright" . ?↷)
          ("\\dag" . ?†)
          ("\\dagger" . ?†)
          ("\\daleth" . ?ℸ)
          ("\\dashv" . ?⊣)
          ("\\ddag" . ?‡)
          ("\\ddagger" . ?‡)
          ("\\ddots" . ?⋱)
          ("\\diamond" . ?⋄)
          ("\\diamondsuit" . ?♢)
          ("\\divideontimes" . ?⋇)
          ("\\doteq" . ?≐)
          ("\\doteqdot" . ?≑)
          ("\\dotplus" . ?∔)
          ("\\dotsquare" . ?⊡)
          ("\\downarrow" . ?↓)
          ("\\downdownarrows" . ?⇊)
          ("\\downleftharpoon" . ?⇃)
          ("\\downrightharpoon" . ?⇂)
          ("\\ell" . ?ℓ)
          ("\\emptyset" . ?∅)
          ("\\eqcirc" . ?≖)
          ("\\eqcolon" . ?≕)
          ("\\eqslantgtr" . ?⋝)
          ("\\eqslantless" . ?⋜)
          ("\\equiv" . ?≡)
          ("\\exists" . ?∃)
          ("\\fallingdotseq" . ?≒)
          ("\\flat" . ?♭)
          ("\\forall" . ?∀)
          ("\\frown" . ?⌢)
          ("\\ge" . ?≥)
          ("\\geq" . ?≥)
          ("\\geqq" . ?≧)
          ("\\geqslant" . ?≥)
          ("\\gets" . ?←)
          ("\\gg" . ?≫)
          ("\\ggg" . ?⋙)
          ("\\gimel" . ?ℷ)
          ("\\gnapprox" . ?⋧)
          ("\\gneq" . ?≩)
          ("\\gneqq" . ?≩)
          ("\\gnsim" . ?⋧)
          ("\\gtrapprox" . ?≳)
          ("\\gtrdot" . ?⋗)
          ("\\gtreqless" . ?⋛)
          ("\\gtreqqless" . ?⋛)
          ("\\gtrless" . ?≷)
          ("\\gtrsim" . ?≳)
          ("\\gvertneqq" . ?≩)
          ("\\hbar" . ?ℏ)
          ("\\heartsuit" . ?♥)
          ("\\hookleftarrow" . ?↩)
          ("\\hookrightarrow" . ?↪)
          ("\\iff" . ?⇔)
          ("\\imath" . ?ı)
          ("\\in" . ?∈)
          ("\\infty" . ?∞)
          ("\\int" . ?∫)
          ("\\intercal" . ?⊺)
          ("\\langle" . 10216)          ; Literal ?⟨ breaks indentation.
          ("\\lbrace" . ?{)
          ("\\lbrack" . ?\[)
          ("\\lceil" . ?⌈)
          ("\\ldots" . ?…)
          ("\\le" . ?≤)
          ("\\leadsto" . ?↝)
          ("\\leftarrow" . ?←)
          ("\\leftarrowtail" . ?↢)
          ("\\leftharpoondown" . ?↽)
          ("\\leftharpoonup" . ?↼)
          ("\\leftleftarrows" . ?⇇)
          ;; ("\\leftparengtr" ?〈), see bug#12948.
          ("\\leftrightarrow" . ?↔)
          ("\\leftrightarrows" . ?⇆)
          ("\\leftrightharpoons" . ?⇋)
          ("\\leftrightsquigarrow" . ?↭)
          ("\\leftthreetimes" . ?⋋)
          ("\\leq" . ?≤)
          ("\\leqq" . ?≦)
          ("\\leqslant" . ?≤)
          ("\\lessapprox" . ?≲)
          ("\\lessdot" . ?⋖)
          ("\\lesseqgtr" . ?⋚)
          ("\\lesseqqgtr" . ?⋚)
          ("\\lessgtr" . ?≶)
          ("\\lesssim" . ?≲)
          ("\\lfloor" . ?⌊)
          ("\\lhd" . ?◁)
          ("\\rhd" . ?▷)
          ("\\ll" . ?≪)
          ("\\llcorner" . ?⌞)
          ("\\lnapprox" . ?⋦)
          ("\\lneq" . ?≨)
          ("\\lneqq" . ?≨)
          ("\\lnsim" . ?⋦)
          ("\\longleftarrow" . ?←)
          ("\\longleftrightarrow" . ?↔)
          ("\\longmapsto" . ?↦)
          ("\\longrightarrow" . ?→)
          ("\\looparrowleft" . ?↫)
          ("\\looparrowright" . ?↬)
          ("\\lozenge" . ?✧)
          ("\\lq" . ?‘)
          ("\\lrcorner" . ?⌟)
          ("\\ltimes" . ?⋉)
          ("\\lvertneqq" . ?≨)
          ("\\maltese" . ?✠)
          ("\\mapsto" . ?↦)
          ("\\measuredangle" . ?∡)
          ("\\mho" . ?℧)
          ("\\mid" . ?∣)
          ("\\models" . ?⊧)
          ("\\mp" . ?∓)
          ("\\multimap" . ?⊸)
          ("\\nLeftarrow" . ?⇍)
          ("\\nLeftrightarrow" . ?⇎)
          ("\\nVDash" . ?⊯)
          ("\\nVdash" . ?⊮)
          ("\\nabla" . ?∇)
          ("\\napprox" . ?≉)
          ("\\natural" . ?♮)
          ("\\ncong" . ?≇)
          ("\\ne" . ?≠)
          ("\\nearrow" . ?↗)
          ("\\neg" . ?¬)
          ("\\neq" . ?≠)
          ("\\nequiv" . ?≢)
          ("\\newline" . ? )
          ("\\nexists" . ?∄)
          ("\\ngeq" . ?≱)
          ("\\ngeqq" . ?≱)
          ("\\ngeqslant" . ?≱)
          ("\\ngtr" . ?≯)
          ("\\ni" . ?∋)
          ("\\nleftarrow" . ?↚)
          ("\\nleftrightarrow" . ?↮)
          ("\\nleq" . ?≰)
          ("\\nleqq" . ?≰)
          ("\\nleqslant" . ?≰)
          ("\\nless" . ?≮)
          ("\\nmid" . ?∤)
          ;; ("\\not" ?̸)              ;FIXME: conflict with "NOT SIGN" ¬.
          ("\\notin" . ?∉)
          ("\\nparallel" . ?∦)
          ("\\nprec" . ?⊀)
          ("\\npreceq" . ?⋠)
          ("\\nshortmid" . ?∤)
          ("\\nshortparallel" . ?∦)
          ("\\nsim" . ?≁)
          ("\\nsimeq" . ?≄)
          ("\\nsubset" . ?⊄)
          ("\\nsubseteq" . ?⊈)
          ("\\nsubseteqq" . ?⊈)
          ("\\nsucc" . ?⊁)
          ("\\nsucceq" . ?⋡)
          ("\\nsupset" . ?⊅)
          ("\\nsupseteq" . ?⊉)
          ("\\nsupseteqq" . ?⊉)
          ("\\ntriangleleft" . ?⋪)
          ("\\ntrianglelefteq" . ?⋬)
          ("\\ntriangleright" . ?⋫)
          ("\\ntrianglerighteq" . ?⋭)
          ("\\nvDash" . ?⊭)
          ("\\nvdash" . ?⊬)
          ("\\nwarrow" . ?↖)
          ("\\odot" . ?⊙)
          ("\\oint" . ?∮)
          ("\\ominus" . ?⊖)
          ("\\oplus" . ?⊕)
          ("\\oslash" . ?⊘)
          ("\\otimes" . ?⊗)
          ("\\par" . ? )
          ("\\parallel" . ?∥)
          ("\\partial" . ?∂)
          ("\\perp" . ?⊥)
          ("\\pitchfork" . ?⋔)
          ("\\prec" . ?≺)
          ("\\precapprox" . ?≾)
          ("\\preceq" . ?≼)
          ("\\precnapprox" . ?⋨)
          ("\\precnsim" . ?⋨)
          ("\\precsim" . ?≾)
          ("\\prime" . ?′)
          ("\\prod" . ?∏)
          ("\\propto" . ?∝)
          ("\\qed" . ?∎)
          ("\\qquad" . ?⧢)
          ("\\quad" . ?␣)
          ("\\rangle" . 10217)            ; Literal ?⟩ breaks indentation.
          ("\\rbrace" . ?})
          ("\\rbrack" . ?\])
          ("\\rceil" . ?⌉)
          ("\\rfloor" . ?⌋)
          ("\\rightarrow" . ?→)
          ("\\rightarrowtail" . ?↣)
          ("\\rightharpoondown" . ?⇁)
          ("\\rightharpoonup" . ?⇀)
          ("\\rightleftarrows" . ?⇄)
          ("\\rightleftharpoons" . ?⇌)
          ;; ("\\rightparengtr" ?⦔) ;; Was ?〉, see bug#12948.
          ("\\rightrightarrows" . ?⇉)
          ("\\rightthreetimes" . ?⋌)
          ("\\risingdotseq" . ?≓)
          ("\\rtimes" . ?⋊)
          ("\\times" . ?×)
          ("\\sbs" . ?﹨)
          ("\\searrow" . ?↘)
          ("\\setminus" . ?∖)
          ("\\sharp" . ?♯)
          ("\\shortmid" . ?∣)
          ("\\shortparallel" . ?∥)
          ("\\sim" . ?∼)
          ("\\simeq" . ?≃)
          ("\\smallamalg" . ?∐)
          ("\\smallsetminus" . ?∖)
          ("\\smallsmile" . ?⌣)
          ("\\smile" . ?⌣)
          ("\\spadesuit" . ?♠)
          ("\\sphericalangle" . ?∢)
          ("\\sqcap" . ?⊓)
          ("\\sqcup" . ?⊔)
          ("\\sqsubset" . ?⊏)
          ("\\sqsubseteq" . ?⊑)
          ("\\sqsupset" . ?⊐)
          ("\\sqsupseteq" . ?⊒)
          ("\\square" . ?□)
          ("\\squigarrowright" . ?⇝)
          ("\\star" . ?⋆)
          ("\\straightphi" . ?φ)
          ("\\subset" . ?⊂)
          ("\\subseteq" . ?⊆)
          ("\\subseteqq" . ?⊆)
          ("\\subsetneq" . ?⊊)
          ("\\subsetneqq" . ?⊊)
          ("\\succ" . ?≻)
          ("\\succapprox" . ?≿)
          ("\\succcurlyeq" . ?≽)
          ("\\succeq" . ?≽)
          ("\\succnapprox" . ?⋩)
          ("\\succnsim" . ?⋩)
          ("\\succsim" . ?≿)
          ("\\sum" . ?∑)
          ("\\supset" . ?⊃)
          ("\\supseteq" . ?⊇)
          ("\\supseteqq" . ?⊇)
          ("\\supsetneq" . ?⊋)
          ("\\supsetneqq" . ?⊋)
          ("\\surd" . ?√)
          ("\\swarrow" . ?↙)
          ("\\therefore" . ?∴)
          ("\\thickapprox" . ?≈)
          ("\\thicksim" . ?∼)
          ("\\to" . ?→)
          ("\\top" . ?⊤)
          ("\\triangle" . ?▵)
          ("\\triangledown" . ?▿)
          ("\\triangleleft" . ?◃)
          ("\\trianglelefteq" . ?⊴)
          ("\\triangleq" . ?≜)
          ("\\triangleright" . ?▹)
          ("\\trianglerighteq" . ?⊵)
          ("\\twoheadleftarrow" . ?↞)
          ("\\twoheadrightarrow" . ?↠)
          ("\\ulcorner" . ?⌜)
          ("\\uparrow" . ?↑)
          ("\\updownarrow" . ?↕)
          ("\\upleftharpoon" . ?↿)
          ("\\uplus" . ?⊎)
          ("\\uprightharpoon" . ?↾)
          ("\\upuparrows" . ?⇈)
          ("\\urcorner" . ?⌝)
          ("\\u{i}" . ?ĭ)
          ("\\vDash" . ?⊨)
          ("\\varepsilon" . ?ε)
          ("\\varphi" . ?φ)
          ("\\varprime" . ?′)
          ("\\varpropto" . ?∝)
          ("\\varrho" . ?ϱ)
          ("\\varsigma" ?ς)
          ("\\vartriangleleft" . ?⊲)
          ("\\vartriangleright" . ?⊳)
          ("\\vdash" . ?⊢)
          ("\\vdots" . ?⋮)
          ("\\vee" . ?∨)
          ("\\veebar" . ?⊻)
          ("\\vert" . ?|)
          ("\\wedge" . ?∧)
          ("\\wp" . ?℘)
          ("\\wr" . ?≀)
          ("\\Bbb{N}" . ?ℕ)			; AMS commands for blackboard bold
          ("\\Bbb{P}" . ?ℙ)			; Also sometimes \mathbb.
          ("\\Bbb{Q}" . ?ℚ)
          ("\\Bbb{R}" . ?ℝ)
          ("\\Bbb{Z}" . ?ℤ)
          ("--" . ?–)
          ("---" . ?—)
          ("\\ordfeminine" . ?ª)
          ("\\ordmasculine" . ?º)
          ("\\lambdabar" . ?ƛ)
          ("\\celsius" . ?℃)
          ("\\textmu" . ?µ)
          ("\\textfractionsolidus" . ?⁄)
          ("\\textbigcircle" . ?⃝)
          ("\\textmusicalnote" . ?♪)
          ("\\textdied" . ?✝)
          ("\\textcolonmonetary" . ?₡)
          ("\\textwon" . ?₩)
          ("\\textnaira" . ?₦)
          ("\\textpeso" . ?₱)
          ("\\textlira" . ?₤)
          ("\\textrecipe" . ?℞)
          ("\\textinterrobang" . ?‽)
          ("\\textpertenthousand" . ?‱)
          ("\\textbaht" . ?฿)
          ("\\textnumero" . ?№)
          ("\\textdiscount" . ?⁒)
          ("\\textestimated" . ?℮)
          ("\\textopenbullet" . ?◦)
          ("\\textlquill" . 8261)		; Literal ?⁅ breaks indentation.
          ("\\textrquill" . 8262)             ; Literal ?⁆ breaks indentation.
          ("\\textcircledP" . ?℗)
          ("\\textreferencemark" . ?※))))

(add-hook! 'org-mode-hook (cmd! () (auto-composition-mode -1)))
(add-hook! 'org-mode-hook (cmd! () (auto-fill-mode 1)))

(setq org-format-latex-options (plist-put org-format-latex-options :scale 1.35))
(setq org-src-block-faces '(("latex" (:background "#1d2021"))))

(custom-set-faces! '(org-block :background "#1d2021")
  '(org-block-begin-line :background "#1d2021")
  '(org-block-end-line :background "#1d2021"))

(after! org
  (setq org-highlight-latex-and-related '(native)))

(after! org
  ;; fix color handling in org-preview-latex-fragment
  (let ((dvipng--plist (alist-get 'dvipng org-preview-latex-process-alist)))
    (plist-put dvipng--plist :use-xcolor t)
    (plist-put dvipng--plist :image-converter '("dvipng -D %D -bg 'transparent' -T tight -o %O %f"))))

(after! org
  (appendq! +ligatures-extra-symbols
            `(:checkbox      "☐"
              :pending       "◼"
              :checkedbox    "☑"
              :list_property "∷"
              :em_dash       "—"
              :ellipses      "…"
              :title         "𝙏"
              :subtitle      "𝙩"
              :author        "𝘼"
              :date          "𝘿"
              :property      "☸"
              :options       "⌥"
              :startup       "ⓢ"
              :latex_class   "ⓒ"
              :latex_header  "⇥"
              :beamer_header "↠"
              :attr_latex    "Ⓛ"
              :attr_html     "ⓗ"
              :begin_quote   "❮"
              :end_quote     "❯"
              :caption       "☰"
              :header        "›"
              :results       "↦"
              :begin_export  "⯮"
              :end_export    "⯬"
              :properties    "⚙"
              :end           "∎"
              :priority_a   ,(propertize "⚑" 'face 'all-the-icons-red)
              :priority_b   ,(propertize "⬆" 'face 'all-the-icons-orange)
              :priority_c   ,(propertize "■" 'face 'all-the-icons-yellow)))
  (set-ligatures! 'org-mode
    :merge t
    :checkbox      "[ ]"
    :pending       "[-]"
    :checkedbox    "[X]"
    :list_property "::"
    :em_dash       "---"
    :ellipsis      "..."
    :title         "#+TITLE:"
    :subtitle      "#+SUBTITLE:"
    :author        "#+AUTHOR:"
    :date          "#+DATE:"
    :property      "#+PROPERTY:"
    :options       "#+OPTIONS:"
    :startup       "#+STARTUP:"
    :latex_class   "#+LATEX_CLASS:"
    :latex_header  "#+LATEX_HEADER:"
    :beamer_header "#+BEAMER_HEADER:"
    :attr_latex    "#+ATTR_LATEX:"
    :attr_html     "#+ATTR_LATEX:"
    :begin_quote   "#+BEGIN_QUOTE"
    :end_quote     "#+END_QUOTE"
    :caption       "#+CAPTION:"
    :header        "#+HEADER:"
    :begin_export  "#+BEGIN_EXPORT"
    :end_export    "#+END_EXPORT"
    :results       "#+RESULTS:"
    :property      ":PROPERTIES:"
    :end           ":END:"
    :priority_a    "[#A]"
    :priority_b    "[#B]"
    :priority_c    "[#C]"))
(plist-put +ligatures-extra-symbols :name "⁍")

(setq writeroom-fullscreen-effect 'fullboth)

(add-hook 'dired-mode-hook 'dired-hide-details-mode)

(defun +toggle/opacity ()
  (interactive)
  (doom/set-frame-opacity 90))

(defun +org-ctrl-c-ret ()
  (interactive)
  (org-ctrl-c-ret)
  (evil-insert-state))

(defun org-latex-preview-buffer ()
  (interactive)
  (org-latex-preview '(16)))

(defun flyspell-lazy-mode-disable ()
  "Disable `flyspell-lazy-mode'."
  (flyspell-lazy-mode -1))

(defun +evil/insert (arg)
  (if evil-insert-state-minor-mode
      (insert arg)
    (evil-insert-state)
    (insert arg)
    (evil-normal-state)))

(defun +LaTeX/new-item ()
  (interactive)
  (evil-open-below 1)
  (insert "\\item "))

(defun +writeroom-mode ()
  (interactive)
  (doom/window-maximize-buffer)
  (writeroom-mode 'toggle))

(defun evil-comment-dwim (&rest test)
  "Same behavior as comment-dwim but switches to insert state
   when adding a comment."
  (interactive)
  (call-interactively 'comment-dwim)
  (unless (region-active-p)
    (evil-insert-state)))

(defun copy-current-line-position-to-clipboard ()
  "Copy current line in file to clipboard as '</path/to/file>:<line-number>'."
  (interactive)
  (let ((path-with-line-number
         (concat buffer-file-truename ":"
                 (if (use-region-p) "test" (number-to-string (line-number-at-pos)))))) ;TODO implement true case
    (kill-new path-with-line-number)
    (message (concat path-with-line-number " copied to clipboard"))))

(defun split-switch-right ()
  (interactive)
  (split-window-right)
  (windmove-right))

(defun split-switch-below ()
  (interactive)
  (split-window-below)
  (windmove-down))

(defun +shell/prompt-for-cwd (dir)
  "Prompt for directory and cd to it."
  (interactive "Dcd ")
  (insert (concat "cd " dir))
  (comint-send-input))

(defun +shell/open-cwd-dired ()
  (interactive)
  (dired-other-window default-directory))

(defun +shell/up-directory ()
  (interactive)
  (insert "cd ..")
  (comint-send-input))

(defun +shell/last-directory ()
  (interactive)
  (insert "cd -")
  (comint-send-input))

(defun +shell/new ()
  (interactive)
  (if (featurep! :ui workspaces)
      (+workspace-switch "*shell*" t))
  (shell)
  (delete-other-windows)
  (doom/set-frame-opacity 95)
  (evil-insert-state))

(defun +shell/other-frame ()
  "Open a shell in a new frame."
  (interactive)
  (select-frame (make-frame))
  (if (featurep! :ui workspaces)
      (+workspace-switch "*shell*" t))
  (shell)
  (delete-other-windows)
  (evil-insert-state))

(defun +shell/insert-envvar (envvar-name)
  "Insert ENVVAR-NAME into the current buffer at point."
  (interactive
   (list (read-envvar-name "Name of environment variable: " t)))
  (+evil/insert (concat "$" envvar-name)))

(defun +shell/insert-directory (dir)
  "Prompt for directory and cd to it."
  (interactive "D")
  ;; (+evil/insert (format "\"%s\"" dir))
  (+evil/insert dir))

(defun +lsp-toggle-focus ()
  (interactive)
  (if lsp-ui-doc-frame-mode
      (lsp-ui-doc-unfocus-frame)
    (lsp-ui-doc-focus-frame)))

(load! "+bindings")
