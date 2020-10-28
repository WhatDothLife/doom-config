;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

(package! academic-phrases)       ;Should be handled by yasnippets

(package! buffer-move)

(package! doct)                         ;Declarative org capture templates

(package! dired-subtree)
(package! dired-narrow)
(package! dired-collapse)
;; (package! dired-filter)

(package! focus)

;; (package! drag-stuff)

(package! org-super-agenda)

(package! cdlatex)

(package! org-rich-yank)

(package! LaTeX-auto-activating-snippets
  :recipe (:host github :repo "tecosaur/LaTeX-auto-activating-snippets"))

(package! mixed-pitch
  :recipe (:host gitlab :repo "jabranham/mixed-pitch"))

(package! org-pretty-tags
  :recipe (:host gitlab :repo "marcowahl/org-pretty-tags"))

(package! org-pretty-table
  :recipe (:host github :repo "Fuco1/org-pretty-table"))

(package! org-fragtog)

(package! org-graph-view :recipe (:host github :repo "alphapapa/org-graph-view") :pin "13314338d7...")

(package! flycheck-rust)

(package! latex-extra)

(package! yasnippet-snippets)

;; (package! centaur-tabs)


(package! ivy-avy)

(package! zoom)

(package! theme-magic :pin "844c4311bd...")
