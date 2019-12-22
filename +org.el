;;; ~/.doom.d/+org.el -*- lexical-binding: t; -*-

(defvar org-drill-directory "~/org/org-drill")

;; Org
(setq org-agenda-include-diary t)
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
      '(("t" "Todo" entry (file "~/org/agenda/refile.org")
         "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
        ("T" "[ ]" entry (file "~/org/agenda/refile.org")
         "* [ ] %? \n%U\n%a\n" :clock-in t :clock-resume t)
        ("r" "Respond" entry (file "~/org/agenda/refile.org")
         "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
        ("n" "Note" entry (file "~/org/agenda/refile.org")
         "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
        ("i" "Issue" entry (file "~/org/agenda/issues.org")
         "* [ ] %? :ONLINE:\n%U\n%a\n" :clock-in t :clock-resume t)
        ("j" "Journal" entry (file+datetree "~/org/diary.org")
         "* %?\n%U\n" :clock-in t :clock-resume t)
        ("w" "org-protocol" entry (file "~/org/agenda/refile.org")
         "* TODO Review %c\n%U\n" :immediate-finish t)
        ("m" "Meeting" entry (file "~/org/agenda/refile.org")
         "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
        ("p" "Phone call" entry (file "~/org/agenda/refile.org")
         "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
        ("v" "Vocabulary" entry (file "~/org/agenda/refile.org")
         "* %?")
        ("h" "Habit" entry (file "~/org/agenda/refile.org")
         "* NEXT %?\n%U\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:REPEAT_TO_STATE: NEXT\n:END:\n")))

;; (setq org-refile-targets
;;       ((nil :maxlevel . 3)
;;        (org-agenda-files :maxlevel . 3)
;;        ((list "~/org/org-drill/german.org" "~/org/org-drill/english.org" "~/org/org-drill/spanisch.org") :maxlevel . 1)))
                                        ; Exclude DONE state tasks from refile targets
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
        ;; nil)))
        ))
