(setq
 backup-directory-alist
 '(("." . "~/.saves"))    ; don't litter my fs tree
)

; save by copying
(setq backup-by-copying t)

; more saves!
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)