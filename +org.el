;;; ~/.doom.d/+org.el -*- lexical-binding: t; -*-


;; Org
(setq org-agenda-include-diary t)
;; Recording work time with org-mode
(setq org-clock-persist 'history)


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
      '(("t" "todo" entry (file "~/org/refile.org")
         "* TODO %?\n%U\n%a\n" :clock-in t :clock-resume t)
        ("r" "respond" entry (file "~/org/refile.org")
         "* NEXT Respond to %:from on %:subject\nSCHEDULED: %t\n%U\n%a\n" :clock-in t :clock-resume t :immediate-finish t)
        ("n" "note" entry (file "~/org/refile.org")
         "* %? :NOTE:\n%U\n%a\n" :clock-in t :clock-resume t)
        ("j" "Journal" entry (file+datetree "~/org/diary.org")
         "* %?\n%U\n" :clock-in t :clock-resume t)
        ("w" "org-protocol" entry (file "~/org/refile.org")
         "* TODO Review %c\n%U\n" :immediate-finish t)
        ("m" "Meeting" entry (file "~/org/refile.org")
         "* MEETING with %? :MEETING:\n%U" :clock-in t :clock-resume t)
        ("p" "Phone call" entry (file "~/org/refile.org")
         "* PHONE %? :PHONE:\n%U" :clock-in t :clock-resume t)
        ("h" "Habit" entry (file "~/org/refile.org")
         "* NEXT %?\n%U\n%a\nSCHEDULED: %(format-time-string \"%<<%Y-%m-%d %a .+1d/3d>>\")\n:PROPERTIES:\n:STYLE: habit\n:REPEAT_TO_STATE: NEXT\n:END:\n")))

;; (defun +org/clock-remove-empty-clock-drawer nil
;;   "Remove empty clock drawer in the current subtree."
;;   (let* ((olid (or (org-entry-get (point) "LOG_INTO_DRAWER")
;;                    org-log-into-drawer))
;;          (clock-drawer (if (eq t olid) "LOGBOOK" olid))
;;          (end (save-excursion (org-end-of-subtree t t))))
;;     (when clock-drawer
;;       (save-excursion
;;         (org-back-to-heading t)
;;         (while (search-forward clock-drawer end t)
;;           (goto-char (match-beginning 0))
;;           (org-remove-empty-drawer-at clock-drawer (point))
;;           (forward-line 1))))))

;; Remove empty LOGBOOK drawers on clock out
(defun +org/remove-empty-drawer-on-clock-out ()
  (interactive)
  (save-excursion
    (beginning-of-line 0)
    (org-remove-empty-drawer-at "LOGBOOK" (point))))

;; (add-hook 'org-clock-out-hook '+org/clock-remove-empty-clock-drawer)
(add-hook 'org-clock-out-hook '+org/remove-empty-drawer-on-clock-out)

                                        ; Exclude DONE state tasks from refile targets
(defun +org/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function '+org/verify-refile-target)

(setq org-agenda-custom-commands
      '(("n" "Agenda and all TODOs"
         ((agenda "")
          (alltodo "")))
        ("N" "Notes" tags "NOTE"
         ((org-agenda-overriding-header "Notes")
          (org-tags-match-list-sublevels t)))
        ("h" "Habits" tags-todo "STYLE=\"habit\""
         ((org-agenda-overriding-header "Habits")
          (org-agenda-sorting-strategy
           '(todo-state-down effort-up category-keep))))
        ;; ("A" "Agenda"
        ;;  ((agenda "" nil)
        ;;   (tags "REFILE"
        ;;         ((org-agenda-overriding-header "Tasks to Refile")
        ;;          (org-tags-match-list-sublevels nil)))
        ;;   (tags-todo "-KILL/!"
        ;;              ((org-agenda-overriding-header "Stuck Projects")
        ;;               (org-agenda-skip-function 'bh/skip-non-stuck-projects)
        ;;               (org-agenda-sorting-strategy
        ;;                '(category-keep))))
        ;;   (tags-todo "-HOLD-KILL/!"
        ;;              ((org-agenda-overriding-header "Projects")
        ;;               (org-agenda-skip-function 'bh/skip-non-projects)
        ;;               (org-tags-match-list-sublevels 'indented)
        ;;               (org-agenda-sorting-strategy
        ;;                '(category-keep))))
        ;;   (tags-todo "-KILL/!NEXT"
        ;;              ((org-agenda-overriding-header (concat "Project Next Tasks"
        ;;                                                     (if bh/hide-scheduled-and-waiting-next-tasks
        ;;                                                         ""
        ;;                                                       " (including WAITING and SCHEDULED tasks)")))
        ;;               (org-agenda-skip-function 'bh/skip-projects-and-habits-and-single-tasks)
        ;;               (org-tags-match-list-sublevels t)
        ;;               (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
        ;;               (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
        ;;               (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
        ;;               (org-agenda-sorting-strategy
        ;;                '(todo-state-down effort-up category-keep))))
        ;;   (tags-todo "-REFILE-KILL-WAIT-HOLD/!"
        ;;              ((org-agenda-overriding-header (concat "Project Subtasks"
        ;;                                                     (if bh/hide-scheduled-and-waiting-next-tasks
        ;;                                                         ""
        ;;                                                       " (including WAITING and SCHEDULED tasks)")))
        ;;               (org-agenda-skip-function 'bh/skip-non-project-tasks)
        ;;               (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
        ;;               (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
        ;;               (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
        ;;               (org-agenda-sorting-strategy
        ;;                '(category-keep))))
        ;;   (tags-todo "-REFILE-KILL-WAIT-HOLD/!"
        ;;              ((org-agenda-overriding-header (concat "Standalone Tasks"
        ;;                                                     (if bh/hide-scheduled-and-waiting-next-tasks
        ;;                                                         ""
        ;;                                                       " (including WAITING and SCHEDULED tasks)")))
        ;;               (org-agenda-skip-function 'bh/skip-project-tasks)
        ;;               (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
        ;;               (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)
        ;;               (org-agenda-todo-ignore-with-date bh/hide-scheduled-and-waiting-next-tasks)
        ;;               (org-agenda-sorting-strategy
        ;;                '(category-keep))))
        ;;   (tags-todo "-KILL+WAIT|HOLD/!"
        ;;              ((org-agenda-overriding-header (concat "Waiting and Postponed Tasks"
        ;;                                                     (if bh/hide-scheduled-and-waiting-next-tasks
        ;;                                                         ""
        ;;                                                       " (including WAITING and SCHEDULED tasks)")))
        ;;               (org-agenda-skip-function 'bh/skip-non-tasks)
        ;;               (org-tags-match-list-sublevels nil)
        ;;               (org-agenda-todo-ignore-scheduled bh/hide-scheduled-and-waiting-next-tasks)
        ;;               (org-agenda-todo-ignore-deadlines bh/hide-scheduled-and-waiting-next-tasks)))
        ;;   (tags "-REFILE/"
        ;;         ((org-agenda-overriding-header "Tasks to Archive")
        ;;          (org-agenda-skip-function 'bh/skip-non-archivable-tasks)
        ;;          (org-tags-match-list-sublevels nil))))
         ;; nil)))
))
