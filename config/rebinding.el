; rebind C-j in lisp-interaction-mode
(defun lisp-interaction-c-j()
  (local-set-key (kbd "C-j") 'backward-char))
(add-hook 'lisp-interaction-mode-hook 'lisp-interaction-c-j)

; rebind C-j in asm-mode
(defun asm-c-j()
  (local-set-key (kbd "C-j") 'backward-char))
(add-hook 'asm-mode-hook 'asm-c-j)
