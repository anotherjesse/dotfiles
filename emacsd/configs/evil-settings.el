;; Evil VIM mode
(require 'evil)
(evil-mode 1)

(setq evil-move-cursor-back t
      evil-cross-lines t
      evil-want-C-w-in-emacs-state nil
      evil-want-C-w-delete t)

;; Evil paredit
; (require 'evil-paredit)
;(add-hook 'emacs-lisp-mode-hook 'evil-paredit-mode)

;; Evil leader
;;(require 'evil-leader)
;;(setq evil-leader/leader "\\"
;;      evil-leader/in-all-states t)

;; Evil surround
(require 'surround)
(global-surround-mode 1)

;; Initial states
(evil-set-initial-state 'nrepl-mode 'insert)

;; Evil relative line numbers

;(defvar cofi/current-line 0
;  "Stores the current line before linum numbers the lines.")

;(defadvice linum-update (before set-current-line activate)
;  (setq cofi/current-line (line-number-at-pos)))

;(defun cofi/relative-line (line-number)
;  (propertize (format "%2d" (abs (- line-number cofi/current-line)))
;              'face 'linum))

;(defface linum-current-line '((t (:bold t :background "#202020" :foreground "yellow")))
;  "Face linum uses for the current line"
;  :group 'linum)

;(setq linum-format #'cofi/relative-line)

;; Hollow cursor
;;(setq evil-normal-state-cursor '("yellow" hollow))
(setq evil-normal-state-cursor '("orange" box))
(setq evil-insert-state-cursor '("orange" bar))

; Redefine function ("C-o o" wouldn't go back to insert mode for instance)
(defun evil-execute-in-normal-state ()
  "Execute the next command in Normal state."
  (interactive)
  (evil-delay '(not (memq this-command
                          '(evil-execute-in-normal-state
                            evil-use-register
                            digit-argument
                            negative-argument
                            universal-argument
                            universal-argument-minus
                            universal-argument-more
                            universal-argument-other-key)))
      `(progn
         (if (evil-insert-state-p)
             (let ((prev-state (cdr-safe (assoc 'normal evil-previous-state-alist))))
               (evil-change-state prev-state)
               (setq evil-previous-state 'normal))
           (evil-change-to-previous-state))
         (setq evil-move-cursor-back ',evil-move-cursor-back))
    'post-command-hook)
  (setq evil-move-cursor-back nil)
  (evil-normal-state)
  (evil-echo "Switched to Normal state for the next command ..."))

(provide 'evil-settings)
