;;;;;;;;;;;;;;;;;;;;;;
;; Java Mode Config ;;
;;;;;;;;;;;;;;;;;;;;;;

; Tabs to 2 spaces
(add-hook 'java-mode-hook (lambda ()
			    (setq c-basic-offset 4
				  tab-width 8
				  indent-tabs-mode nil)))