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

(setq php-manual-path "~/.emacs.d/php-manual")

(add-hook  'php-mode-hook
    (lambda ()
        (add-to-list 'ac-sources 'ac-source-php-completion)
        (auto-complete-mode t)))

;;; Function that open project and read project desktop
(defun project-open ()
  (interactive)
  "Function that open project and read project desktop"
  (let ((project (php-project-ask-for-project "Project: ")))
    (php-project-dired-directory project)
    (when (file-exists-p (concat (php-project-directory project) "/.emacs/"))
      (cd (concat (php-project-directory project) ".emacs/"))
      (when (file-exists-p (concat (php-project-directory project) "/.emacs/.emacs.desktop"))
        (desktop-read)))))

;;; Function that save current desktop in .emacs's project dir
(defun project-save-desktop ()
  (interactive)
  "Function that save current desktop in .emacs's project dir"
  (let ((project (php-project-ask-for-project "Project: ")))
    (when (file-exists-p (concat (php-project-directory project) "/.emacs/"))
      (desktop-save (concat (php-project-directory project) ".emacs/")))))
