;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

(package! academic-phrases)       ;Should be handled by yasnippets

(package! buffer-move)

(package! doct)                         ;Declarative org capture templates

(package! dired-subtree)

(package! org-super-agenda)

(package! cdlatex)

(package! org-msg
  :recipe (:host github
           :repo "jeremy-compostella/org-msg"))

(package! mixed-pitch
  :recipe (:host gitlab :repo "jabranham/mixed-pitch"))

(package! org-pretty-tags
  :recipe (:host gitlab :repo "marcowahl/org-pretty-tags"))

;; (package! org-pretty-table
;;   :recipe (:host github :repo "Fuco1/org-pretty-table")) ;Needs some more work

(package! selectric-mode)

(package! flycheck-rust)


(package! latex-extra)

(package! yasnippet-snippets)
