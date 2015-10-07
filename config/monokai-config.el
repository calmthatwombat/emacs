(unless (>= 24 emacs-major-version)
  (error "monokai-theme requires Emacs 24 or later."))

(deftheme monokai
  "Monokai color theme")

(let ((monokai-green-frog "#32911F")
      (monokai-gray "#595959")
      (monokai-gray-darker "#383830")
      (monokai-gray-darkest "#141411")
      (monokai-gray-lightest "#595959")
      (monokai-gray-light "#E6E6E6")
      (monokai-green "#A6E22A")
      (monokai-green-light "#A6E22E")
      (monokai-grey-dark "#272822")
      (monokai-blue-light "#5CA1FC")
      (monokai-orange-dark "#B86E00")
      (monokai-purple "#8B5FD7")
      (monokai-purple-light "#FD5FF1")
      (monokai-orange-light "#C46D32")
      (monokai-yellow-light "#F8F8F2"))
  (custom-theme-set-faces
   'monokai
   ;; Frame
   `(default ((t (:foreground ,monokai-yellow-light :background ,monokai-grey-dark))))
   `(cursor ((t (:foreground ,monokai-blue-light))))
   `(hl-line ((t (:background ,monokai-gray-darkest))))
   `(minibuffer-prompt ((t (:foreground ,monokai-orange-light))))
   `(modeline ((t (:background ,monokai-gray-lightest :foreground ,monokai-gray-light))))
   `(region ((t (:background ,monokai-gray-darker))))
   `(show-paren-match-face ((t (:background ,monokai-gray-lightest))))
   ;; Main
   `(font-lock-builtin-face ((t (:foreground ,monokai-green))))
   `(font-lock-comment-face ((t (:foreground ,monokai-orange-light))))
   `(font-lock-constant-face ((t (:foreground ,monokai-purple))))
   `(font-lock-doc-string-face ((t (:foreground ,monokai-orange-light))))
   `(font-lock-function-name-face ((t (:foreground ,monokai-green))))
   `(font-lock-keyword-face ((t (:foreground ,monokai-blue-light))))
   `(font-lock-string-face ((t (:foreground ,monokai-orange-light))))
   `(font-lock-type-face ((t (:foreground ,monokai-green-frog))))
   `(font-lock-variable-name-face ((t (:foreground ,monokai-blue-light))))
   `(font-lock-warning-face ((t (:bold t :foreground ,monokai-purple-light))))
   ;; CUA
   `(cua-rectangle ((t (:background ,monokai-gray-darkest))))
   ;; IDO
   `(ido-first-match ((t (:foreground ,monokai-purple))))
   `(ido-only-match ((t (:foreground ,monokai-green))))
   `(ido-subdir ((t (:foreground ,monokai-green-frog))))
   ;; ECB
   `(ecb-default-highlight-face ((t (:foreground ,monokai-green))))
   ;; Whitespace
   `(whitespace-space ((t (:foreground ,monokai-gray))))
   ;; Yasnippet
   `(yas/field-highlight-face ((t (:background ,monokai-gray-darker))))))

(provide-theme 'monokai)

;; Local Variables:
;; no-byte-compile: t
;; End:

;;; monokai-theme.el ends here