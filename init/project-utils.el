(defvar current-project nil)

;;; Function that open project, load snippets, visit tags table and read project desktop if exists
(defun project-open ()
  (interactive)
  "Function that open project, load snippets and read project desktop"
  (let ((project (php-project-ask-for-project "Project: ")))
    (project-close-current)
    (php-project-dired-directory project)
    (setq project-emacs-dir (concat (php-project-directory project) ".emacs/"))
    (when (file-exists-p project-emacs-dir)
      (setq desktop-path '(concat (php-project-directory project) ".emacs/"))
      (setq desktop-dirname project-emacs-dir)
      (setq project-snippets-dir (concat project-emacs-dir "snippets/"))
      (setq project-tags-file (concat project-emacs-dir "TAGS"))

      (when (file-exists-p project-snippets-dir)
        (message "Loading project's snippets..")
        (add-to-list 'yas/root-directory project-snippets-dir)
        (mapc 'yas/load-directory yas/root-directory))
      (when (file-exists-p project-tags-file)
        (message "Loading project's tags table..")
        (tags-reset-tags-tables)
        (visit-tags-table project-tags-file))
      (when (file-exists-p (concat project-emacs-dir ".emacs.desktop"))
        (message "Loading project's desktop..")
        (desktop-read)))
    (setq current-project project)
    (message (concat "Project " (php-project-nickname current-project) " opened."))))

;;; Function that save current desktop in .emacs's project dir
(defun project-save-desktop ()
  (interactive)
  "Function that save current desktop in .emacs's project dir"
  (if current-project
      (when (file-exists-p (concat (php-project-directory current-project) "/.emacs/"))
        (desktop-save (concat (php-project-directory current-project) ".emacs/"))
        (message "Desktop saved."))
    (message "No project opened..")))

;;; Function that update project tags
(defun project-update-tags ()
  (interactive)
  "Function that update project tags"
  (if current-project
      (when (file-exists-p (concat (php-project-directory current-project) "/.emacs/"))
        (let ((command (concat "ctags-exuberant -R -e \
          -o " (concat (php-project-directory current-project) ".emacs/TAGS") " \
          --languages=PHP \
          --exclude=\"\.git\" \
          --totals=yes \
          --tag-relative=yes \
          --PHP-kinds=-v \
          --regex-PHP='/abstract class ([^ ]*)/\1/c/' \
          --regex-PHP='/trait ([^ ]*)/\1/c/' \
          --regex-PHP='/interface ([^ ]*)/\1/c/' \
          --regex-PHP='/(public |final |static |abstract |protected |private )+function ([^ (]*)/\2/f/' \
	      --regex-PHP='/const ([^ ]*)/\1/d/' " (php-project-directory current-project))))
          (shell-command command))
        (message "Tags table updated."))
    (message "No project opened..")))

;;; Show the current project
(defun project-show-current ()
  (interactive)
  "Show the current project"
  (if current-project
      (message (php-project-nickname current-project))
    (message "none")))

;;; Close current project
(defun project-close-current ()
  (interactive)
  "Close current project"
  (when current-project
    (when (y-or-n-p (concat "Save desktop for current project " (php-project-nickname current-project) " "))
      (project-save-desktop))
    (desktop-clear)
    (project-desktop-remove-lock-file)
    (message (concat "Project " (php-project-nickname current-project) " closed."))
    (setq current-project nil)))

;;; Remove desktop lock file
(defun project-desktop-remove-lock-file ()
  (interactive)
  "Remove desktop lock file"
  (when current-project
    (setq project-desktop-lock-file (concat (php-project-directory current-project) ".emacs/.emacs.desktop.lock"))
    (when (file-exists-p project-desktop-lock-file)
      (shell-command (concat "rm " project-desktop-lock-file))
      (message "Desktop lock file removed."))))
