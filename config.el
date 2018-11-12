(when window-system (set-frame-size (selected-frame) 120 60))

(global-subword-mode 1)

(line-number-mode 1)
(column-number-mode 1)
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

(use-package mark-multiple
  :ensure t
  :bind ("C-c q" . 'mark-next-like-this))

(use-package expand-region
  :ensure t
  :bind ("C-q" . er/expand-region))

(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank))
(global-set-key (kbd "C-c C-d") 'duplicate-line)

(defun insert-line-below()
  (interactive)
  (move-end-of-line 1)
  (open-line 1)
  (next-line 1))
(global-set-key (kbd "C-c n") 'insert-line-below)

(use-package org-bullets
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode))))

(add-to-list 'org-structure-template-alist
	     '("el" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC"))

(add-hook 'org-mode-hood 'org-indent-mode)

(use-package exwm
  :ensure t
  :config
  (require 'exwm-config)
  (exwm-config-default))

(use-package which-key
    :ensure t
    :init
    
(which-key-mode))

(use-package beacon
  :ensure t
  :init
  (beacon-mode 1)
  (setq beacon-color "#1d829e"))

(when window-system (global-hl-line-mode t))

(use-package pretty-mode
  :ensure t
  :config
  (global-pretty-mode t))

(tool-bar-mode -1)

(scroll-bar-mode -1)

(setq package-enable-at-startup nil)
(setq ring-bell-function 'ignore)
(setq inhibit-startup-screen t)
(setq make-backup-file nil)
(setq auto-save-default nil)

(use-package spaceline
  :ensure t
  :config
  (require 'spaceline-config)
  (setq powerline-default-separator (quote arrow))
  (spaceline-spacemacs-theme))

(use-package diminish
  :ensure t
  :init
  (diminish 'beacon-mode)
  (diminish 'rainbow-mode) 
  (diminish 'which-key-mode))

(setq ido-enable-flex-matching nil)
(setq ido-create-new-buffer 'always)
(setq ido-everywehre t)
(ido-mode 1)

(use-package ido-vertical-mode
  :ensure t
  :init
  (ido-vertical-mode 1))
(setq ido-vertical-define-keys 'C-n-and-C-p-only)

(use-package smex
  :ensure t
  :init (smex-initialize)
  :bind
  ("M-x" . smex))

(global-set-key (kbd "C-x C-b") 'ido-switch-buffer)

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents . 10)))
  (setq dashboard-banner-logo-title "Don't wait. The time will never be just right"))

(global-set-key (kbd "C-x b") 'ibuffer)

(use-package avy
  :ensure t
  :bind
  ("M-s" . avy-goto-char))

(defun config-visit()
  (interactive)
  (find-file "~/.emacs.d/config.org"))
(global-set-key (kbd "C-c e") 'config-visit)

(defun config-reload()
  (interactive)
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))
(global-set-key (kbd "C-c r") 'config-reload)

(use-package rainbow-mode
  :ensure t
  :init (add-hook 'prog-mode-hook 'rainbow-mode))

(use-package rainbow-delimiters
  :ensure t
  :init
  (rainbow-delimiters-mode 1))

(use-package switch-window
  :ensure t
  :config
  (setq switch-window-input-style 'minibuffer)
  (setq switch-window-increase 4)
  (setq switch-window-threshold 2)
  (setq switch-window-shortcut-style 'qwerty)
  (setq switch-window-qwerty-shortcuts
	'("a" "s" "d" "f" "j" "k" "l"))
  :bind
  ([remap other-window] . switch-window))

(defun split-and-follow-horizontally()
  (interactive)
  (split-window-below)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 2") 'split-and-follow-horizontally)

(defun split-and-follow-vertically()
  (interactive)
  (split-window-right)
  (balance-windows)
  (other-window 1))
(global-set-key (kbd "C-x 3") 'split-and-follow-vertically)

(use-package company
  :ensure t
  :init
  (add-hook 'after-init-hook 'global-company-mode))

(use-package popup-kill-ring
  :ensure t
  :bind ("M-y" . popup-kill-ring))

(use-package swiper
  :ensure t
  :bind ("C-s" . swiper))

(use-package yasnippet
  :ensure t
  :config
  (use-package yasnippet-snippets
    :ensure t)
  (yas-reload-all))
(add-hook 'prog-mode-hook #'yas-minor-mode)

(use-package magit
  :ensure t
  :bind ("C-x g" . magit-status))

(use-package git-gutter
  :ensure t
  :config (global-git-gutter-mode)
  :init
  (progn
    (setq git-gutter:separator-sign " "
	  git-gutter:lighter " GG"))
  :config
  (progn
    (set-face-background 'git-gutter:deleted "#990A1B")
    (set-face-foreground 'git-gutter:deleted "#990A1B")
    (set-face-background 'git-gutter:modified "#00736F")
    (set-face-foreground 'git-gutter:modified "#00736F")
    (set-face-background 'git-gutter:added "#546E00")
    (set-face-foreground 'git-gutter:added "#546E00"))
  :bind (("C-x p" . git-gutter:previous-hunk)
	 ("C-x n" . git-gutter:next-hunk)
	 ("C-x v =" . git-gutter:popup-hunk)
	 ("C-x v r" . git-gutter:revert-hunk)))

(use-package docker
  :ensure t
  :bind ("C-c d" . docker))

(use-package zoom
  :ensure t
  :init
  (zoom-mode t))

(use-package ztree
  :ensure t
  :bind* (("C-c k" . ztree-dir)
    ("C-c b" . ztree-diff))
  :init
  (setq ztree-dir-move-focus t))

(global-whitespace-mode t)
(setq whitespace-display-mappings
  ;; all numbers are Unicode codepoint in decimal. ⁖ (insert-char 182 1)
  '(
    (space-mark 32 [183] [46]) ; 32 SPACE 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
    (newline-mark 10 [8629 10]) ; 10 LINE FEED
    (tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
    ))

(use-package yahoo-weather
  :ensure t
  :init
  (yahoo-weather-mode 1)
  (setq yahoo-weather-location "55407")
  (setq yahoo-weather-use-F t)
  (setq yahoo-weather-temperture-format "%d")
  (setq yahoo-weather-format "[%(weather) %(temperature)(%(wind-chill))°F]"))
