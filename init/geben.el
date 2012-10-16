;;; geben.el ---
;;
;;; Author: Sliim <sliim@mailoo.org>
;;; Description: Sleemacs's Geben initializer
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
;;; XDebug configuration
;;
;; Add this in your .ini configuration file:
;;  |xdebug.remote_autostart=off
;;  |xdebug.remote_enable=on
;;  |xdebug.remote_handler=dbgp
;;  |xdebug.remote_mode=req
;;  |xdebug.remote_host=localhost
;;  |xdebug.remote_port=9000
;;
;;; Usefull keybindings:
;;  |spc step into/step over
;;  |i   step into
;;  |o   step over
;;  |r   step out
;;  |b   set a breakpoint at a line
;;  |u   unset a breakpoint at a line
;;  |g   run
;;  |e   eval expression
;;  |q   stop debugger
;;
;;; CLI Scripts:
;; $ export XDEBUG_CONFIG="idekey=gebendbg"
;;
;; Show http://xdebug.org/docs/remote for more infos
;;
;;; Code:
(add-to-list 'load-path "~/.emacs.d/sleemacs/plugins/geben")
(require 'geben)
