;; -*- no-byte-compile: t; -*-

;; [[file:/tmp/config.org.XeSs1F::*General packages][General packages:1]]
(package! academic-phrases)

(package! smart-hungry-delete)

(package! auto-dictionary-mode
  :recipe (:host github :repo "nschum/auto-dictionary-mode"))

(package! mixed-pitch
  :recipe (:host gitlab :repo "jabranham/mixed-pitch"))

(package! yasnippet-snippets)

(package! ivy-avy)

(package! frames-only-mode)
;; General packages:1 ends here

;; [[file:/tmp/config.org.XeSs1F::*Latex][Latex:1]]
(package! latex-extra)
;; Latex:1 ends here

;; [[file:/tmp/config.org.XeSs1F::*Org packages][Org packages:1]]
;; (package! org-pandoc-import
;;   :recipe (:host github :repo "tecosaur/org-pandoc-import"))

(package! doct)                         ;Declarative org capture templates
(package! org-super-agenda)
(package! org-pretty-tags
  :recipe (:host gitlab :repo "marcowahl/org-pretty-tags"))
(package! org-pretty-table
  :recipe (:host github :repo "Fuco1/org-pretty-table"))
(package! org-graph-view :recipe (:host github :repo "alphapapa/org-graph-view") :pin "13314338d7...")
(package! org-msg :disable t)
;; Org packages:1 ends here

;; [[file:/tmp/config.org.XeSs1F::*Dired][Dired:1]]
(package! dired-subtree)
(package! dired-narrow)
(package! dired-collapse)
;; Dired:1 ends here

;; [[file:/tmp/config.org.XeSs1F::*Authinfo][Authinfo:1]]
;; (package! authinfo-mode)
;; Authinfo:1 ends here

;; [[file:/tmp/config.org.XeSs1F::*Shell][Shell:1]]
(package! shx)
;; Shell:1 ends here
