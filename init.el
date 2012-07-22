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

(show-paren-mode t)
(setq show-paren-style 'mixed)

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

(load-file "~/.emacs.d/sleemacs/init/maxframe.el")
(load-file "~/.emacs.d/sleemacs/init/ecb.el")
(load-file "~/.emacs.d/sleemacs/init/ecb-layouts.el")
(load-file "~/.emacs.d/sleemacs/init/anything.el")
(load-file "~/.emacs.d/sleemacs/init/yasnippet.el")
(load-file "~/.emacs.d/sleemacs/init/redo.el")
(load-file "~/.emacs.d/sleemacs/init/etags-select.el")
(load-file "~/.emacs.d/sleemacs/init/auto-complete.el")
(load-file "~/.emacs.d/sleemacs/init/php.el")
(load-file "~/.emacs.d/sleemacs/init/ruby.el")
(load-file "~/.emacs.d/sleemacs/init/git.el")
(load-file "~/.emacs.d/sleemacs/init/functions.el")
(load-file "~/.emacs.d/sleemacs/init/keybindings.el")