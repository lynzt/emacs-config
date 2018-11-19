(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(use-package evil-visualstar
  :ensure t
  :init
  (global-evil-visualstar-mode 1))

(use-package evil-nerd-commenter
  :ensure t
  :bind
  ("M-;" . evilnc-comment-or-uncomment-lines))

(setq evil-insert-state-cursor '((bar . 3) "#a6e22e")
      evil-normal-state-cursor '(box "#fd971f")
      evil-visual-state-cursor '(box "#f92672")
      evil-replace-state-cursor '(hollow "#a6e22e")
      evil-operator-state-cursor '((hbar . 4) "#66d9ef")
)

(setq backup-by-copying t
backup-directory-alist '(("." . "~/.backups/emacs/"))
delete-old-versions t
kept-new-versions 6
kept-old-versions 2
version-control t
create-lockfiles nil)

(when window-system (set-frame-size (selected-frame) 120 60))

(line-number-mode 1)
  (column-number-mode 1)
;  (add-hook 'prog-mode-hook #'display-line-numbers-mode)
  (setq-default display-line-numbers 'visual)

(use-package mark-multiple
  :ensure t
  :bind ("C-c q" . 'mark-next-like-this))

(use-package expand-region
  :ensure t
  :bind ("C-q" . er/expand-region))

(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated. However, if
there's a region, all lines that region covers will be duplicated."
  (interactive "p")
  (let (beg end (origin (point)))
    (if (and mark-active (> (point) (mark)))
	(exchange-point-and-mark))
    (setq beg (line-beginning-position))
    (if mark-active
	(exchange-point-and-mark))
    (setq end (line-end-position))
    (let ((region (buffer-substring-no-properties beg end)))
(dotimes (i arg)
	(goto-char end)
	(newline)
	(insert region)
	(setq end (point)))
(goto-char (+ origin (* (length region) arg) arg)))))
(global-set-key (kbd "C-c d") 'duplicate-current-line-or-region)

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
  :bind* (("C-c b" . beacon-blink))
  :init
  (beacon-mode 1)
  (setq beacon-color "#1d829e"))

(when window-system (global-hl-line-mode t))

(global-prettify-symbols-mode 1)
(add-hook
 'js-mode-hook
 (lambda ()
   (mapc (lambda (pair) (push pair prettify-symbols-alist))
	'(("function" . #x192)
	   ))))

(setq-default cursor-type 'bar)

(tool-bar-mode -1)

(scroll-bar-mode -1)

(setq package-enable-at-startup nil)
(setq ring-bell-function 'ignore)
(setq inhibit-startup-screen t)
(setq make-backup-file nil)
(setq auto-save-default nil)

(use-package diminish
  :ensure t
  :init
  (diminish 'beacon-mode)
  (diminish 'rainbow-mode)
  (diminish 'which-key-mode)
  (diminish 'global-whitespace-mode)
  (diminish 'zoom-mode)
  (diminish 'yas-minor-mode)
  (diminish 'undo-tree-mode)
  (diminish 'prettier-js-mode)
  (diminish 'git-gutter-mode)
  ;; (diminish 'subword-mode)
)

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

(global-auto-revert-mode t)

(use-package avy
  :ensure t
  :bind
  ("M-s" . avy-goto-char))

(defun config-visit()
  (interactive)
  (find-file "~/.emacs.d/config.org"))
(global-set-key
(kbd "C-c e") 'config-visit)

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
  '("a" "s" "d" "f" "w" "e" "r"))
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
  :init
  (global-git-gutter-mode 1)
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
  :bind ("C-c C-d" . docker))

(use-package dockerfile-mode
  :ensure t)

(use-package zoom
  :ensure t
  :init
  (zoom-mode t))

(global-whitespace-mode t)
(setq whitespace-display-mappings
  ;; all numbers are Unicode codepoint in decimal. ⁖ (insert-char 182 1)
  '(
    (space-mark 32 [183] [46]) ; 32 SPACE 「 」, 183 MIDDLE DOT 「·」, 46 FULL STOP 「.」
    (newline-mark 10 [8629 10]) ; 10 LINE FEED
    (tab-mark 9 [9655 9] [92 9]) ; 9 TAB, 9655 WHITE RIGHT-POINTING TRIANGLE 「▷」
    ))

(use-package multiple-cursors
  :ensure t
  :init
  (progn
    (global-set-key (kbd "C-c m") 'mc/edit-lines)
    (global-set-key (kbd "M-d") 'mc/mark-next-like-this)
    ;; (global-set-key (kbd "M-D") 'mc/mark-previous-like-this)
    (global-set-key [(meta shift g)] 'mc/mark-all-like-this)))

(fset 'yes-or-no-p 'y-or-n-p)

(use-package web-mode
  :ensure t
  :mode "\\.jsx$"
  :mode "\\.js\\'"
  :config
  (progn
    (defun my-web-hook ()
      (setq
        web-mode-markup-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-enable-auto-closing t
        web-mode-enable-auto-opening t
        web-mode-enable-auto-pairing t
        web-mode-enable-auto-indentation t))

      (if (equal web-mode-content-type "javascript")
            (web-mode-set-content-type "jsx")
          (message "now set to: %s" web-mode-content-type)))
    (add-hook 'web-mode-hook 'my-web-hook))

(setq-default indent-tabs-mode nil)

(setq-default tab-width 2)
(setq python-indent-level 4)
(setq perl-indent-level 4)
(setq js-indent-level 2)

(use-package emmet-mode
  :ensure t
  :commands emmet-mode
  :init
  (setq emmet-indentation 2)
  (setq emmet-move-cursor-between-quotes t)
  :config
  (add-hook 'sgml-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook 'emmet-mode))

(use-package all-the-icons
  :ensure t)

(use-package neotree
  :ensure t
  :bind ("C-c k" . neotree)
  :config
  (setq neo-dont-be-alone t
        neo-theme 'icons))

(use-package sml-mode
  :ensure t
  :config
  (setq sml/theme 'dark)
  (setq evil-normal-state-tag   (propertize " <N> " 'face '((:background "#fd971f" :foreground "black")))
          evil-emacs-state-tag    (propertize " <E> " 'face '((:background "SkyBlue2"       :foreground "black")))
          evil-insert-state-tag   (propertize " <I> " 'face '((:background "#a6e22e"    :foreground "black")))
          evil-replace-state-tag  (propertize " <R> " 'face '((:background "#a6e22e"      :foreground "black")))
          evil-motion-state-tag   (propertize " <M> " 'face '((:background "plum3"          :foreground "black")))
          evil-visual-state-tag   (propertize " <V> " 'face '((:background "#f92672"           :foreground "black")))
          evil-operator-state-tag (propertize " <O> " 'face '((:background "#66d9ef"    :foreground "black")))))

(use-package prettier-js
  :ensure t
  :config
  (add-hook 'web-mode-hook 'prettier-js-mode))
