;; -*- no-byte-compile: t; -*-
;;; ~/.doom.d/packages.el

;; * Writing
(package! academic-phrases)       ;Should be handled by yasnippets

;; * Editor
;; (package! counsel-term
;;   :recipe (:host github
;;            :repo "tautologyclub/counsel-term"))

;; * Snippets
(package! yasnippet-snippets)

;; * UI
(package! buffer-move)
;; (package! golden-ratio) ;;Nice idea but needs some work

;; (package! org-drill)

(package! org-fancy-priorities
  :recipe (:host github
           :repo "harrybournis/org-fancy-priorities"))

(package! org-super-agenda)

;; (package! org-msg
;;   :recipe (:host github
;;            :repo "jeremy-compostella/org-msg"))
