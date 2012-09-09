;; PHP-Mode
(add-to-list 'load-path "~/.emacs.d/sleemacs/plugins/php")
(add-to-list 'load-path "~/.emacs.d/sleemacs/plugins/php-mode")
(require 'php-mode)
(require 'php-electric)
(require 'php-completion)

;; PHP+-mode
(add-to-list  'load-path "~/.emacs.d/sleemacs/plugins/phpplus-mode")
;(require 'php+-mode)
;(php+-mode-setup)
(require 'php-test)
(require 'php-project)
(require 'php-tags)

(setq php-manual-path "~/.emacs.d/sleemacs/php-manual")

;;; Function to be called when entering into php-mode
(defun my-php-mode-hook-func ()
  (interactive)
  "Function to be called when entering into php-mode."
  (when (and (require 'auto-complete nil t) (require 'auto-complete-config nil t))
    (make-local-variable 'ac-sources)
    (setq ac-sources '(ac-source-words-in-same-mode-buffers
                       ac-source-dictionary
                       ac-source-php-completion))
    (when (require 'auto-complete-etags nil t)
      (add-to-list 'ac-sources 'ac-source-etags))
    (auto-complete-mode t)))

;;; Function that open project, load snippets and read project desktop if exists
(defun project-open ()
  (interactive)
  "Function that open project, load snippets and read project desktop"
  (let ((project (php-project-ask-for-project "Project: ")))
    (php-project-dired-directory project)
    (when (file-exists-p (concat (php-project-directory project) "/.emacs/"))
      (cd (concat (php-project-directory project) ".emacs/"))
      (when (file-exists-p "./snippets/")
        (setq yas/root-directory '("./snippets"))
        (mapc 'yas/load-directory yas/root-directory))
      (when (file-exists-p "./.emacs.desktop"))
        (desktop-read))))

;;; Function that save current desktop in .emacs's project dir
(defun project-save-desktop ()
  (interactive)
  "Function that save current desktop in .emacs's project dir"
  (let ((project (php-project-ask-for-project "Project: ")))
    (when (file-exists-p (concat (php-project-directory project) "/.emacs/"))
      (desktop-save (concat (php-project-directory project) ".emacs/")))))

;;; Function that update project tags
(defun project-update-tags ()
  (interactive)
  "Function that update project tags"
  (let ((project (php-project-ask-for-project "Project: ")))
    (when (file-exists-p (concat (php-project-directory project) "/.emacs/"))
      (let ((command (concat "ctags-exuberant -R -e \
          -o " (concat (php-project-directory project) ".emacs/TAGS") " \
          --languages=PHP \
          --exclude=\"\.git\" \
          --totals=yes \
          --tag-relative=yes \
          --PHP-kinds=-v \
          --regex-PHP='/abstract class ([^ ]*)/\1/c/' \
          --regex-PHP='/trait ([^ ]*)/\1/c/' \
          --regex-PHP='/interface ([^ ]*)/\1/c/' \
          --regex-PHP='/(public |final |static |abstract |protected |private )+function ([^ (]*)/\2/f/' \
	      --regex-PHP='/const ([^ ]*)/\1/d/' " (php-project-directory project))))
    (shell-command command)))))

(add-hook 'php-mode-hook 'my-php-mode-hook-func)
