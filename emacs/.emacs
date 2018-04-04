(eval-when-compile (require 'cl))
(require 'package)
(setq package-archives
      '(("org"       . "http://orgmode.org/elpa/")
        ("melpa"     . "https://melpa.org/packages/")
        ("gnu"       . "http://elpa.gnu.org/packages/")
        ("marmalade" . "http://marmalade-repo.org/packages/")))
(setq package-enable-at-startup nil)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(require 'use-package)

(add-to-list 'load-path "~/.emacs.d/local")

;; General Packages
;;; Helm
(use-package helm :ensure t)
(use-package helm-ls-git :ensure t)
(use-package helm-descbinds :ensure t
  :config (helm-descbinds-mode))

(use-package helm-company :ensure t :defer t
  :init
  (with-eval-after-load 'company
    (define-key company-active-map (kbd "C-/") 'helm-company)))

(use-package helm-ag :ensure t :defer t)
(use-package helm-flx :ensure t)
(use-package helm-projectile :ensure t)
(use-package helm-make :ensure t)
(use-package helm-gitignore :ensure t)

;;; Undotree
(use-package undo-tree :ensure t
  :init (setq undo-tree-auto-save-history t))

;;; Git gutter
(use-package git-gutter :ensure t
  :commands (global-git-gutter-mode git-gutter-mode)
  :init
  (progn
    (global-git-gutter-mode t)
    (git-gutter:linum-setup)
    (setq git-gutter:update-interval 2
          git-gutter:modified-sign " "
          git-gutter:added-sign "+"
          git-gutter:deleted-sign "-"
          git-gutter:diff-option "-w"
          git-gutter:hide-gutter t
          git-gutter:ask-p nil
          git-gutter:verbosity 0
          git-gutter:handled-backends '(git hg bzr svn)
          git-gutter:hide-gutter t)))

;;; Rainbow mode
(use-package rainbow-mode :ensure t :defer t)

;;; Interactive align
(use-package ialign :ensure t :defer t)

;;; Popup kill ring
(use-package popup-kill-ring :ensure t)

;;; Smartparens
(use-package smartparens :ensure t
  :init
  (add-hook 'clojure-mode-hook #'smartparens-mode)
  (add-hook 'emacs-lisp-mode-hook #'smartparens-mode)
  (add-hook 'common-lisp-mode-hook #'smartparens-mode)
  (add-hook 'scheme-mode-hook #'smartparens-mode)
  (add-hook 'lisp-mode-hook #'smartparens-mode))

(sp-with-modes 'emacs-lisp-mode
  ;; disable ', it's the quote character!
  (sp-local-pair "'" nil :actions nil)
  ;; also only use the pseudo-quote inside strings where it
  ;; serves as hyperlink.
  (sp-local-pair "`" "'" :when '(sp-in-string-p sp-in-comment-p)))

;;; Parinfer
(use-package parinfer
  :ensure t
  :init
  (progn
    (setq parinfer-extensions
          '(defaults       ; should be included.
             evil           ; If you use Evil.
             smart-tab      ; C-b & C-f jump positions and smart shift with tab & S-tab.
             smart-yank))   ; Yank behavior depend on mode.
    (add-hook 'clojure-mode-hook #'parinfer-mode)
    (add-hook 'emacs-lisp-mode-hook #'parinfer-mode)
    (add-hook 'common-lisp-mode-hook #'parinfer-mode)
    (add-hook 'scheme-mode-hook #'parinfer-mode)
    (add-hook 'lisp-mode-hook #'parinfer-mode)
    :config
    (setq parinfer-auto-switch-indent-mode t)))

;;; Evil!
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration nil)
  (setq evil-want-fine-undo t)
  (setq evil-want-C-i-jump nil)
  (setq evil-move-beyond-eol t))

(use-package evil-leader
  :ensure t
  :config
  (global-evil-leader-mode)
  (evil-leader/set-leader "<SPC>"))

(use-package evil-collection :ensure t
  :after evil
  :config
  (evil-collection-init))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode t))

(use-package evil-matchit
  :ensure t
  :config
  (global-evil-matchit-mode t))

(use-package evil-visual-mark-mode
  :ensure t
  :config
  (evil-visual-mark-mode))

(use-package evil-args
  :ensure t)

(use-package evil-visualstar
  :ensure t
  :config
  (global-evil-visualstar-mode t))

(use-package evil-escape
  :ensure t
  :diminish
  (evil-escape-mode)
  :config
  (evil-escape-mode)
  (setq-default evil-escape-key-sequence "zx"
                evil-escape-delay 0.2)
  (setq evil-escape-unordered-key-sequence t))

(use-package evil-magit :ensure t)

(use-package evil-terminal-cursor-changer :ensure t
  :unless (display-graphic-p)
  :config (evil-terminal-cursor-changer-activate))

(use-package evil-cleverparens :ensure t
  :init
  (add-hook 'emacs-lisp-mode-hook       #'evil-cleverparens-mode)
  (add-hook 'eval-expression-minibuffer-setup-hook #'evil-cleverparens-mode)
  (add-hook 'ielm-mode-hook             #'evil-cleverparens-mode)
  (add-hook 'lisp-mode-hook             #'evil-cleverparens-mode)
  (add-hook 'lisp-interaction-mode-hook #'evil-cleverparens-mode)
  (add-hook 'scheme-mode-hook           #'evil-cleverparens-mode))

(use-package evil-commentary :ensure t
  :config
  (evil-commentary-mode))

(use-package evil-tmux-navigator)

(evil-mode 1)

;;; Flycheck
(use-package flycheck :ensure t
  :init
  (global-flycheck-mode)
  (when (fboundp 'define-fringe-bitmap)
    (define-fringe-bitmap 'cust-flycheck-bitmap
      (vector #b00000000
              #b00000000
              #b00000000
              #b00000000
              #b00000000
              #b00000000
              #b00000000
              #b00011100
              #b00111110
              #b00111110
              #b00111110
              #b00011100
              #b00000000
              #b00000000
              #b00000000
              #b00000000
              #b00000000)))
  (flycheck-define-error-level 'error
    :severity 2
    :overlay-category 'flycheck-error-overlay
    :fringe-bitmap 'cust-flycheck-bitmap
    :fringe-face 'flycheck-fringe-error)
  (flycheck-define-error-level 'warning
    :severity 1
    :overlay-category 'flycheck-warning-overlay
    :fringe-bitmap 'cust-flycheck-bitmap
    :fringe-face 'flycheck-fringe-warning)
  (flycheck-define-error-level 'info
    :severity 0
    :overlay-category 'flycheck-info-overlay
    :fringe-bitmap 'cust-flycheck-bitmap
    :fringe-face 'flycheck-fringe-info)
  (defun close-flycheck ()
    (interactive)
    (-if-let (window (flycheck-get-error-list-window))
        (quit-window nil window) ())))

(use-package flycheck-pos-tip :ensure t :defer t
  :init
  (with-eval-after-load 'flycheck
    (flycheck-pos-tip-mode)))

;;; Spell checking
(use-package flyspell :ensure t :defer t
  :init
  (add-hook 'prog-mode-hook 'flyspell-prog-mode)
  (add-hook 'text-mode-hook 'flyspell-mode)
  (setq flyspell-issue-message-flag nil))

(use-package flyspell-correct :ensure t
  :commands (flyspell-correct-word-generic
             flyspell-correct-previous-word-generic))

(use-package flyspell-correct-helm :ensure t
  :commands (flyspell-correct-helm)
  :init
  (setq flyspell-correct-interface #'flyspell-correct-helm))

(use-package auto-dictionary :ensure t :defer t
  :init
  (add-hook 'flyspell-mode-hook 'auto-dictionary-mode))


;;; Restart Emacs
(use-package restart-emacs :ensure t)

;;; Relative linum
(use-package linum-relative :ensure t :init
  :config
  (setq linum-relative-format "%3s ")
  (setq linum-relative-current-symbol ""))
;;; Once Emacs 26 is out
;;; (setq linum-relative-backend 'display-line-numbers-mode)

;;; Indentation guides
(use-package highlight-indent-guides :ensure t
  :init
  :config
  (setq highlight-indent-guides-method 'character)
  (add-hook 'prog-mode-hook 'highlight-indent-guides-mode))

;;; Projectile
(use-package projectile :ensure t)

;;; Drag-stuff
(use-package drag-stuff :ensure t
  :config
  (drag-stuff-global-mode t)
  (drag-stuff-define-keys))

;;; Zoom
(use-package zoom :ensure t)

;;; Magit
(use-package magit :ensure t)

;;; which-key
(use-package which-key
  :ensure t
  :config
  (which-key-mode)
  (which-key-setup-side-window-bottom)
  (setq which-key-sort-order 'which-key-key-order-alpha)
  (setq which-key-popup-type 'side-window
        which-key-side-window-max-width 0.33
        which-key-idle-delay 0.5))

;;; Company
(use-package company
  :ensure t
  :config
  (global-company-mode)
  (setq company-idle-delay 0.2
        company-minimum-prefix-length 2
        company-require-match nil
        company-dabbrev-ignore-case nil
        company-dabbrev-downcase nil)
  (setq company-selection-wrap-around t)
  (define-key company-active-map [?\r] 'company-complete)
  (define-key company-active-map [tab] 'company-select-next)
  (define-key company-active-map [S-tab] 'company-select-previous))

(use-package company-quickhelp :ensure t
  :config
  (company-quickhelp-mode))

(use-package fuzzy :ensure t :defer t)

;; Languages
;;; OCaml
;;;; OCP-indent
(eval-and-compile
  (defun opam-share ()
    (substring
     (shell-command-to-string "opam config var share 2> /dev/null")
     0 -1)))

(use-package ocp-indent :defer t :ensure t
  :load-path (lambda () ( concat ( opam-share ) "/emacs/site-lisp")))


;;;; Tuareg
(use-package tuareg :defer t :ensure t
  :config
  (add-hook 'tuareg-mode-hook
            (lambda () (setq indent-line-function 'ocp-indent-line))))

;;; Python
(use-package python-mode :defer t :ensure t)

;;; Markdown
(use-package markdown-mode :defer t :ensure t)

;;; LaTeX
(use-package auctex :defer t :ensure t
  :config
  (setq TeX-PDF-mode   t
        TeX-auto-save  t
        TeX-parse-self t)
  (setq-default TeX-master nil))

;; Theming and Interface

;;; Powerline
(use-package powerline :ensure t)

(use-package powerline-evil :ensure t)

(use-package airline-themes :ensure t
  :config (load-theme 'airline-distinguished t))

;;; Theme
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'happy-hacking t)

;;; Rainbow delimiters
(use-package rainbow-delimiters :ensure t
  :config (add-hook 'prog-mode-hook #'rainbow-delimiters-mode))

;;; Focus
(use-package focus :ensure t)

;;; Golden ratio
(use-package golden-ratio :ensure t
  :init
  (golden-ratio-mode 1)
  (add-to-list 'golden-ratio-extra-commands 'tmux-nav-left)
  (add-to-list 'golden-ratio-extra-commands 'tmux-nav-right)
  (add-to-list 'golden-ratio-extra-commands 'tmux-nav-up)
  (add-to-list 'golden-ratio-extra-commands 'tmux-nav-down))

;; Interface Settings
(tool-bar-mode -1)
(scroll-bar-mode -1)
(blink-cursor-mode -1)
(menu-bar-mode -1)
(savehist-mode)
(show-paren-mode)
(column-number-mode)
(linum-relative-global-mode)
(setq inhibit-startup-screen t)
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; Misc behavior settings
(setq
 vc-follow-symlinks t
 x-select-enable-clipboard t
 ;; make-backup-files nil
 coding-system-for-read 'utf-8
 coding-system-for-write 'utf-8)
(save-place-mode 1)

;; Defaults
(setq-default
 show-trailing-whitespace t
 indent-tabs-mode nil)

(setq tab-width 2)
(defvaralias 'c-basic-offset 'tab-width)
(defvaralias 'cperl-indent-level 'tab-width)

;; Evil settings
(setq evil-insert-state-cursor  '("#268bd2" bar)  ;; blue
      evil-normal-state-cursor  '("#b58900" box)  ;; blue
      evil-visual-state-cursor  '("#cb4b16" box)  ;; orange
      evil-replace-state-cursor '("#859900" hbar) ;; green
      evil-emacs-state-cursor   '("#d33682" box)) ;; magenta

;; Keybindings
(evil-leader/set-key
  "q"  'kill-emacs
  "w"  'save-buffer
  "d"  'kill-buffer-and-window
  "x"  'save-buffers-kill-terminal
  "a"  'previous-buffer
  "s"  'next-buffer
  "k"  'delete-window
  "z=" 'flyspell-auto-correct-word
  "bb" 'helm-buffers-list
  "bl" 'last-buffer
  "ff" 'helm-find-files
  "fr" 'helm-recentf
  "fh" 'helm-apropos
  "gi" 'helm-gitignore
  "gs" 'magit-status
  "gc" 'magit-commit
  "gp" 'magit-push
  "gl" 'magit-pull
  "eo" 'flycheck-list-errors
  "ec" 'close-flycheck)

;; Start the server
(server-start)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-quickhelp company zoom which-key use-package tuareg restart-emacs rainbow-delimiters python-mode projectile powerline-evil popup-kill-ring parinfer ocp-indent markdown-mode linum-relative ialign highlight-indent-guides helm-ls-git helm-descbinds general focus evil-visualstar evil-visual-mark-mode evil-terminal-cursor-changer evil-surround evil-matchit evil-magit evil-leader evil-escape evil-commentary evil-collection evil-cleverparens evil-args drag-stuff auctex airline-themes))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
