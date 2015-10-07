; To benchmark init.el
;; (load "~/.emacs.d/plugins/cl-lib.el")
;; (require 'cl-lib)
;; (load "~/.emacs.d/plugins/benchmark-init.el")
;; (require 'benchmark-init)
;; (load "~/.emacs.d/plugins/benchmark-init-modes.el")
;; (require 'benchmark-init-modes)

; Set load paths and environment variables
(add-to-list 'load-path "~/.emacs.d/config")
(add-to-list 'load-path "~/.emacs.d/plugins")

(load "load-path-config.el")

; Misc setup
(load "misc-config.el")

; Keys setup
(load "keybindings-config.el")

; IDO mode
(load "ido-config.el")

; Java mode
(load "java-config.el")

; Python mode
(load "python-config.el")

; Ruby mode
(load "ruby-config.el")

; Jump-char
(load "jump-char.el")

; Backup location
(load "backup-config.el")

; Monokai color theme
(load "monokai-config.el")

; Rebind keys for some specific modes
(load "rebinding.el")


; Custom Sets
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(line-number-mode nil)
 ;'(scheme-program-name "s9")
 '(tool-bar-mode nil))
(put 'erase-buffer 'disabled nil)

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:stipple nil :background "#1E1F1A" :foreground "#F8F8F2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 128 :width normal :foundry "unknown" :family "WenQuanYi Micro Hei Mono")))))
