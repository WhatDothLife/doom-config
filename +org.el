;;; ~/.doom.d/+org.el -*- lexical-binding: t; -*-

;;(defvar org-drill-directory "~/org/org-drill")

(require 'org-super-agenda)

(org-super-agenda-mode t)

(setq org-agenda-include-diary t)
(setq diary-file "~/org/diary.org")
;; Recording work time with org-mode
(setq org-clock-persist 'history)
(setq org-agenda-files '("~/org/agenda"))

; The following code snippets were copied from "organize your life in plain text"
(setq org-todo-state-tags-triggers
      '(("KILL" ("KILL" . t))
        ("WAIT" ("WAIT" . t))
        ("HOLD" ("WAIT") ("HOLD" . t))
        ("TODO" ("WAIT") ("KILL") ("HOLD"))
        ("NEXT" ("WAIT") ("KILL") ("HOLD"))
        ("DONE" ("WAIT") ("KILL") ("HOLD"))))

;; Capture templates for: TODO tasks, Notes, appointments, phone calls, meetings, and org-protocol
(setq org-capture-templates
      '(("t" "todo" entry (file+headline "~/org/agenda/refile.org" "Refile")
         "* TODO %?\n%U\n%a\n")
        ("T" "[ ]" entry (file+headline "~/org/agenda/refile.org" "Refile")
         "* [ ] %? \n%U\n%a\n")
        ;; ("r" "Respond" entry (file "~/org/agenda/refile.org")
        ;;  "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :immediate-finish t)
        ("n" "Note" entry (file+headline "~/org/agenda/todo.org" "Notes")
         "* %? :NOTE:\n%U\n%a\n")
        ("i" "Issue" entry (file+headline "~/org/agenda/hacking.org" "Issues")
         "* [ ] %? :ONLINE:\n%U\n%a\n")
        ("j" "Journal" entry (file+datetree "~/org/diary.org")
         "* %?\n%U\n")
        ;; ("w" "org-protocol" entry (file "~/org/agenda/refile.org")
        ;;  "* TODO Review %c\n%U\n" :immediate-finish t)
        ;; ("m" "Meeting" entry (file "~/org/agenda/refile.org")
        ;;  "* MEETING with %? :MEETING:\n%U")
        ;; ("p" "Phone call" entry (file "~/org/agenda/refile.org")
        ;;  "* %? :PHONE:\n%U")
        ;; ("v" "Vocabulary" entry (file "~/org/agenda/refile.org")
        ;;  "* %?")
        ("e" "Event" entry (file+headline "~/org/agenda/todo.org" "Events")
         "* %? :EVENT:\n%U" :empty-lines 1)))
        ;; ("h" "Habit" entry (file "~/org/agenda/refile.org")
        ;;  "* NEXT %?\n%U\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:REPEAT_TO_STATE: NEXT\n:END:\n")))

(setq org-refile-targets
      '((nil :maxlevel . 3)
        (org-agenda-files :maxlevel . 3)
        ;; ("~/org/org-drill/german.org" :maxlevel . 1)
        ;; ("~/org/org-drill/english.org" :maxlevel . 1)
        ;; ("~/org/org-drill/spanisch.org" :maxlevel . 1)
        ("~/org/notes.org" :maxlevel . 1)
        ("~/org/someday.org" :level . 1)
        ("~/org/writing.org" :maxlevel . 1)
        ))

(defun +org/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function '+org/verify-refile-target)

(setq org-agenda-custom-commands
      '(("h" "Habits" tags-todo "STYLE=\"habit\""
         ((org-agenda-overriding-header "Habits")
          (org-agenda-sorting-strategy
           '(todo-state-down effort-up category-keep))))
        ("n" "Agenda and all TODOs"
         ((agenda "")
          (alltodo "")))
        ("N" "Notes" tags "NOTE"
         ((org-agenda-overriding-header "Notes")
          (org-tags-match-list-sublevels t)))
        ("o" "Online" tags "ONLINE"
         ((org-agenda-skip-function '(org-agenda-skip-entry-if 'todo 'done))
          (org-agenda-overriding-header "Things to do when online:")
          (org-agenda-sorting-strategy
           '(todo-state-down effort-up category-keep))))
        ))

(setq org-bullets-bullet-list '("◉" "○" "✸"))
(setq org-fancy-priorities-list '("◆" "◆" "◆" "◆"))

(add-hook 'org-mode-hook  #'org-fancy-priorities-mode)

(setq org-super-agenda-groups
       '(;; Each group has an implicit boolean OR operator between its selectors.
         (:name "Today"  ; Optionally specify section name
                :time-grid t)  ; Items that appear on the time grid
         (:name "Important"
                ;; Single arguments given alone
                :tag "bills"
                :priority "A")
         (:name "Daily"
                :tag ":daily:")
         ;; Set order of multiple groups at once
         ;; (:order-multi (2 (:name "Shopping in town"
         ;;                         ;; Boolean AND group matches items that match all subgroups
         ;;                         :and (:tag "shopping" :tag "@town"))
         ;;                  (:name "Food-related"
         ;;                         ;; Multiple args given in list with implicit OR
         ;;                         :tag ("food" "dinner"))
         ;;                  (:name "Personal"
         ;;                         :habit t
         ;;                         :tag "personal")
         ;;                  (:name "Space-related (non-moon-or-planet-related)"
         ;;                         ;; Regexps match case-insensitively on the entire entry
         ;;                         :and (:regexp ("space" "NASA")
         ;;                                       ;; Boolean NOT also has implicit OR between selectors
         ;;                                       :not (:regexp "moon" :tag "planet")))))
         ;; Groups supply their own section names when none are given
         (:todo "WAIT" :order 8)  ; Set order of this section
         ;; (:todo ("TO-READ" "CHECK" "TO-WATCH" "WATCHING")
         ;;        ;; Show this group at the end of the agenda (since it has the
         ;;        ;; highest number). If you specified this group last, items
         ;;        ;; with these todo keywords that e.g. have priority A would be
         ;;        ;; displayed in that group instead, because items are grouped
         ;;        ;; out in the order the groups are listed.
         ;;        :order 9)
         (:priority<= "B"
                      ;; Show this section after "Today" and "Important", because
                      ;; their order is unspecified, defaulting to 0. Sections
                      ;; are displayed lowest-number-first.
                      :order 1)
         ;; After the last group, the agenda will display items that didn't
         ;; match any of these groups, with the default order position of 99
         ))

