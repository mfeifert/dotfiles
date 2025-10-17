;;; -*- lexical-binding: t; -*-

(load "~/sync/config/maf-init-private.el")
(load-theme 'modus-vivendi)
(setq initial-frame-alist '((fullscreen . maximized)))
(modify-frame-parameters nil '((undecorated t)))

(use-package emacs
  :custom
  (auto-save-default nil)
  (delete-by-moving-to-trash t)
  (initial-scratch-message nil)
  (inhibit-startup-screen t)
  (make-backup-files nil)
  (ring-bell-function 'ignore)
  (scroll-conservatively 1) ; Scroll one line at a time
  (scroll-margin 8)
  :config
  (require-theme 'modus-themes)
  (defun display-startup-echo-area-message ()
    (message nil)))

;;; Built-in: major modes

(use-package calendar
  :defer t
  :init
  (setq diary-file maf-diary-file)
  :custom
  (calendar-date-style 'iso)
  :config
  (use-package cal-dst
    :custom
    (calendar-daylight-time-zone-name "PDT")
    (calendar-standard-time-zone-name "PST")
    (calendar-time-zone -480))
  (use-package solar
    :custom
    (calendar-latitude maf-calendar-latitude)
    (calendar-longitude maf-calendar-longitude)
    (calendar-location-name maf-calendar-location-name)))

(use-package dired
  :custom
  (dired-auto-revert-buffer #'dired-directory-changed-p)
  (dired-dwim-target t)
  (dired-free-space nil)
  (dired-kill-when-opening-new-dired-buffer t)
  (dired-listing-switches
   "-AGFhlv --group-directories-first --time-style=long-iso")
  :hook
  (dired-mode . denote-dired-mode)
  (dired-mode . dired-hide-details-mode)
  (dired-mode . hl-line-mode))

;; (use-package help
;;   :custom
;;   (help-window-select t))

(use-package org
  :defer t
  :init
  (setq org-directory maf-org-directory)
  :custom
  (org-edit-src-content-indentation 0)
  (org-hide-emphasis-markers t)
  (org-insert-heading-respect-content t)
  (org-return-follows-link t)
  (org-startup-folded t)
  (org-M-RET-may-split-line '((default . nil)))

  (org-structure-template-alist
   '(("s" . "src")
     ("e" . "src emacs-lisp")
     ("t" . "src emacs-lisp :tangle \"~/.config/emacs/maf-init.el\"")
     ("a" . "export ascii")
     ("c" . "center")
     ("C" . "comment")
     ("E" . "export")
     ("h" . "export html")
     ("l" . "export latex")
     ("q" . "quote")
     ("v" . "verse")
     ("x" . "example"))))

(use-package org
  :custom
  (org-log-done 'time)
  (org-log-into-drawer t)
  (org-agenda-files (list org-directory))
  (org-agenda-use-time-grid nil)
  (org-agenda-clockreport-parameter-plist
   '(:link t :maxlevel 2 :fileskip0 t))

  (org-agenda-prefix-format
   '((agenda . " %i %-12:c%-12t")
     (todo . " %i %-12:c")
     (tags . " %i %-12:c")
     (search . " %i %-12:c")))

  (org-capture-templates `(
  			   ("t" "TODO item" entry
  			    (file+headline "tasks.org" "To be reviewed")
  			    ,(concat "* TODO %?\n"
                                     ":PROPERTIES:\n"
                                     ":CAPTURED: %U\n"
                                     ":END:\n\n"))
  			   
  			   ("i" "Idea" entry
  			    (file+headline "tasks.org" "Ideas")
  			    ,(concat "* %?\n"
                                     ":PROPERTIES:\n"
                                     ":CAPTURED: %U\n"
                                     ":END:\n\n"))
  			   
  			   ("d" "Datetree item" plain
  			    (file+datetree "datetree.org") "%?")
  			   )))

(use-package package
  :init
  (add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
  :hook
  (package-menu-mode . hl-line-mode))

;;; Built-in: minor modes

(use-package autorevert
  :config
  (global-auto-revert-mode t))

(use-package cus-edit
  :init
  (setq custom-file (locate-user-emacs-file "custom.el"))
  (load custom-file :no-error-if-file-is-missing))

(use-package eglot
  :defer t
  :custom
  (eglot-autoshutdown t))

(use-package elec-pair
  :config
  (electric-pair-mode 1))

(use-package frame
  :config
  (blink-cursor-mode -1))

(use-package fringe
  :config
  (fringe-mode 0))

(use-package menu-bar
  :config
  (menu-bar-mode -1))

(use-package savehist
  :config
  (savehist-mode 1))

(use-package scroll-bar
  :config
  (scroll-bar-mode -1))

(use-package simple
  :delight
  (visual-line-mode)
  :config
  (column-number-mode 1)
  (global-visual-line-mode 1))

(use-package tab-bar
  :custom
  (tab-bar-show 1))

(use-package tool-bar
  :config
  (tool-bar-mode -1))

(use-package which-key
  :delight
  :config
  (which-key-mode 1))

;;; Built-in: no mode

(use-package window
  :custom
  (display-buffer-alist
   '(
     ("\\*Buffer List\\*"
      (display-buffer-same-window))
     )))

(use-package isearch
  :custom
  (isearch-lazy-count t)
  (lazy-count-prefix-format "(%s/%s) "))

(use-package keymap
  :config
  (keymap-global-set "<f9>" 'maf-ledger)

  (keymap-global-set "C-c a" 'org-agenda)
  (keymap-global-set "C-c e" 'evil-mode)
  (keymap-global-set "C-c j" 'consult-buffer)
  (keymap-global-set "C-c l" 'consult-line)
  (keymap-global-set "C-c n" 'display-line-numbers-mode)
  (keymap-global-set "C-c o" 'olivetti-mode)

  ;; (keymap-set dired-mode-map "C-c p" 'dired-preview-mode)

  (keymap-set org-mode-map "C-c i" 'org-indent-mode)
  (keymap-set org-mode-map "C-c k" 'consult-org-heading)

  (keymap-set outline-minor-mode-map "<f5>" 'outline-cycle)
  (keymap-set outline-minor-mode-map "<backtab>" 'outline-cycle-buffer))

(use-package modus-themes
  :custom
  (modus-themes-italic-constructs t)
  (modus-themes-common-palette-overrides
   '((bg-prose-block-delimiter bg-inactive))))

(use-package project
  :custom
  (project-mode-line t))

;;; Third party: major modes

(use-package denote
  :ensure t
  :init
  (setq denote-directory (expand-file-name maf-denote-directory))
  :config
  (denote-rename-buffer-mode 1))

(use-package elfeed
  :ensure t
  :init
  (setq elfeed-db-directory "~/.config/emacs/elfeed"))

(use-package ledger-mode
  :ensure t
  :init
  (defun maf-ledger ()
    "Open ledger file and ledger-report windows."
    (interactive)
    (delete-other-windows)
    (find-file maf-ledger-file)
    (ledger-report "Balance Sheet" nil)
    (other-window 1)
    (message nil))
  :custom
  (ledger-default-date-format "%Y-%m-%d")
  (ledger-reports
   '(("Balance Sheet" "%(binary) -f %(ledger-file) bal Assets Liabilities")
     ("Income Statement" "%(binary) -f %(ledger-file) bal Income Expenses -p 'this month'" )
     ("Register" "%(binary) -f %(ledger-file) reg")))
  :hook
  (ledger-mode . save-place-mode))

(use-package magit
  :ensure t)

(use-package markdown-mode
  :ensure t)

;;; Third party: minor modes

(use-package consult
  :ensure t)

(use-package corfu
  :ensure t
  :config
  (corfu-history-mode 1)
  (corfu-popupinfo-mode 1)
  (global-corfu-mode 1)
  :custom
  (corfu-cycle t))

(use-package dired-preview
  :ensure t
  :custom
  (dired-preview-delay 0)
  :config
  (dired-preview-global-mode 1))

(use-package evil
  :ensure t
  :defer t
  :init
  (setq evil-disable-insert-state-bindings t)
  :custom
  (evil-default-state 'emacs)
  (evil-want-C-i-jump nil) ; make TAB work for org-cycle
  (evil-want-C-u-scroll t)
  :config
  (evil-set-initial-state 'text-mode 'normal)
  (evil-set-initial-state 'prog-mode 'normal)
  (evil-set-initial-state 'calendar-mode 'emacs)
  (evil-set-initial-state 'eshell-mode 'emacs)
  (evil-set-initial-state 'help-mode 'emacs)
  (evil-set-initial-state 'Buffer-menu-mode 'emacs)
  (evil-set-initial-state 'Info-mode 'emacs)

  (defvar-keymap maf-spc-spc-map
    :doc "Second layer keymap."
    "b" 'buffer-menu)

  (defvar-keymap maf-spc-map
    :doc "First layer keymap."
    "SPC" maf-spc-spc-map
    "b" 'switch-to-buffer
    "c" 'org-ctrl-c-ctrl-c
    "d" 'dired-jump
    "f" 'find-file
    "g" 'magit
    "j" 'consult-buffer
    "k" 'consult-org-heading
    "l" 'consult-line
    "n" 'display-line-numbers-mode
    "o" 'olivetti-mode
    "s" 'save-buffer
    "t" 'modus-themes-toggle
    "u" 'universal-argument ; C-u set to evil-scroll-up
    "w" 'visual-line-mode)

  (evil-define-key '(normal motion visual) 'global
    (kbd "RET") nil ; unset RET to use with org-return-follows-link
    (kbd "SPC") maf-spc-map))

(use-package logos
  :ensure t
  :custom
  (logos-hide-fringe t)
  (logos-hide-mode-line t)
  (logos-olivetti t))

(use-package marginalia
  :ensure t
  :config
  (marginalia-mode 1))

(use-package olivetti
  :delight
  :ensure t
  :custom
  (olivetti-body-width 100)
  (olivetti-style t))

(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless))
  (completion-category-overrides '((file (styles basic partial-completion)))))

(use-package vertico
  :ensure t
  :custom
  (vertico-cycle t)
  :config
  (vertico-mode 1))

;;; Third party: no mode

(use-package delight
  :ensure t
  :config
  (delight 'abbrev-mode nil "abbrev")
  (delight 'eldoc-mode nil "eldoc")
  (delight 'org-indent-mode nil "org-indent")
  (delight 'outline-minor-mode nil "outline"))

(use-package doric-themes
  :ensure t)

(use-package ef-themes
  :ensure t)

(use-package nerd-icons
  :ensure t)

(use-package nerd-icons-completion
  :ensure t
  :after marginalia
  :config
  (add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup))

(use-package nerd-icons-corfu
  :ensure t
  :if (display-graphic-p)
  :after corfu
  :config
  (add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter))

(use-package nerd-icons-dired
  :delight
  :ensure t
  :hook
  (dired-mode . nerd-icons-dired-mode))

(use-package standard-themes
  :ensure t)

