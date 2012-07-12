(require 'cl)

'(recentf-mode t)
'(transient-mark-mode t)

(setq make-backup-files nil)
(setq query-replace-highlight t)
(setq search-highlight t)
(setq font-lock-maximum-decoration t)
(setq confirm-kill-emacs 'yes-or-no-p)
(setq require-final-newline t)
(setq major-mode 'text-mode)
(setq-default indent-tabs-mode nil)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-basic-offset 4)

(set-cursor-color "#00cc00")
(delete-selection-mode t)
(fset 'yes-or-no-p 'y-or-n-p)

(add-hook 'write-file-hooks 'delete-trailing-whitespace)

(when window-system
  (set-background-color "black")
)

;;Small fix for selection with shift+up
; More infos: http://lists.gnu.org/archive/html/help-gnu-emacs/2011-05/msg00174.html
(if (equal "xterm" (tty-type))
      (define-key input-decode-map "\e[1;2A" [S-up]))


(visit-tags-table "~/tags/TAGS")

(show-paren-mode t)
(setq show-paren-style 'mixed)

(add-to-list  'load-path "~/.emacs.d/plugins/redo")
(require 'redo)
(global-set-key [(control -)] 'redo)

(defun untabify-buffer ()
  "Untabify the entire buffer."
  (interactive)
  (untabify (point-min) (point-max))
)


(load-file "~/.emacs.d/init/ascii-table.el")
(load-file "~/.emacs.d/init/maxframe.el")
(load-file "~/.emacs.d/init/ecb.el")
(load-file "~/.emacs.d/init/ecb-layouts.el")
(load-file "~/.emacs.d/init/anything.el")
(load-file "~/.emacs.d/init/yasnippet.el")
(load-file "~/.emacs.d/init/ruby.el")
(load-file "~/.emacs.d/init/auto-complete.el")
(load-file "~/.emacs.d/init/php.el")
(load-file "~/.emacs.d/init/git.el")


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-layout-name "sliim-layout")
 '(ecb-layout-window-sizes (quote (("sliim-layout" (ecb-directories-buffer-name 0.19047619047619047 . 0.9811320754716981) (ecb-methods-buffer-name 0.21164021164021163 . 0.6226415094339622)))))
 '(ecb-options-version "2.40")
 '(ecb-show-sources-in-directories-buffer (quote ("left7" "left13" "left14" "left15" "sliim-layout")))
 '(php-project-list (quote (("WDB-Lib" "~/projects/WDB-Lib/" "" nil "~/projects/WDB-Lib/tests/phpunit.xml" nil (("" . "") "" "" "" "" "" "" "" "") "Wdb" "Wdb") ("WDB-Back" "~/projects/WDB-Back/" "" nil "~/projects/WDB-Back/module/WdbBack/tests/phpunit.xml" nil (("" . "") "" "" "" "" "" "" "" "") "WdbBack" "WdbBack") ("WDB-Front" "~/projects/WDB-Front/" "" nil "~/projects/WDB-Front/module/WdbFront/tests/phpunit.xml" nil (("" . "") "" "" "" "" "" "" "" "") "WdbFront" "WdbFront") ("WDB-Tools" "~/projects/WDB-Tools/" "" nil "" nil (("" . "") "" "" "" "" "" "" "" "") "" "") ("SLiib" "~/projects/SLiib/" "" nil "~/projects/SLiib/tests/phpunit.xml" nil (("" . "") "" "" "" "" "" "" "" "") "SLiib" "SLiib"))))
 '(phpcs-shell-command "/usr/bin/phpcs")
 '(phpcs-standard "Sliim")
 '(phpunit-shell-command "/usr/bin/phpunit"))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :foreground "green" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 83 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

