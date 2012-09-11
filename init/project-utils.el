(defvar current-project nil)

;;; Function that open project, load snippets, visit tags table and read project desktop if exists
(defun project-open ()
  (interactive)
  "Function that open project, load snippets and read project desktop"
  (let ((project (php-project-ask-for-project "Project: ")))
    (project-close-current)
    (php-project-dired-directory project)
    (when (file-exists-p (concat (php-project-directory project) "/.emacs/"))
      (cd (concat (php-project-directory project) ".emacs/"))
      (when (file-exists-p "./snippets/")
        (add-to-list 'yas/root-directory "./snippets")
        (mapc 'yas/load-directory yas/root-directory))
      (when (file-exists-p "./TAGS")
        (tags-reset-tags-tables)
        (visit-tags-table "./TAGS"))
      (when (file-exists-p "./.emacs.desktop")
        (desktop-read)))
    (setq current-project project)))

;;; Function that save current desktop in .emacs's project dir
(defun project-save-desktop ()
  (interactive)
  "Function that save current desktop in .emacs's project dir"
  (if current-project
      (when (file-exists-p (concat (php-project-directory current-project) "/.emacs/"))
        (desktop-save (concat (php-project-directory current-project) ".emacs/")))
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
          (shell-command command)))
    (message "No project opened..")))

(defun project-show-current ()
  (interactive)
  "Show the current project"
  (if current-project
      (message (php-project-nickname current-project))
    (message "none")))

(defun project-close-current ()
  (interactive)
  "Close current project"
  (when current-project
    (dolist (buffer (buffer-list))
      (when (eq (php-project-buffer-project (buffer-file-name buffer)) current-project)
        (kill-buffer buffer)))))
