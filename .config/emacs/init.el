;;; -*- lexical-binding: t; -*-

;;; Preliminary

(modify-frame-parameters nil '((undecorated t)))
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file :no-error-if-file-is-missing)
(load "~/vc/dotfiles-private/init-private.el")

(defun display-startup-echo-area-message ()
  (message nil))

(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

;;; Built-in

;;;; enable/disable modes

(require 'org)
(column-number-mode 1)
(electric-pair-mode 1)
(global-auto-revert-mode 1)
(global-visual-line-mode 1)
(menu-bar-mode -1)
(savehist-mode 1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(which-key-mode 1)

;;;; options

(setopt blink-cursor-mode nil
	auto-save-default nil
	calendar-date-style 'iso
	compilation-window-height 8
	dabbrev-case-replace nil
	delete-by-moving-to-trash t
	dired-auto-revert-buffer #'dired-directory-changed-p
	dired-dwim-target t
	dired-free-space nil
	dired-kill-when-opening-new-dired-buffer t
	dired-listing-switches "-AGFhlv --group-directories-first --time-style=long-iso"
	display-buffer-alist '(("\\*Buffer List\\*" (display-buffer-same-window)))
	eglot-autoshutdown t
	inhibit-startup-screen t
	initial-scratch-message nil
	isearch-lazy-count t
	lazy-count-prefix-format "(%s/%s) "
	make-backup-files nil
	modus-themes-bold-constructs t
	modus-themes-common-palette-overrides '((bg-prose-block-delimiter bg-inactive))
	modus-themes-italic-constructs t
	org-M-RET-may-split-line '((default . nil))
	org-agenda-clockreport-parameter-plist '(:link t :maxlevel 2 :fileskip0 t)
	org-agenda-skip-deadline-if-done t
	org-agenda-skip-deadline-prewarning-if-scheduled t
	org-deadline-warning-days 0
	org-agenda-files (list org-directory)
	org-edit-src-content-indentation 0
	org-hide-emphasis-markers t
	org-insert-heading-respect-content t
	org-log-done 'time
	org-log-into-drawer t
	org-return-follows-link t
	org-startup-folded 'content
	org-structure-template-alist '(("s" . "src")
				       ("e" . "src emacs-lisp")
				       ("p" . "src c++")
				       ("E" . "export")
				       ("a" . "export ascii")
				       ("h" . "export html")
				       ("l" . "export latex")
				       ("c" . "center")
				       ("C" . "comment")
				       ("q" . "quote")
				       ("v" . "verse")
				       ("x" . "example"))
	project-mode-line t
	ring-bell-function 'ignore
	scroll-conservatively 1 ; Scroll one line at a time
	scroll-margin 8
	sentence-end-double-space nil
	tab-bar-show 1)

;;;; hooks

(add-hook 'dired-mode-hook #'hl-line-mode)
(add-hook 'emacs-lisp-mode-hook #'outline-minor-mode)
(add-hook 'package-menu-mode-hook #'hl-line-mode)

;;; External Packages

;;;; enable/disable modes

(require 'consult)
(corfu-history-mode 1)
(corfu-popupinfo-mode 1)
(denote-rename-buffer-mode 1)
(global-corfu-mode 1)
(vertico-mode 1)

;;;; options

(setopt completion-category-overrides '((file (styles basic partial-completion)))
	completion-styles '(orderless)
	corfu-cycle t
	dired-preview-delay 0
	ef-themes-bold-constructs t
	ef-themes-italic-constructs t
	elfeed-db-directory "~/.config/emacs/elfeed"
	ledger-default-date-format "%Y-%m-%d"
	ledger-reports '(("Balance Sheet" "%(binary) -f %(ledger-file) bal Assets Liabilities")
			 ("Income Statement" "%(binary) -f %(ledger-file) bal Income Expenses -p 'this month'" )
			 ("Register" "%(binary) -f %(ledger-file) reg"))
	logos-hide-fringe t
	logos-hide-mode-line t
	logos-olivetti t
	marginalia-mode t
	olivetti-body-width 100
	olivetti-style t
	standard-themes-bold-constructs t
	standard-themes-italic-constructs t
	vertico-cycle t)

(add-to-list 'corfu-margin-formatters #'nerd-icons-corfu-formatter)
(delight 'abbrev-mode nil "abbrev")
(delight 'eldoc-mode nil "eldoc")
(delight 'nerd-icons-dired-mode nil "nerd-icons-dired")
(delight 'olivetti-mode nil "olivetti")
(delight 'org-indent-mode nil "org-indent")
(delight 'outline-minor-mode nil "outline")
(delight 'visual-line-mode nil "simple")
(delight 'which-key-mode nil "which-key")

;;;; hooks

(add-hook 'dired-mode-hook #'denote-dired-mode)
(add-hook 'dired-mode-hook #'nerd-icons-dired-mode)
(add-hook 'ledger-mode-hook #'save-place-mode)
(add-hook 'marginalia-mode-hook #'nerd-icons-completion-marginalia-setup)

;;; Functions

(defun maf-ledger ()
  "Open ledger file and ledger-report windows."
  (interactive)
  (delete-other-windows)
  (find-file maf-ledger-file)
  (ledger-report "Balance Sheet" nil)
  (other-window 1)
  (message nil))

(defun maf-org-toggle-emphasis-markers ()
  "Toggle visibility of org emphasis markers."
  (interactive)
  (setq org-hide-emphasis-markers (not org-hide-emphasis-markers))
  (font-lock-update))

;;; Keys

(keymap-global-set "<f8>" 'recompile)
(keymap-global-set "C-<f8>" 'compile)
(keymap-global-set "<f9>" 'maf-ledger)
(keymap-global-set "C-c a" 'org-agenda)
(keymap-global-set "C-c c" 'org-capture)
(keymap-global-set "C-c j" 'consult-buffer)
(keymap-global-set "C-c l" 'consult-line)
(keymap-global-set "C-c n" 'display-line-numbers-mode)
(keymap-global-set "C-c o" 'olivetti-mode)
(keymap-set dired-mode-map "C-c p" #'dired-preview-mode)
(keymap-set org-mode-map "C-c i" 'org-indent-mode)
(keymap-set org-mode-map "C-c k" 'consult-org-heading)
(keymap-set org-mode-map "C-c m" 'maf-org-toggle-emphasis-markers)
(keymap-set outline-minor-mode-map "<f5>" 'outline-cycle) ;; <f5> is used instead of <tab> to preserve indent-for-tab-command
(keymap-set outline-minor-mode-map "<backtab>" 'outline-cycle-buffer)
