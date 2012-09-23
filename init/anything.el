;;; anything.el ---
;;
;;; Author: Sliim <sliim@mailoo.org>
;;; Description: Sleemacs's anything initializer
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
(add-to-list 'load-path "~/.emacs.d/sleemacs/plugins/anything")
(require 'anything)

;; anything-rcodetools
(add-to-list 'load-path "~/.emacs.d/sleemacs/plugins/rcodetools")
(require 'anything-rcodetools)
(setq rct-get-all-methods-command "PAGER=cat fri -l -L")
(define-key anything-map "\C-z" 'anything-execute-persistent-action)
;(rct-get-all-methods)

;; Interactively Do Things (highly recommended, but not strictly required)
(require 'ido)
(ido-mode t)
