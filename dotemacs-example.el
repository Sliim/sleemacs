(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 83 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(ac-etags-candidate-face ((t (:background "white" :foreground "blue2"))))
 '(ac-etags-selection-face ((t (:background "blue3" :foreground "deep sky blue"))))
 '(ecb-default-highlight-face ((((class color) (background dark)) (:background "DodgerBlue4"))))
 '(region ((((class color) (min-colors 88) (background dark)) (:background "DodgerBlue4")))))

;; Load sleemacs
(load-file "~/.emacs.d/sleemacs/init.el")

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(ecb-history-make-buckets (quote never))
 '(ecb-kill-buffer-clears-history (quote auto))
 '(ecb-layout-name "sliim-layout")
 '(ecb-layout-window-sizes (quote (("sliim-layout" (ecb-directories-buffer-name 0.19047619047619047 . 0.9811320754716981) (ecb-methods-buffer-name 0.21164021164021163 . 0.6226415094339622)))))
 '(ecb-options-version "2.40")
 '(ecb-show-sources-in-directories-buffer (quote ("left7" "left13" "left14" "left15" "sliim-layout")))
 '(etags-select-extended-matches t)
 '(global-auto-revert-mode t)
 '(mouse-wheel-progressive-speed nil)
 '(mouse-wheel-scroll-amount (quote (2 ((shift) . 2) ((control)))))
 '(phpcs-shell-command "/usr/bin/phpcs")
 '(phpcs-standard "Sliim")
 '(phpunit-shell-command "/usr/bin/phpunit")
 '(scroll-conservatively 10000)
 '(scroll-step 1))
