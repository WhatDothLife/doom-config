;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

(package! academic-phrases)       ;Should be handled by yasnippets

(package! buffer-move)

(package! doct)                         ;Declarative org capture templates

(package! dimmer)

(package! dired-subtree)
(package! dired-narrow)
(package! dired-collapse)
;; (package! dired-filter)

(package! focus)

;; (package! drag-stuff)

(package! org-super-agenda)

(package! cdlatex)

(package! org-rich-yank)

(package! org-msg
  :recipe (:host github
           :repo "jeremy-compostella/org-msg"))

(package! mixed-pitch
  :recipe (:host gitlab :repo "jabranham/mixed-pitch"))

(package! org-pretty-tags
  :recipe (:host gitlab :repo "marcowahl/org-pretty-tags"))

(package! org-pretty-table
  :recipe (:host github :repo "Fuco1/org-pretty-table")) ;Needs some more work

(package! flycheck-rust)

(package! latex-extra)

(package! yasnippet-snippets)

(package! centaur-tabs)

(package! ivy-avy)

(package! zoom)

(package! theme-magic :pin "844c4311bd...")

;; (package! auto-latex-snippets)
