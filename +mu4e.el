;;; ~/.doom.d/mu4e-config.el -*- lexical-binding: t; -*-

;; Mail
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
;; (add-hook 'mu4e-main-mode-hook (lambda () (setq flyspell-dash-local-dictionary "deutsch8")))

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
;; (add-hook 'mu4e-view-mode-hook 'mixed-pitch-mode)
(add-hook 'mu4e-main-mode-hook 'hide-mode-line-mode)
(add-hook 'mu4e-loading-mode-hook 'hide-mode-line-mode)
(add-hook 'mu4e~update-mail-mode-hook 'hide-mode-line-mode)
(add-hook 'mu4e-compose-mode-hook 'hide-mode-line-mode)
(add-hook 'mu4e-headers-mode-hook 'hide-mode-line-mode)
(add-hook 'mu4e-view-mode-hook 'hide-mode-line-mode)

(after! mu4e
    (defun my/mu4e-buffer-p (buf)
    (with-current-buffer buf
      (derived-mode-p 'mu4e-main-mode 'mu4e-headers-mode 'gnus-article-mode 'mu4e-compose-mode)))
  (add-to-list 'doom-real-buffer-functions #'my/mu4e-buffer-p))

(remove-hook 'mu4e-compose-mode-hook #'org-mu4e-compose-org-mode)
