;;; init.el -*- lexical-binding: t; -*-

;; Copy this file to ~/.doom.d/init.el or ~/.config/doom/init.el ('doom
;; quickstart' will do this for you). The `doom!' block below controls what
;; modules are enabled and in what order they will be loaded. Remember to run
;; 'doom refresh' after modifying it.
;;
;; More information about these modules (and what flags they support) can be
;; found in modules/README.org.

(doom! :completion
       company           ; the ultimate code completion backend
       ;;helm            ; the *other* search engine for love and life
       ;;ido             ; the other *other* search engine...
       ivy               ; a search engine for love and life

       :ui
       ;;deft            ; notational velocity for Emacs
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       doom-quit         ; DOOM quit-message prompts when you quit Emacs
       ;;fill-column     ; a `fill-column' indicator
       hl-todo           ; highlight TODO/FIXME/NOTE tags
       ;;indent-guides   ; highlighted indent columns
       modeline          ; snazzy, Atom-inspired modeline, plus API
       nav-flash         ; blink the current line after jumping
       ;;neotree         ; a project drawer, like NERDTree for vim
       ophints           ; highlight the region an operation acts on
       (popup            ; tame sudden yet inevitable temporary windows
        ;;+all           ; catch all popups that start with an asterix
        +defaults)       ; default popup rules
       ;;pretty-code     ; replace bits of code with pretty symbols
       ;;tabbar          ; FIXME an (incomplete) tab bar for Emacs
       treemacs          ; a project drawer, like neotree but cooler
       ;;unicode         ; extended unicode support for various languages
       vc-gutter         ; vcs diff in the fringe
       vi-tilde-fringe   ; fringe tildes to mark beyond EOB
       window-select     ; visually switch windows
       workspaces      ; tab emulation, persistence & separate workspaces

       :editor
       (evil             ; come to the dark side, we have cookies
        +everywhere
        )
       file-templates    ; auto-snippets for empty files
       fold              ; (nigh) universal code folding
       (format
        ;;+onsave        ; automated prettiness
       )
       ;;lispy             ; vim for lisp, for people who dont like vim
       multiple-cursors  ; editing in many places at once
       ;;parinfer          ; turn lisp into python, sort of
       rotate-text       ; cycle region at point between text candidates
       snippets          ; my elves. They type so I don't have to

       :emacs
       (dired            ; making dired pretty [functional]
       ;;+ranger          ; bringing the goodness of ranger to dired
       ;;+icons          ; colorful icons for dired-mode
        )
       electric          ; smarter, keyword-based electric-indent
       ;;eshell            ; a consistent, cross-platform shell (WIP)
       ;;imenu             ; an imenu sidebar and searchable code index
       term              ; terminals in Emacs
       vc                ; version-control and Emacs, sitting in a tree

       :tools
       ;;ansible
       ;;debugger          ; FIXME stepping through code, to help you add bugs
       ;;direnv
       ;;docker
       editorconfig      ; let someone else argue about tabs vs spaces
       ;;ein               ; tame Jupyter notebooks with emacs
       eval              ; run code, run (also, repls)
       flycheck          ; tasing you for every semicolon you forget
       flyspell          ; tasing you for misspelling mispelling
       ;;gist              ; interacting with github gists
       (lookup           ; helps you navigate your code and documentation
        +docsets)        ; ...or in Dash docsets locally
       ;;lsp
       ;;macos             ; MacOS-specific commands
       magit             ; a git porcelain for Emacs
       make              ; run make tasks from Emacs
       password-store    ; password manager for nerds
       pdf               ; pdf enhancements
       ;;prodigy           ; FIXME managing external services & code builders
       ;;rgb               ; creating color strings
       ;;terraform         ; infrastructure as code
       ;;tmux              ; an API for interacting with tmux
       ;;upload            ; map local to remote projects via ssh/ftp
       ;;wakatime
       ;;vterm             ; another terminals in Emacs

       :lang
       ;;agda              ; types of types of types of types...
       ;;assembly          ; assembly for fun or debugging
       cc                  ; C/C++/Obj-C madness
       ;;clojure           ; java with a lisp
       ;;common-lisp       ; if you've seen one lisp, you've seen them all
       ;;coq               ; proofs-as-programs
       ;;crystal           ; ruby at the speed of c
       ;;csharp            ; unity, .NET, and mono shenanigans
       data                ; config/data formats
       ;;erlang            ; an elegant language for a more civilized age
       ;;elixir            ; erlang done right
       ;;elm               ; care for a cup of TEA?
       emacs-lisp          ; drown in parentheses
       ess               ; emacs speaks statistics
       ;;go                ; the hipster dialect
       ;;(haskell +intero) ; a language that's lazier than I am
       ;;hy                ; readability of scheme w/ speed of python
       ;;idris             ;
       ;;(java +meghanada) ; the poster child for carpal tunnel syndrome
       ;;javascript        ; all(hope(abandon(ye(who(enter(here))))))
       ;;julia             ; a better, faster MATLAB
       ;;kotlin            ; a better, slicker Java(Script)
       ;;latex             ; writing papers in Emacs has never been so fun
       ;;ledger            ; an accounting system in Emacs
       lua               ; one-based indices? one-based indices
       markdown            ; writing docs for people to ignore
       ;;nim               ; python + lisp at the speed of c
       ;;nix               ; I hereby declare "nix geht mehr!"
       ;;ocaml             ; an objective camel
       (org              ; organize your plain life in plain text
        +attach          ; custom attachment system
        +babel           ; running code in org
        +capture         ; org-capture in and outside of Emacs
        +export          ; Exporting org to whatever you want
        +habit           ; Keep track of your habits
        +present         ; Emacs for presentations
        +protocol)       ; Support for org-protocol:// links
       ;;perl              ; write code no one else can comprehend
       ;;php               ; perl's insecure younger brother
       ;;plantuml          ; diagrams for confusing people more
       ;;purescript        ; javascript, but functional
       ;;python            ; beautiful is better than ugly
       ;;qt                ; the 'cutest' gui framework ever
       ;;racket            ; a DSL for DSLs
       ;;rest              ; Emacs as a REST client
       ;;ruby              ; 1.step {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
       ;;rust                ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
       ;;scala             ; java, but good
       sh                  ; she sells (ba|z|fi)sh shells on the C xor
       ;;solidity          ; do you need a blockchain? No.
       ;;swift             ; who asked for emoji variables?
       ;;terra             ; Earth and Moon in alignment for performance.
       ;;web               ; the tubes
       ;;vala              ; GObjective-C

       :email
       (mu4e                 ; WIP
       ;;+gmail
       )
       ;;notmuch             ; WIP
       ;;(wanderlust +gmail) ; WIP

       ;; Applications are complex and opinionated modules that transform Emacs
       ;; toward a specific purpose. They may have additional dependencies and
       ;; should be loaded late.
       :app
       calendar
       ;;irc                 ; how neckbeards socialize
       ;;rss +org          ; emacs as an RSS reader
       ;;twitter           ; twitter client https://twitter.com/vnought
       ;;(write            ; emacs as a word processor (latex + org + markdown)
       ;; +wordnut         ; wordnet (wn) search
       ;; +langtool)       ; a proofreader (grammar/style check) for Emacs

       :collab
       ;;floobits          ; peer programming for a price
       ;;impatient-mode    ; show off code over HTTP

       :config
       ;; For literate config users. This will tangle+compile a config.org
       ;; literate config in your `doom-private-dir' whenever it changes.
       ;;literate

       ;; The default module sets reasonable defaults for Emacs. It also
       ;; provides a Spacemacs-inspired keybinding scheme and a smartparens
       ;; config. Use it as a reference for your own modules.
       (default +bindings +smartparens))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#222224" "#ff5d38" "#98be65" "#bcd42a" "#51afef" "#c678dd" "#46D9FF" "#ede0ce"])
 '(company-backends (quote (company-clang)))
 '(custom-enabled-themes (quote (doom-opera)))
 '(custom-safe-themes
   (quote
    ("e7666261f46e2f4f42fd1f9aa1875bdb81d17cc7a121533cad3e0d724f12faf2" "2d392972cbe692ee4ac61dc79907af65051450caf690a8c4d36eb40c1857ba7d" "728eda145ad16686d4bbb8e50d540563573592013b10c3e2defc493f390f7d83" "70cc30fd9d27a8d0d3ae82974ac2c409fd2cd5746470e2246778c6bec2d4857c" "332e009a832c4d18d92b3a9440671873187ca5b73c2a42fbd4fc67ecf0379b8c" "70ed3a0f434c63206a23012d9cdfbe6c6d4bb4685ad64154f37f3c15c10f3b90" "c8f959fb1ea32ddfc0f50db85fea2e7d86b72bb4d106803018be1c3566fd6c72" "2a3ffb7775b2fe3643b179f2046493891b0d1153e57ec74bbe69580b951699ca" "f951343d4bbe5a90dba0f058de8317ca58a6822faa65d8463b0e751a07ec887c" "7ffb0d3d0c797b980ed7330adc04a66516d49a61e4187a7054dda014676421d9" "b462d00de785490a0b6861807a360f5c1e05b48a159a99786145de7e3cce3afe" "1728dfd9560bff76a7dc6c3f61e9f4d3e6ef9d017a83a841c117bd9bebe18613" "f589e634c9ff738341823a5a58fc200341b440611aaa8e0189df85b44533692b" "0713580a6845e8075113a70275b3421333cfe7079e48228c52300606fa5ce73b" "f30aded97e67a487d30f38a1ac48eddb49fdb06ac01ebeaff39439997cbdd869" "a2286409934b11f2f3b7d89b1eaebb965fd63bc1e0be1c159c02e396afb893c8" "2d1fe7c9007a5b76cea4395b0fc664d0c1cfd34bb4f1860300347cdad67fb2f9" "2878517f049b28342d7a360fd3f4b227086c4be8f8409f32e0f234d129cee925" "f2b83b9388b1a57f6286153130ee704243870d40ae9ec931d0a1798a5a916e76" "b0fd04a1b4b614840073a82a53e88fe2abc3d731462d6fde4e541807825af342" "80365dd15f97396bdc38490390c23337063c8965c4556b8f50937e63b5e9a65c" "43c808b039893c885bdeec885b4f7572141bd9392da7f0bd8d8346e02b2ec8da" "955426466aa729d7d32483d3b2408cf474a1332550ad364848d1dfe9eecc8a16" "256bd513a9875cd855077162cdfee8d75b0ad7e18fe8b8cbc10412561fbef892" "a28d89cf398c60dade1b0a7e3dce9d4691c236c05a050b7e6ba808bfce2622e1" "ab9456aaeab81ba46a815c00930345ada223e1e7c7ab839659b382b52437b9ea" "4e10cdf7d030fb41061cf57c74f6ddfc19db8d4af6c8e0723dc77f9922543a3d" "34c99997eaa73d64b1aaa95caca9f0d64229871c200c5254526d0062f8074693" "f4fff53d17e056ff49fc83b73dfede47674fc650e5fca953797fff1baf42ea19" "84da7b37214b4ac095a55518502dfa82633bee74f64daf6e1785322e77516f96" "4adde75bcf690346a6bad9826e7ef8c633ae224cd5abfaed105b9c9881903c9e" "9954ed41d89d2dcf601c8e7499b6bb2778180bfcaeb7cdfc648078b8e05348c6" "6d589ac0e52375d311afaa745205abb6ccb3b21f6ba037104d71111e7e76a3fc" "fe666e5ac37c2dfcf80074e88b9252c71a22b6f5d2f566df9a7aa4f9bea55ef8" "a3fa4abaf08cc169b61dea8f6df1bbe4123ec1d2afeb01c17e11fdc31fc66379" "fd944f09d4d0c4d4a3c82bd7b3360f17e3ada8adf29f28199d09308ba01cc092" "a8c210aa94c4eae642a34aaf1c5c0552855dfca2153fa6dd23f3031ce19453d4" "d2e9c7e31e574bf38f4b0fb927aaff20c1e5f92f72001102758005e53d77b8c9" "8aca557e9a17174d8f847fb02870cb2bb67f3b6e808e46c0e54a44e3e18e1020" "6b289bab28a7e511f9c54496be647dc60f5bd8f9917c9495978762b99d8c96a0" "93a0885d5f46d2aeac12bf6be1754faa7d5e28b27926b8aa812840fe7d0b7983" "75d3dde259ce79660bac8e9e237b55674b910b470f313cdf4b019230d01a982a" "10461a3c8ca61c52dfbbdedd974319b7f7fd720b091996481c8fb1dded6c6116" "f0dc4ddca147f3c7b1c7397141b888562a48d9888f1595d69572db73be99a024" "0cec079df2ee361e0bd0b472f422495a0d0692a8fa18af4f7a13501372ae9043" "6b2636879127bf6124ce541b1b2824800afc49c6ccd65439d6eb987dbf200c36" "47703cf365d837111dad18176f5b0ef99d0deae1c13379e98301f62388137b0c" "151bde695af0b0e69c3846500f58d9a0ca8cb2d447da68d7fbf4154dcf818ebc" default)))
 '(doom-big-font-mode nil)
 '(evil-emacs-state-modes
   (quote
    (5x5-mode archive-mode bbdb-mode biblio-selection-mode blackbox-mode bookmark-edit-annotation-mode browse-kill-ring-mode bubbles-mode bzr-annotate-mode calc-mode cfw:calendar-mode completion-list-mode debugger-mode delicious-search-mode desktop-menu-blist-mode desktop-menu-mode dun-mode dvc-bookmarks-mode dvc-diff-mode dvc-info-buffer-mode dvc-log-buffer-mode dvc-revlist-mode dvc-revlog-mode dvc-status-mode dvc-tips-mode ediff-mode ediff-meta-mode efs-mode Electric-buffer-menu-mode emms-browser-mode emms-mark-mode emms-metaplaylist-mode emms-playlist-mode ess-help-mode etags-select-mode fj-mode gc-issues-mode gdb-breakpoints-mode gdb-disassembly-mode gdb-frames-mode gdb-locals-mode gdb-memory-mode gdb-registers-mode gdb-threads-mode gist-list-mode gnus-article-mode gnus-browse-mode gnus-group-mode gnus-server-mode gnus-summary-mode gomoku-mode google-maps-static-mode jde-javadoc-checker-report-mode magit-popup-mode magit-popup-sequence-mode magit-branch-manager-mode magit-commit-mode magit-key-mode magit-rebase-mode magit-wazzup-mode mh-folder-mode monky-mode mpuz-mode notmuch-hello-mode notmuch-search-mode notmuch-show-mode notmuch-tree-mode occur-mode package-menu-mode proced-mode rebase-mode recentf-dialog-mode reftex-select-bib-mode reftex-select-label-mode reftex-toc-mode sldb-mode slime-inspector-mode slime-thread-control-mode slime-xref-mode snake-mode solitaire-mode sr-buttons-mode sr-mode sr-tree-mode sr-virtual-mode tar-mode tetris-mode tla-annotate-mode tla-archive-list-mode tla-bconfig-mode tla-bookmarks-mode tla-branch-list-mode tla-browse-mode tla-category-list-mode tla-changelog-mode tla-follow-symlinks-mode tla-inventory-file-mode tla-inventory-mode tla-lint-mode tla-logs-mode tla-revision-list-mode tla-revlog-mode tla-tree-lint-mode tla-version-list-mode twittering-mode urlview-mode vc-annotate-mode vc-dir-mode vc-hg-log-view-mode vc-svn-log-view-mode vm-mode vm-summary-mode w3m-mode wab-compilation-mode xgit-annotate-mode xgit-changelog-mode xgit-diff-mode xgit-revlog-mode xhg-annotate-mode xhg-log-mode xhg-mode xhg-mq-mode xhg-mq-sub-mode xhg-status-extra-mode)))
 '(fci-rule-color "#5B6268")
 '(flycheck-disabled-checkers nil)
 '(flycheck-gcc-include-path nil)
 '(jdee-db-active-breakpoint-face-colors (cons "#2b2a27" "#ff5d38"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#2b2a27" "#98be65"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#2b2a27" "#3f444a"))
 '(line-number-mode nil)
 '(objed-cursor-color "#ff5d38")
 '(package-selected-packages
   (quote
    (ace-window auctex which-key undo-tree exwm async quelpa use-package persistent-soft)))
 '(rcirc-server-alist (quote (("irc.freenode.net"))) t)
 '(send-mail-function (quote smtpmail-send-it))
 '(treemacs-RET-actions-config
   (quote
    ((root-node-open . treemacs-toggle-node)
     (root-node-closed . treemacs-toggle-node)
     (dir-node-closed . treemacs-toggle-node)
     (file-node-open . treemacs-visit-node-default)
     (file-node-closed . treemacs-visit-node-default)
     (tag-node-open . treemacs-toggle-node-prefer-tag-visit)
     (tag-node-closed . treemacs-toggle-node-prefer-tag-visit)
     (tag-node . treemacs-visit-node-default))))
 '(vc-annotate-background "#2b2a27")
 '(vc-annotate-color-map
   (list
    (cons 20 "#98be65")
    (cons 40 "#a4c551")
    (cons 60 "#b0cc3d")
    (cons 80 "#bcd42a")
    (cons 100 "#c1a623")
    (cons 120 "#c5781c")
    (cons 140 "#cb4b16")
    (cons 160 "#c95a58")
    (cons 180 "#c7699a")
    (cons 200 "#c678dd")
    (cons 220 "#d96fa6")
    (cons 240 "#ec666f")
    (cons 260 "#ff5d38")
    (cons 280 "#cf563c")
    (cons 300 "#9f5041")
    (cons 320 "#6f4a45")
    (cons 340 "#5B6268")
    (cons 360 "#5B6268")))
 '(vc-annotate-very-old-color nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
