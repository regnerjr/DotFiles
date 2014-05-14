;;; john-custom-funct --- John Regners Custom Functions"

;;; Commentary:
;; more commentary here

;;; Code:
;; more code here

(defun john-copy-line-or-region-to-end ()
  "Copy region or current line to end of buffer."
  (interactive)
  (let ((start nil) (end nil))
       (save-excursion
         ;if there is a region grab the point and mark
         (if (region-active-p)
             (progn (setq start (point))
                    (setq end (mark)))
           ;;else grab the beginning and end of the line
           (progn
             (setq start (line-beginning-position))
             (setq end (line-end-position))))
         (goto-char (point-max))
         (insert "\n")
         (insert  (buffer-substring-no-properties start end)))))

(defun john-go-and-zoom ()
  "Execute `goto-line' then `reposition-window'.
move to line then executes \\C-M-i & \\[reposition-window] to show maximum of function."
  (interactive)
  (let (line)
    (setq line  (string-to-number (read-string "Line Number: ")))
    (goto-char (point-min))
    (forward-line (1- line))
    (reposition-window)))

(defun john-whitespace-spaces-and-tabs ()
  (interactive)
  (whitespace-toggle-options 'tab-mark)
  (whitespace-toggle-options 'space-mark)
)

(defun john-whitespace-newlines ()
  (interactive)
  (whitespace-toggle-options 'newline-mark)
)

(provide 'john-functions)
;;; john-functions.el ends here
