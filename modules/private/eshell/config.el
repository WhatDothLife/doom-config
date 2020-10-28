;;; eshell/config.el -*- lexical-binding: t; -*-

(require 'eshell)
(eshell-syntax-highlighting-global-mode)
(add-to-list 'eshell-modules-list 'eshell-tramp)

(defun +eshell--current-git-branch ()
  ;; TODO Refactor me
  (cl-destructuring-bind (status . output)
      (doom-call-process "git" "symbolic-ref" "-q" "--short" "HEAD")
    (if (equal status 0)
        (format " [%s]" output)
      (cl-destructuring-bind (status . output)
          (doom-call-process "git" "describe" "--all" "--always" "HEAD")
        (if (equal status 0)
            (format " [%s]" output)
          "")))))

(defun +eshell-default-prompt-fn ()
  "Generate the prompt string for eshell. Use for `eshell-prompt-function'."
  (require 'shrink-path)
  (require 'eshell-git-prompt)
  (setq git-face
        (if (eshell-git-prompt--collect-status)
            '+eshell-git-not-clean-face
          '+eshell-git-clean-face))
  (concat (if (bobp) "" "\n")
          (with-face "[" :foreground (doom-color 'magenta) 0.2)
          (with-face (concat user-login-name) :foreground (doom-color 'orange) 0.2)
          (with-face "@" :foreground (doom-color 'yellow) 0.2)
          (with-face (system-name) :foreground (doom-color 'green) 0.2)
          (with-face "] " :foreground (doom-color 'dark-cyan) 0.2)
          (let ((pwd (eshell/pwd)))
            (propertize (if (equal pwd "~")
                            pwd
                          (abbreviate-file-name (shrink-path-file pwd)))
                        'face '+eshell-prompt-pwd))
          (propertize (+eshell--current-git-branch)
                      'face git-face)
          (propertize " λ" 'face (if (zerop eshell-last-command-status) 'success 'error))
          " "))

(defun +eshell-complete-recent-dir (&optional arg)
  "Switch to a recent `eshell' directory using completion.
With \\[universal-argument] also open the directory in a `dired'
buffer."
  (interactive "P")
  (evil-insert-state)
  (let ((dir (ring-elements eshell-last-dir-ring)))
    (ivy-read "Switch to recent dir: " dir :action 'insert)
    (eshell-send-input)               ; Should cd directly…
    (when arg
      (dired dir))))

(defun +eshell-open-cwd-dired ()
  (interactive)
  (find-file-other-window default-directory))

(defun +eshell/insert-directory (dir)
  "Prompt for directory and cd to it."
  (interactive "D")
  ;; (+evil/insert (format "\"%s\"" dir))
  (+evil/insert dir))

(defun +eshell/prompt-for-cwd (dir)
  "Prompt for directory and cd to it."
  (interactive "Dcd ")
  (+evil/insert (format "\"%s\"" dir))
  (eshell-send-input))

(defun +eshell/up-directory ()
  (interactive)
  (+evil/insert "cd ..")
  (eshell-send-input))

(defun +eshell/last-directory ()
  (interactive)
  (+evil/insert "cd -")
  (eshell-send-input))

(defface +eshell-git-clean-face
  '((t :foreground "#8ec07c"))
  "Face for git branch (clean) in eshell prompt"
  :group 'eshell-faces)

(defface +eshell-git-not-clean-face
  '((t :foreground "#cc241d"))
  "Face for git branch (clean) in eshell prompt"
  :group 'eshell-faces)

(set-eshell-alias!
 "sf"  "eshell/sudo-find-file $1")

(add-to-list 'exec-path "~/.emacs.d/bin/")

(custom-set-faces!
  `(+eshell-prompt-pwd :foreground "#d3869b")
  `(eshell-syntax-highlighting-string-face :foreground ,(doom-color 'yellow))
  `(+eshell-git-clean-face :foreground ,(doom-color 'dark-cyan))
  `(+eshell-git-not-clean-face :foreground ,(doom-color 'orange)))

(add-hook! 'eshell-first-time-mode-hook
  (defun +eshell-keymap-h ()
    ;; Keys must be bound in a hook because eshell resets its keymap every
    ;; time `eshell-mode' is enabled. Why? It is not for us mere mortals to
    ;; grasp such wisdom.
    (map! :map eshell-mode-map
          ;; :nmi "C-d" #'+eshell-open-cwd-dired
          :nmi "q" #'+eshell/kill-and-close
          :nmi "C-q"  #'+eshell/kill-and-close
          :nmi "C-f" #'+eshell/prompt-for-cwd
          :nmi "C-b" #'+eshell/last-directory
          :nmi "C-r" #'+eshell-complete-recent-dir
          :nmi "C-p" #'+eshell/up-directory
          :nmi "C-l" #'eshell-previous-prompt
          :nmi "C-a" #'eshell-next-prompt
          :nmi "C-i" #'+eshell/insert-directory
          :nmi "C-e" #'+eshell-insert-envvar
          :nmi "C-x" #'eshell/clear
          :nmi "<home>" #'eshell-bol
          :localleader
          "f" #'+eshell/prompt-for-cwd
          "p" #'+eshell/up-directory
          "l" #'+eshell/last-directory
          ;; "d" #'+eshell-open-cwd-dired
          "r" #'+eshell-complete-recent-dir)))

(defun +eshell-insert-envvar (envvar-name)
  "Insert ENVVAR-NAME into the current buffer at point."
  (interactive
   (list (read-envvar-name "Name of environment variable: " t)))
  (+evil/insert (concat "$" envvar-name)))
