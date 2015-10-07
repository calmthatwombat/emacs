;;;;;;;;;;;;;;;;;
;; Misc Config ;;
;;;;;;;;;;;;;;;;;

; Icomplete mode
(icomplete-mode t)

; Global line number mode
(global-linum-mode t)

; Make emacs use clipboard - cross-program copying
(setq x-select-enable-clipboard t)
(setq interprogram-paste-function 'x-cut-buffer-or-selection-value)

; Set title to be name of document
(setq frame-title-format '("%b %+%+ emacs@" system-name))

; Inhibit startup screen
(setq inhibit-startup-screen t)

; Disable mouse-highlight copying
(setq mouse-drag-copy-region nil)

; Automatically reloads buffer on change in file
(global-auto-revert-mode t)

; Scroll bar on right
(set-scroll-bar-mode 'right)

; Blink cursor mode disabled
(blink-cursor-mode nil)

; Hide tool bar
(tool-bar-mode nil)

; Disable version control through emacs
(setq vc-handled-backends ())

; Column/Linum Indicators
(column-number-mode t)
(line-number-mode nil)

; Intuitive redo/undo
(require 'redo)


