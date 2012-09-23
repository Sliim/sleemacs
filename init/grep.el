;;; grep.el ---
;;
;;; Author: Sliim <sliim@mailoo.org>
;;; Description: Sleemacs's grep initializer
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
;;; Code:
(grep-compute-defaults)
(add-to-list 'grep-find-ignored-directories ".emacs")
(add-to-list 'grep-find-ignored-directories "logs")
(add-to-list 'grep-files-aliases (cons "php" "*.php *.phtml"))
(add-to-list 'grep-files-aliases (cons "js" "*.js"))
(setq grep-find-template "find -L . <X> -type f <F> -print0 | \"xargs\" -0 -e grep <C> -nH -e <R>")

(defun grep-compute-defaults ()
"Hack to keep my changes...")
