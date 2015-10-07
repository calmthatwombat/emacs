(defgroup iy-go-to-char nil
  "go to char like f in vim."
  :link '(emacs-commentary-link "iy-go-to-char")
  :prefix "iy-go-to-char-"
  :group 'matching)

(defcustom iy-go-to-char-key-forward ?\.
  "Default key used to go to next occurence of the char"
  :type 'character
  :group 'iy-go-to-char)
(defcustom iy-go-to-char-key-backward ?\,
  "Default key used to go to previous occurence of the char"
  :type 'character
  :group 'iy-go-to-char)

(defvar iy-go-to-char-last-char nil
  "last char used in iy-go-to-char"
  )

(defun iy-go-to-char-isearch-setup ()
  (remove-hook 'isearch-mode-hook 'iy-go-to-char-isearch-setup)
  (setq isearch-string (if iy-go-to-char-last-char (string iy-go-to-char-last-char) ""))
  (isearch-search-and-update))

;;;###autoload
(defun iy-go-to-char (n char)
  "Move forward to Nth occurence of CHAR.

Typing key of CHAR will move to the next occurence of CHAR.
Typing ; will move to the next occurence of CHAR.
Typing , will move to the previous occurence of CHAR.
Typing C-g will quit and return to the original point.
Typing C-s or C-r will start `isearch` using CHAR.
Typing C-w or M-w will kill/copy between current point and the start point.
Unless quit using C-g or the region is activated before searching, the start
 point is set as mark.
"
  (interactive "p\ncGo to char: ")
  (let ((count (if (zerop n) 1 n))
        (cont t)
        (orig (if (region-active-p) (mark) (point)))
        (dir (if (< n 0) -1 1))
        ev pt)
    (when (and (= char ?\C-z) iy-go-to-char-last-char)
      (setq char iy-go-to-char-last-char))
    (save-excursion
      (search-forward (string char) nil nil count)
      (setq pt (match-end 0))
      (setq iy-go-to-char-last-char char) ;; save char only if success
      (while cont
        (setq ev (read-event))
        (cond ((eq ev iy-go-to-char-key-forward)
               (search-forward (string char) nil nil 1)
               (setq pt (match-end 0)))
              ((eq ev iy-go-to-char-key-backward)
               (search-forward (string char) nil nil -1)
               (setq pt (match-end 0)))
              ((eq ev char)
               (search-forward (string char) nil nil dir)
               (setq pt (match-end 0)))
              ((eq ev ?\C-z)
               (search-forward (string char) nil nil dir)
               (setq pt (match-end 0)))
              (t
               (setq cont nil)))))
    (if (not pt)
        (push ev unread-command-events)
      (goto-char pt)
      (push-mark orig t)
      (cond
       ((or (eq ev ?\C-s) (eq ev ?\C-r))
        (add-hook 'isearch-mode-hook 'iy-go-to-char-isearch-setup)
        (if (eq ev ?\C-s) (isearch-forward) (isearch-backward)))
       ((eq ev ?\C-w)
        (goto-char pt)
        (push-mark orig t)
        (delete-region orig pt))
       ((eq ev ?\M-c)
        (goto-char pt)
           (push-mark orig t)
           (kill-ring-save orig pt))
       (t
        (push ev unread-command-events)
        (goto-char pt)
        (push-mark orig t))))))

;;;###autoload
(defun iy-go-to-char-backward (n char)
  "Move backward to Nth occurence of CHAR.
Typing key of CHAR will move to the previous occurence of CHAR.
Typing ; will move to the next occurence of CHAR.
Typing , will move to the previous occurence of CHAR.
Typing C-g will quit and return to the original point.
Typing C-s or C-r will start `isearch` using CHAR"
  (interactive "p\ncGo to char: ")
  (iy-go-to-char (- n) char))

;;;###autoload
(defun iy-go-to-char-continue (n)
  "Continue last `iy-go-to-char` or `iy-go-to-char-backward`"
  (interactive "p")
  (when iy-go-to-char-last-char
    (iy-go-to-char n iy-go-to-char-last-char)))

;;;###autoload
(defun iy-go-to-char-continue-backward (n)
  "Continue last `iy-go-to-char` or `iy-go-to-char-backward`"
  (interactive "p")
  (when iy-go-to-char-last-char
    (iy-go-to-char (- n) iy-go-to-char-last-char)))

 

(provide 'jump-char)
