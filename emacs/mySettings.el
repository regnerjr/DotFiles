;;; MySettings.el -- Provides my custom settings for use with Prelude
;;; Commentary:
;;; Code:

;;Install some packages
(setq packages-that-i-like
      '(keyfreq achievements guide-key yasnippet ido-vertical-mode monokai-theme helm-spotify ggtags))
(prelude-require-packages packages-that-i-like)

;;Disable Scroll Bar
(scroll-bar-mode -1)

;;set guru mode to only warn
(setq guru-warn-only 1)

;;only highlight really long lines
(setq whitespace-style '(face empty trailing))

(setq mac-command-modifier 'meta)
(setq mac-option-modifier 'super)

;; Define some global key commands
(key-chord-define-global "vv"  'kill-buffer)
(key-chord-define-global "aa" 'ido-switch-buffer)
(global-set-key (kbd "<f7>") 'other-window)
(global-set-key (kbd "<menu>") 'smex)
(global-set-key "\C-x\C-d" 'ido-dired)

;;load a different color theme on launch
(load-theme 'monokai 1) ;;load this one to overwrite some from the prelude default

;;set recommended Global ORG Key Commands
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;; ORG- MODE Stuff
;;define custom org view C-c / n
(setq org-agenda-custom-commands
      '(("n" occur-tree "Nxt_Actn")))
;;list unscheduled tasks with org-agenda-list-stuck-projects
(setq org-stuck-projects
      '("TODO={.+}/-DONE" nil nil "SCHEDULED:\\|DEADLINE:"))

(defun set-yas-minor-mode-off ()
  (yas-minor-mode -1))
(add-hook 'term-mode-hook 'set-yas-minor-mode-off t)
(add-hook 'org-mode-hook 'set-yas-minor-mode-off t)

;;helm spotify has errors if called without debug-on-error set. So i wrote this wrapper
(defun john-spotify ()
  "wrapper for calling spotify from keyboard shortcut and removing possibility for error"
  (interactive)
  (setq debug-on-error t)
  (helm-spotify)
  (setq debug-on-error nil))
(global-set-key (kbd "<C-M-s-next>") 'john-spotify)

;;Turn on keyfreq
(require 'keyfreq)
(keyfreq-mode 1)
(keyfreq-autosave-mode 1)

;;turn on Achievements
(require 'achievements)
(achievements-mode 1)

;;turn on Autocomplete global
;;(require 'auto-complete)
;;(require 'auto-complete-config)
;;(ac-config-default)
;;(setq ac-auto-show-menu 0.1)
;;(global-auto-complete-mode)

; Enable guide-key-mode
(require 'guide-key)
(setq guide-key/guide-key-sequence '("C-x r" "C-x 4"))
(guide-key-mode 1)

; Enable Org mode autocomplete
;;(require 'org-ac)
;;(org-ac/config-default)

; Enable Yasnippet
(require 'yasnippet)
(yas-global-mode 1)

;; Set tramp to always use regner.j as the username on a400lb2
(add-to-list 'tramp-default-user-alist
             '("ssh" ".*\\a400lb2\\'" "regner.j"))

;;enable ido-vertical mode
(ido-vertical-mode 1)

;;enable global company mode
(add-hook 'after-init-hook 'global-company-mode)
