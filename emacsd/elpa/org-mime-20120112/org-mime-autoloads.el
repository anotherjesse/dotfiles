;;; org-mime-autoloads.el --- automatically extracted autoloads
;;
;;; Code:


;;;### (autoloads (org-mime-subtree org-mime-org-buffer-htmlize org-mime-htmlize)
;;;;;;  "org-mime" "org-mime.el" (21393 64618 318283 0))
;;; Generated autoloads from org-mime.el

(autoload 'org-mime-htmlize "org-mime" "\
Export a portion of an email body composed using `mml-mode' to
html using `org-mode'.  If called with an active region only
export that region, otherwise export the entire body.

\(fn ARG)" t nil)

(autoload 'org-mime-org-buffer-htmlize "org-mime" "\
Create an email buffer containing the current org-mode file
  exported to html and encoded in both html and in org formats as
  mime alternatives.

\(fn)" t nil)

(autoload 'org-mime-subtree "org-mime" "\
Create an email buffer containing the current org-mode subtree
  exported to a org format or to the format specified by the
  MAIL_FMT property of the subtree.

\(fn)" t nil)

;;;***

;;;### (autoloads nil nil ("org-mime-pkg.el") (21393 64618 370321
;;;;;;  841000))

;;;***

(provide 'org-mime-autoloads)
;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; coding: utf-8
;; End:
;;; org-mime-autoloads.el ends here
