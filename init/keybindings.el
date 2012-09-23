;;; keybindings.el ---
;;
;;; Author: Sliim <sliim@mailoo.org>
;;; Description: Sleemacs's keybindings initializer
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
(global-set-key (kbd "C-(") 'undo)
(global-set-key (kbd "C-l") 'goto-line)

(global-set-key (kbd "C-c d") 'ecb-goto-window-directories)
(global-set-key (kbd "C-c e") 'ecb-goto-window-edit1)
(global-set-key (kbd "C-c h") 'ecb-goto-window-history)
(global-set-key (kbd "C-c s") 'ecb-goto-window-sources)
(global-set-key (kbd "C-c m") 'ecb-goto-window-methods)
(global-set-key (kbd "C-<next>") 'ecb-nav-goto-next)
(global-set-key (kbd "C-<prior>") 'ecb-nav-goto-previous)
(global-set-key (kbd "C-,") 'ecb-show-ecb-windows)
(global-set-key (kbd "C-;") 'ecb-hide-ecb-windows)
