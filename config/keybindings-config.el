;;;;;;;;;;;;;;;;;;;;;;;
;; Keybinding Config ;;
;;;;;;;;;;;;;;;;;;;;;;;

; toggle fullscreen
(defun toggle-fullscreen ()
  (interactive)
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
  (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
	    		 '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0)))

; toggle then split window horizontally
(defun splitwindowhoriz()
  (interactive)
  (toggle-fullscreen)
  (split-window-horizontally))

; deleting without kill-ring
(defun delete-word(&optional arg)
  (interactive "p")
  (dotimes (i arg)
    (delete-region (point) (progn (forward-word arg) (point)))))
(defun backward-delete-word(&optional arg)
  (interactive "p")
  (dotimes (i arg)
    (delete-region (point) (progn (backward-word arg) (point)))))
(defun delete-whole-line(&optional arg)
  (interactive "p")
  (dotimes (i arg)
    (end-of-line 1)
    (delete-region (point) (progn (beginning-of-line) (point)))
    (delete-char 1))
  (back-to-indentation))

; jump to next line and tab
(defun fresh-new-line-and-indent(&optional arg)
  (interactive "p")
  (dotimes (i arg)
    (end-of-line)
    (newline-and-indent)))

; jump to next line and tab, then move up cursor
(defun fresh-new-line-and-indent-up(&optional arg)
  (interactive "p")
  (dotimes (i arg)
    (beginning-of-line)
    (newline-and-indent)
    (previous-line)
    (indent-for-tab-command)))


; moving cursor to top or bottom
(defun scroll-other-down(&optional arg)
  (interactive "p")
  (dotimes (i arg)
    (scroll-other-window 3)))
(defun scroll-other-up(&optional arg)
  (interactive "p")
  (dotimes (i arg)
    (scroll-other-window -3)))

; initiate multi-line comment
(defun comment-dwim-multi()
  (interactive)
  (beginning-of-line)
  (newline)
  (previous-line)
  (indent-for-tab-command)
  (if (string= (format "%s" major-mode) "python-mode")
      (progn (insert "\'\'\'  \'\'\'") (backward-char 4))
    (insert "/**  */")
    (backward-char 3)))

; new line & closing bracket
(defun newline-closing-bracket(&optional arg)
  (interactive "p")
  (dotimes (i arg)
    (fresh-new-line-and-indent 1)
    (insert "}")
    (indent-for-tab-command)))

; sets up full bracket
(defun full-bracket-setup(&optional arg)
  (interactive "p")
  (dotimes (i arg)
    (insert "{")
    (fresh-new-line-and-indent 2)
    (insert "}")
    (indent-for-tab-command)
    (previous-line)
    (indent-for-tab-command)))
  
; misc keybindings
(global-set-key (kbd "C-a") 'back-to-indentation)
(global-set-key (kbd "C-w") 'delete-region)
(global-set-key (kbd "C-'") 'fresh-new-line-and-indent)
(global-set-key (kbd "M-'") 'fresh-new-line-and-indent-up)
(global-set-key (kbd "C-j") 'backward-char)
(global-set-key (kbd "C-k") 'previous-line)
(global-set-key (kbd "C-l") 'next-line)
(global-set-key (kbd "C-;") 'forward-char)
(global-set-key (kbd "C-:") (kbd "<S-right>"))
(global-set-key (kbd "M-;") 'forward-word)
(global-set-key (kbd "M-:") (kbd "<S-C-right>"))
(global-set-key (kbd "M-a") 'backward-paragraph)
(global-set-key (kbd "M-e") 'forward-paragraph)
(global-set-key (kbd "M-j") 'backward-word)
(global-set-key (kbd "M-d") 'delete-word)
(global-set-key (kbd "C-<delete>") 'delete-word)
(global-set-key (kbd "M-f") 'backward-delete-word)
(global-set-key (kbd "C-<backspace>") 'backward-delete-word)
(global-set-key (kbd "C-f") 'backward-delete-char-untabify)
(global-set-key (kbd "C-n") 'goto-line)
(global-set-key (kbd "M-s") 'isearch-backward)
(define-key isearch-mode-map "\M-s" 'isearch-repeat-backward)
(global-set-key (kbd "C-b") 'comment-dwim)
(global-set-key (kbd "M-b") 'comment-dwim-multi)
(global-set-key (kbd "C-z") 'indent-new-comment-line)
(global-set-key (kbd "M-z") 'comment-kill)
(global-set-key (kbd "M-]") 'splitwindowhoriz)
(global-set-key (kbd "M-}") (kbd "M-! gnome-terminal & RET C-x 1"))
(global-set-key (kbd "C-v") 'yank)
(global-set-key (kbd "M-v") 'kill-ring-save)
(global-set-key (kbd "C-x C-v") 'kill-region)
(global-set-key (kbd "M-w") 'delete-whole-line)
(global-set-key (kbd "M-k") 'scroll-other-up)
(global-set-key (kbd "M-l") 'scroll-other-down)
(global-set-key (kbd "M-/") 'redo)
(global-set-key (kbd "M-{") 'newline-closing-bracket)
(global-set-key (kbd "M-[") 'full-bracket-setup)
(global-set-key (kbd "C-M-b") 'uncomment-region)
(global-set-key (kbd "M-u") 'query-replace)
(global-set-key (kbd "C-u") (kbd "C-1 C-2"))
(global-set-key (kbd "M-.") 'other-window)
(global-set-key (kbd "C-.") 'ido-switch-buffer)
(global-set-key (kbd "C-,") (kbd "C-. C-m"))
(global-set-key (kbd "M-,") 'next-buffer)
(global-set-key (kbd "C-r") 'move-to-window-line-top-bottom)




; terminal-specific bindings
(if (not (display-graphic-p))
    (global-set-key (kbd "C-q") 'indent-for-tab-command))


; separate Tab and C-i
(define-key input-decode-map (kbd "C-i") (kbd "H-i"))
; separate Enter and C-m
;(define-key input-decode-map (kbd "C-m") (kbd "H-m"))

; scrolling by two lines
(defun scroll-up-one-line(&optional arg)
  (interactive "p")
  (dotimes (i arg)
    (scroll-up 3)))

(defun scroll-down-one-line(&optional arg)
  (interactive "p")
  (dotimes (i arg)
    (scroll-down 3)))

(global-set-key (kbd "H-i") 'scroll-down-one-line)
(global-set-key (kbd "C-o") 'scroll-up-one-line)
(global-set-key (kbd "<f11>") 'scroll-down-one-line)
(global-set-key (kbd "<f12>") 'scroll-up-one-line)
(global-set-key (kbd "M-i") 'scroll-down)
(global-set-key (kbd "M-o") 'scroll-up)

(global-set-key (kbd "C-p") 'iy-go-to-char)
(global-set-key (kbd "M-p") 'iy-go-to-char-backward)

; ONE BUTTON SCROLLING, M-[ TABBING. ZAP-TO-CHAR
; C-q M-q     C-t M-t     C-r M-r     C-y M-y     M-n     C-=
; M-+ M-"     M-, M-.     M-g