;;;;;;;;;;;;;;;;;;;;;;
;; Ruby Mode Config ;;
;;;;;;;;;;;;;;;;;;;;;;

; C-j overwrite
(add-hook 'ruby-mode-hook (lambda ()
			    (define-key ruby-mode-map [?\C-j]
			      'backward-char)))
