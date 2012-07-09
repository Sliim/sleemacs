(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :foreground "green" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 83 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

;;Tabulation en espace
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq c-basic-offset 4)

;;Supprime les espaces de fin de ligne
(add-hook 'write-file-hooks 'delete-trailing-whitespace)

;; Fonction remplaçant toutes les tabulations du tampon courant par le
;; nombre d'espaces qui ne modifie pas la mise en page apparente
;; (étrangement, la fonction native d'Emacs ne s'applique qu'à une
;; région, pas à un tampon entier).
(defun untabify-buffer ()
  "Untabify the entire buffer."
  (interactive)
  (untabify (point-min) (point-max))
)

;; unable backup file
(setq make-backup-files nil)

;; Background color
(set-background-color "black")

;; PHP-Mode
(add-to-list 'load-path "~/.emacs.d/plugins/php-mode")
(require 'php-mode)