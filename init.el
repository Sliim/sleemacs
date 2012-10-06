;;; init.el ---
;;
;;; Author: Sliim <sliim@mailoo.org>
;;; Description: Sleemacs initializer
;;
;; This source file is part of Sleemacs.
;;
;; Sleemacs is free software: you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.
;;
;; Sleemacs is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.
;;
;; You should have received a copy of the GNU General Public License along
;; with Sleemacs. If not, see <http://www.gnu.org/licenses/gpl-3.0.html>.
;;
;;; Commentary:
;; Add into your ~/.emacs file:
;; (load-file "~/.emacs.d/sleemacs/init.el")
;;
;;; Code:
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
(put 'scroll-left 'disabled nil)

(delete-selection-mode t)
(fset 'yes-or-no-p 'y-or-n-p)

(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;;Appareance
(set-cursor-color "#999999")
(set-foreground-color "#999999")
(set-scroll-bar-mode nil)
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
(load-file "~/.emacs.d/sleemacs/init/grep.el")
(load-file "~/.emacs.d/sleemacs/init/functions.el")
(load-file "~/.emacs.d/sleemacs/init/project-utils.el")
(load-file "~/.emacs.d/sleemacs/init/keybindings.el")
