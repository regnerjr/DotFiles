;;hilight selected text
(setq-default transient-mark-mode t)
;;Don't show startup message just go straight to *scratch* buffer.
(setq inhibit-startup-message t)
;;No initial scratch message
(setq initial-scratch-message nil)
;;please show column numbers
(column-number-mode 1)
;;Don't make backup files
(setq make-backup-files nil)
;; make buffer switch command show suggestions
(ido-mode 1)

;Set C style default to linux using 3 spaces to indent.
(setq c-default-style "linux"
      c-basic-offset 3)

;Set tabs to be spaces instead
(setq-default indent-tabs-mode nil)

;Set bash to use 3 spaces for tabs.
(setq-default sh-indentation 3)
(setq-default sh-basic-offset 3)

(put 'downcase-region 'disabled nil)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(reb-re-syntax (quote string)))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;;; Fix junk characters in shell-mode
(add-hook 'shell-mode-hook
          'ansi-color-for-comint-mode-on)

(put 'upcase-region 'disabled nil)

;;Markdown Support
(add-to-list 'auto-mode-alist '("\\.markdown$" . markdown-mode))
