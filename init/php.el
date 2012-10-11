;;; php.el ---
;;
;;; Author: Sliim <sliim@mailoo.org>
;;; Description: Sleemacs's php initializer
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

(add-hook 'php-mode-hook 'my-php-mode-hook-func)

;;Indent switch/case
(add-hook 'php-mode-hook
          (lambda ()
             (c-set-offset 'case-label '+)))