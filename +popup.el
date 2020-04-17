;;; ~/.doom.d/+popup.el -*- lexical-binding: t; -*-

(set-popup-rule! "^\\*Customize.*" :slot 2 :side 'right :modeline nil :select t :quit t)
(set-popup-rule! " \\*undo-tree\\*" :slot 2 :side 'left :size 20 :modeline nil :select t :quit t)
(set-popup-rule! "^\\*Password-Store" :ignore t :modeline t)

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


(set-popup-rule! "\\*VC-history\\*" :slot 2 :side 'right :size 82 :modeline nil :select t :quit t)

;; * web
(set-popup-rule! "^\\*eww.*" :size 82 :side 'right :ttl nil :select t)
(set-popup-rule! "\\*xwidget" :side 'right :size 100 :select t)


;; * lang
;; ** python
;; (set-popup-rule! "^\\*Anaconda\\*" :side 'right :size 82 :quit t :ttl t)
;; ;; ** R
;; (after! ess-r-mode
;;   (set-popup-rule! "^\\*R:.*\\*" :side 'bottom :slot -1 :height 0.6 :width 0.5 :select nil :quit nil :ttl nil))
;; (after! ess-help
;;   (set-popup-rule! "^\\*help.R.*" :slot 2 :side 'right :size 80 :height 0.4 :select t :quit t :transient t))

;; (after! org
;;   (set-popup-rule! "^\\*Org Src" :side 'bottom :slot -2 :height 0.6 :width 0.5 :select t :autosave t :ttl nil :quit nil :select t))
