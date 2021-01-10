;;; ~/.doom.d/+org.el -*- lexical-binding: t; -*-

(require 'org-super-agenda)

(defun +mixed-pitch-fix-org ()
  (interactive)
  (require 'mixed-pitch)
  (make-local-variable 'mixed-pitch-fixed-pitch-faces)
  (add-to-list 'mixed-pitch-fixed-pitch-faces 'org-link)
  (add-to-list 'mixed-pitch-fixed-pitch-faces 'error)
  (mixed-pitch-mode))

(add-hook! org-mode (display-line-numbers-mode -1))
(after! evil-surround
 (add-hook 'org-mode-hook (lambda ()
                            (push '(?$ . ("$" . "$")) evil-surround-pairs-alist))))

(after! org
  (use-package org-pretty-tags
    :config
    (setq org-pretty-tags-surrogate-strings
          `(("uni"        . ,(all-the-icons-faicon   "graduation-cap"  :face 'all-the-icons-purple  :v-adjust 0.01))
            ("ucc"        . ,(all-the-icons-material "computer"        :face 'all-the-icons-silver  :v-adjust 0.01))
            ("assignment" . ,(all-the-icons-material "library_books"   :face 'all-the-icons-orange  :v-adjust 0.01))
            ("test"       . ,(all-the-icons-material "timer"           :face 'all-the-icons-red     :v-adjust 0.01))
            ("lecture"    . ,(all-the-icons-fileicon "keynote"         :face 'all-the-icons-orange  :v-adjust 0.01))
            ("@mail"      . ,(all-the-icons-faicon   "envelope"        :face 'all-the-icons-blue    :v-adjust 0.01))
            ("read"       . ,(all-the-icons-octicon  "book"            :face 'all-the-icons-lblue   :v-adjust 0.01))
            ("article"    . ,(all-the-icons-octicon  "file-text"       :face 'all-the-icons-yellow  :v-adjust 0.01))
            ("@web"       . ,(all-the-icons-faicon   "globe"           :face 'all-the-icons-green   :v-adjust 0.01))
            ("info"       . ,(all-the-icons-faicon   "info-circle"     :face 'all-the-icons-blue    :v-adjust 0.01))
            ("issue"      . ,(all-the-icons-faicon   "bug"             :face 'all-the-icons-red     :v-adjust 0.01))
            ("someday"    . ,(all-the-icons-faicon   "calendar-o"      :face 'all-the-icons-cyan    :v-adjust 0.01))
            ("idea"       . ,(all-the-icons-faicon   "lightbulb-o"     :face 'all-the-icons-yellow  :v-adjust 0.01))
            ("question"   . ,(all-the-icons-faicon   "question-circle" :face 'all-the-icons-yellow  :v-adjust 0.01))
            ("emacs"      . ,(all-the-icons-fileicon "emacs"           :face 'all-the-icons-lpurple :v-adjust 0.01))))
    (org-pretty-tags-global-mode)))

(after! org
  (setq org-ellipsis " ▾ "
        org-priority-highest ?A
        org-priority-lowest ?C
        org-priority-faces
        '((?A . 'all-the-icons-red)
          (?B . 'all-the-icons-orange)
          (?C . 'all-the-icons-yellow))))

;; (plist-put +pretty-code-symbols :up "◆")
;; (plist-put +pretty-code-symbols :down "◆")
;; (plist-put +pretty-code-symbols :almost "◆")

(set-pretty-symbols! 'org-mode 'org-agenda-mode
  :up "[#A]"
  :down "[#B]"
  :almost "[#C]")

(org-super-agenda-mode t)

;; (add-hook! 'org-mode-hook #'+org-pretty-mode) This is awefully slow
(add-hook! 'org-mode-hook #'auto-fill-mode)
(add-hook! 'org-mode-hook #'org-cdlatex-mode)

(setq org-agenda-include-diary t
      org-use-property-inheritance t
      org-log-done 'time
      org-list-allow-alphabetical t
      org-export-in-background t
      org-catch-invisible-edits 'show-and-error
      diary-file "~/org/diary.org"
      org-clock-persist 'history
      org-agenda-files '("~/org/agenda")
      +org-capture-todo-file "agenda/todo.org")

(setq org-agenda-skip-scheduled-if-done t
      org-agenda-skip-deadline-if-done t
      org-agenda-include-deadlines t
      org-agenda-block-separator nil
      org-agenda-tags-column 100
      org-agenda-compact-blocks t)

(after! org
  (setq org-highlight-latex-and-related nil))

(use-package! doct
  :commands (doct))

(after! org-capture
  (defun org-capture-select-template-prettier (&optional keys)
    "Select a capture template, in a prettier way than default
  Lisp programs can force the template by setting KEYS to a string."
    (let ((org-capture-templates
           (or (org-contextualize-keys
                (org-capture-upgrade-templates org-capture-templates)
                org-capture-templates-contexts)
               '(("t" "Task" entry (file+headline "" "Tasks")
                  "* TODO %?\n  %u\n  %a")))))
      (if keys
          (or (assoc keys org-capture-templates)
              (error "No capture template referred to by \"%s\" keys" keys))
        (org-mks org-capture-templates
                 "Select a capture template\n━━━━━━━━━━━━━━━━━━━━━━━━━"
                 "Template key: "
                 `(("q" ,(concat (all-the-icons-octicon "stop" :face 'all-the-icons-red :v-adjust 0.01) "\tAbort")))))))
  (advice-add 'org-capture-select-template :override #'org-capture-select-template-prettier)

  (defun org-mks-pretty (table title &optional prompt specials)
    "Select a member of an alist with multiple keys. Prettified.

  TABLE is the alist which should contain entries where the car is a string.
  There should be two types of entries.

  1. prefix descriptions like (\"a\" \"Description\")
     This indicates that `a' is a prefix key for multi-letter selection, and
     that there are entries following with keys like \"ab\", \"ax\"…

  2. Select-able members must have more than two elements, with the first
     being the string of keys that lead to selecting it, and the second a
     short description string of the item.

  The command will then make a temporary buffer listing all entries
  that can be selected with a single key, and all the single key
  prefixes.  When you press the key for a single-letter entry, it is selected.
  When you press a prefix key, the commands (and maybe further prefixes)
  under this key will be shown and offered for selection.

  TITLE will be placed over the selection in the temporary buffer,
  PROMPT will be used when prompting for a key.  SPECIALS is an
  alist with (\"key\" \"description\") entries.  When one of these
  is selected, only the bare key is returned."
    (save-window-excursion
      (let ((inhibit-quit t)
            (buffer (org-switch-to-buffer-other-window "*Org Select*"))
            (prompt (or prompt "Select: "))
            case-fold-search
            current)
        (unwind-protect
            (catch 'exit
              (while t
                (setq-local evil-normal-state-cursor (list nil))
                (erase-buffer)
                (insert title "\n\n")
                (let ((des-keys nil)
                      (allowed-keys '("\C-g"))
                      (tab-alternatives '("\s" "\t" "\r"))
                      (cursor-type nil))
                  ;; Populate allowed keys and descriptions keys
                  ;; available with CURRENT selector.
                  (let ((re (format "\\`%s\\(.\\)\\'"
                                    (if current (regexp-quote current) "")))
                        (prefix (if current (concat current " ") "")))
                    (dolist (entry table)
                      (pcase entry
                        ;; Description.
                        (`(,(and key (pred (string-match re))) ,desc)
                         (let ((k (match-string 1 key)))
                           (push k des-keys)
                           ;; Keys ending in tab, space or RET are equivalent.
                           (if (member k tab-alternatives)
                               (push "\t" allowed-keys)
                             (push k allowed-keys))
                           (insert (propertize prefix 'face 'font-lock-comment-face) (propertize k 'face 'bold) (propertize "›" 'face 'font-lock-comment-face) "  " desc "…" "\n")))
                        ;; Usable entry.
                        (`(,(and key (pred (string-match re))) ,desc . ,_)
                         (let ((k (match-string 1 key)))
                           (insert (propertize prefix 'face 'font-lock-comment-face) (propertize k 'face 'bold) "   " desc "\n")
                           (push k allowed-keys)))
                        (_ nil))))
                  ;; Insert special entries, if any.
                  (when specials
                    (insert "─────────────────────────\n")
                    (pcase-dolist (`(,key ,description) specials)
                      (insert (format "%s   %s\n" (propertize key 'face '(bold all-the-icons-red)) description))
                      (push key allowed-keys)))
                  ;; Display UI and let user select an entry or
                  ;; a sub-level prefix.
                  (goto-char (point-min))
                  (unless (pos-visible-in-window-p (point-max))
                    (org-fit-window-to-buffer))
                  (let ((pressed (org--mks-read-key allowed-keys prompt)))
                    (setq current (concat current pressed))
                    (cond
                     ((equal pressed "\C-g") (user-error "Abort"))
                     ;; Selection is a prefix: open a new menu.
                     ((member pressed des-keys))
                     ;; Selection matches an association: return it.
                     ((let ((entry (assoc current table)))
                        (and entry (throw 'exit entry))))
                     ;; Selection matches a special entry: return the
                     ;; selection prefix.
                     ((assoc current specials) (throw 'exit current))
                     (t (error "No entry available")))))))
          (when buffer (kill-buffer buffer))))))
  (advice-add 'org-mks :override #'org-mks-pretty)
  (setq +org-capture-uni-units (split-string (f-read-text "~/org/agenda/todo.org")))
  (setq +org-capture-recipies  "~/org/misc.org")
  (add-transient-hook! 'org-capture-select-template
    (setq org-capture-templates
          (doct `((,(format "%s\tPersonal todo" (all-the-icons-octicon "checklist" :face 'all-the-icons-green :v-adjust 0.01))
                   :keys "t"
                   :file +org-capture-todo-file
                   :prepend t
                   :headline "Inbox"
                   :type entry
                   :template ("* TODO %?"
                              "%i %a")
                   )
                  (,(format "%s\tPersonal note" (all-the-icons-faicon "sticky-note-o" :face 'all-the-icons-green :v-adjust 0.01))
                   :keys "n"
                   :file "~/org/notes.org"
                   :prepend t
                   :headline "Notes"
                   :type entry
                   :template ("* %?"
                              "%i %a")
                   )
                  (,(format "%s\tUniversity" (all-the-icons-faicon "graduation-cap" :face 'all-the-icons-purple :v-adjust 0.01))
                   :keys "u"
                   :file +org-capture-todo-file
                   :headline "University"
                   :unit-prompt ,(format "%%^{Unit|%s}" (string-join +org-capture-uni-units "|"))
                   :prepend t
                   :type entry
                   :children ((,(format "%s\tTest" (all-the-icons-material "timer" :face 'all-the-icons-red :v-adjust 0.01))
                               :keys "t"
                               :template ("* TODO [#C] %{unit-prompt} %? :uni:tests:"
                                          "SCHEDULED: %^{Test date:}T"
                                          "%i %a"))
                              (,(format "%s\tAssignment" (all-the-icons-material "library_books" :face 'all-the-icons-orange :v-adjust 0.01))
                               :keys "a"
                               :template ("* TODO [#B] %{unit-prompt} %? :uni:assignments:"
                                          "DEADLINE: %^{Due date:}T"
                                          "%i %a"))
                              (,(format "%s\tLecture" (all-the-icons-fileicon "keynote" :face 'all-the-icons-orange :v-adjust 0.01))
                               :keys "l"
                               :template ("* TODO [#C] %{unit-prompt} %? :uni:lecture:"
                                          "%i %a"))
                              (,(format "%s\tMiscellaneous task" (all-the-icons-faicon "list" :face 'all-the-icons-yellow :v-adjust 0.01))
                               :keys "u"
                               :template ("* TODO [#D] %{unit-prompt} %? :uni:"
                                          "%i %a"))))
                  (,(format "%s\tEmail" (all-the-icons-faicon "envelope" :face 'all-the-icons-blue :v-adjust 0.01))
                   :keys "m"
                   :file +org-capture-todo-file
                   :prepend t
                   :headline "Inbox"
                   :type entry
                   :template ("* TODO %^{type|reply to|contact} %\\3 %? :email:"
                              "Send an email %^{urgancy|soon|ASAP|anon|at some point|eventually} to %^{recipiant}"
                              "about %^{topic}"
                              "%U %i %a"))
                  (,(format "%s\tVocabulary" (all-the-icons-octicon "calendar" :face 'all-the-icons-orange :v-adjust 0.01))
                   :keys "v"
                   :file "~/org/notes.org"
                   :prepend t
                   :headline "Vocabulary"
                   :type entry
                   :template ("* %? :voc:\n%U"))
                  (,(format "%s\tEvent" (all-the-icons-octicon "calendar" :face 'all-the-icons-orange :v-adjust 0.01))
                   :keys "e"
                   :file "~/org/agenda/todo.org"
                   :prepend t
                   :headline "Events"
                   :type entry
                   :template ("* %? :event:\n%U"))
                  (,(format "%s\tInteresting" (all-the-icons-faicon "eye" :face 'all-the-icons-lcyan :v-adjust 0.01))
                   :keys "i"
                   :file +org-capture-todo-file
                   :prepend t
                   :headline "Interesting"
                   :type entry
                   :template ("* [ ] %{desc}%? :%{i-type}:"
                              "%i %a")
                   :children ((,(format "%s\tWebpage" (all-the-icons-faicon "globe" :face 'all-the-icons-green :v-adjust 0.01))
                               :keys "w"
                               :desc "%(org-cliplink-capture) "
                               :i-type "read:web"
                               )
                              (,(format "%s\tArticle" (all-the-icons-octicon "file-text" :face 'all-the-icons-yellow :v-adjust 0.01))
                               :keys "a"
                               :desc ""
                               :i-type "read:research"
                               )
                              (,(format "%s\t\tRecipie" (all-the-icons-faicon "spoon" :face 'all-the-icons-dorange :v-adjust 0.01))
                               :keys "r"
                               :file +org-capture-recipies
                               :headline "Unsorted"
                               :template "%(org-chef-get-recipe-from-url)"
                               )
                              (,(format "%s\tThought" (all-the-icons-material "bubble_chart" :face 'all-the-icons-blue :v-adjust 0.01))
                               :keys "t"
                               :desc ""
                               :i-type "thought"
                               )
                              (,(format "%s\tInformation" (all-the-icons-faicon "info-circle" :face 'all-the-icons-blue :v-adjust 0.01))
                               :keys "i"
                               :desc ""
                               :i-type "read:info"
                               )
                              (,(format "%s\tIdea" (all-the-icons-faicon "lightbulb-o" :face 'all-the-icons-silver :v-adjust 0.01))
                               :keys "I"
                               :desc ""
                               :i-type "idea"
                               )
                              (,(format "%s\tQuestion" (all-the-icons-faicon "question-circle" :face 'all-the-icons-pink :v-adjust 0.01))
                               :keys "?"
                               :desc ""
                               :i-type "question"
                               )))
                  (,(format "%s\tTasks" (all-the-icons-octicon "inbox" :face 'all-the-icons-yellow :v-adjust 0.01))
                   :keys "k"
                   :file +org-capture-todo-file
                   :prepend t
                   :headline "Tasks"
                   :type entry
                   :template ("* TODO %? %^G%{extra}"
                              "%i %a")
                   :children ((,(format "%s\tGeneral Task" (all-the-icons-octicon "inbox" :face 'all-the-icons-yellow :v-adjust 0.01))
                               :keys "k"
                               :extra ""
                               )
                              (,(format "%s\tTask with deadline" (all-the-icons-material "timer" :face 'all-the-icons-orange :v-adjust -0.1))
                               :keys "d"
                               :extra "\nDEADLINE: %^{Deadline:}t"
                               )
                              (,(format "%s\tScheduled Task" (all-the-icons-octicon "calendar" :face 'all-the-icons-orange :v-adjust 0.01))
                               :keys "s"
                               :extra "\nSCHEDULED: %^{Start time:}t"
                               )
                              ))
                  (,(format "%s\tProject" (all-the-icons-octicon "repo" :face 'all-the-icons-silver :v-adjust 0.01))
                   :keys "p"
                   :prepend t
                   :type entry
                   :headline "Inbox"
                   :template ("* %{time-or-todo} %?"
                              "%i"
                              "%a")
                   :file ""
                   :custom (:time-or-todo "")
                   :children ((,(format "%s\tProject-local todo" (all-the-icons-octicon "checklist" :face 'all-the-icons-green :v-adjust 0.01))
                               :keys "t"
                               :time-or-todo "TODO"
                               :file +org-capture-project-todo-file)
                              (,(format "%s\tProject-local note" (all-the-icons-faicon "sticky-note" :face 'all-the-icons-yellow :v-adjust 0.01))
                               :keys "n"
                               :time-or-todo "%U"
                               :file +org-capture-project-notes-file)
                              (,(format "%s\tProject-local changelog" (all-the-icons-faicon "list" :face 'all-the-icons-blue :v-adjust 0.01))
                               :keys "c"
                               :time-or-todo "%U"
                               :heading "Unreleased"
                               :file +org-capture-project-changelog-file))
                   )
                  ("\tCentralised project templates"
                   :keys "o"
                   :type entry
                   :prepend t
                   :template ("* %{time-or-todo} %?"
                              "%i"
                              "%a")
                   :children (("Project todo"
                               :keys "t"
                               :prepend nil
                               :time-or-todo "TODO"
                               :heading "Tasks"
                               :file +org-capture-central-project-todo-file)
                              ("Project note"
                               :keys "n"
                               :time-or-todo "%U"
                               :heading "Notes"
                               :file +org-capture-central-project-notes-file)
                              ("Project changelog"
                               :keys "c"
                               :time-or-todo "%U"
                               :heading "Unreleased"
                               :file +org-capture-central-project-changelog-file))
                   ))))))

;; (setq cfw:org-capture-template
;;       '("c" "calfw2org" entry (file "~/org/agenda/refile.org" )
;;         "* %? %(cfw:org-capture-day)"))

(setq org-refile-targets
      '((nil :maxlevel . 3)
        (org-agenda-files :maxlevel . 3)
        ("~/org/notes.org" :maxlevel . 1)
        ("~/org/someday.org" :level . 1)
        ("~/org/writing.org" :maxlevel . 1)
        ))

(defun +org/verify-refile-target ()
  "Exclude todo keywords with a done state from refile targets"
  (not (member (nth 2 (org-heading-components)) org-done-keywords)))

(setq org-refile-target-verify-function '+org/verify-refile-target)

(setq org-agenda-custom-commands
      '(("o" "Overview"
         ((agenda "" ((org-agenda-span 'day)
                      (org-super-agenda-groups
                       '((:name "Today"
                          :time-grid t
                          :date today
                          :todo "TODAY"
                          :scheduled today
                          :order 1)))))
          (alltodo "" ((org-agenda-overriding-header "")
                       (org-super-agenda-groups
                        '((:name "Next to do"
                           :todo "NEXT"
                           :order 1)
                          (:name "Important"
                           :tag "Important"
                           :priority "A"
                           :order 6)
                          (:name "Due Today"
                           :deadline today
                           :order 2)
                          (:name "Due Soon"
                           :deadline future
                           :order 8)
                          (:name "Overdue"
                           :deadline past
                           :face error
                           :order 7)
                          (:name "Assignments"
                           :tag "Assignment"
                           :order 10)
                          (:name "Issues"
                           :tag "Issue"
                           :order 12)
                          (:name "Emacs"
                           :tag "Emacs"
                           :order 13)
                          (:name "Projects"
                           :tag "Project"
                           :order 14)
                          (:name "Research"
                           :tag "Research"
                           :order 15)
                          (:name "To read"
                           :tag "Read"
                           :order 30)
                          (:name "Waiting"
                           :todo "WAITING"
                           :order 20)
                          (:name "University"
                           :tag "uni"
                           :order 32)
                          (:name "Trivial"
                           :priority<= "E"
                           :tag ("Trivial" "Unimportant")
                           :todo ("SOMEDAY" )
                           :order 90)
                          (:discard (:tag ("Chore" "Routine" "Daily")))))))))
        ("h" "Habits" tags-todo "STYLE=\"habit\""
         ((org-agenda-overriding-header "Habits")
          (org-agenda-sorting-strategy
           '(todo-state-down effort-up category-keep))))
        ("n" "Agenda and all TODOs"
         ((agenda "")
          (alltodo "")))
        ("N" "Notes" tags "NOTE"
         ((org-agenda-overriding-header "Notes")
          (org-tags-match-list-sublevels t)))))

(after! org-superstar
  (setq org-superstar-headline-bullets-list '("◉" "○" "✸" "◆" "✤" "✜" "◆" "▶")
        org-superstar-prettify-item-bullets t
        org-superstar-item-bullet-alist
        '((?* . ?⇝)
          (?+ . ?➢)
          (?- . ?→))
        ))

(setq org-list-demote-modify-bullet '(("-" . "+") ("+" . "-")))

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
