(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(unless (package-installed-p 'spacemacs-theme)
  (package-refresh-contents)
  (package-install 'spacemacs-theme))


(when (file-readable-p "~/.emacs.d/config.org")
  (org-babel-load-file (expand-file-name "~/.emacs.d/config.org")))

;;;;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (spacemacs-dark)))
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" default)))
 '(package-selected-packages
   (quote
    (evil-collection evil-nerd-commenter evil-visualstar evil all-the-fonts all-the-icons evil-matchit emmet-mode web-mode multiple-cursors yahoo-weather zoom docker git-gutter magit yasnippet-snippets yasnippet pretty-mode expand-region mark-multiple swiper popup-kill-ring dashboard rainbow-delimiters emacs-lisp exwm diminish spaceline switch-window rainbow-mode avy helm helm-config smex ido-vertical-mode ido-verticle-mode beacon spacemacs-theme zenburn-theme which-key use-package try projectile org neotree monokai-theme monokai-alt-theme molokai-theme hc-zenburn-theme company clojure-mode-extra-font-locking cider anti-zenburn-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#292b2e" :foreground "#b2b2b2" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "nil" :family "Droid Sans Mono Dotted for Powerline")))))
