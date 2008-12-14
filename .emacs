;; set the load path for plugins
(add-to-list 'load-path
	     "~/.emacs.d")

;; Add snippets
(require 'yasnippet)
(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")

;; Set line numbers
;;(linum-mode 1)

;; Always do syntax hightlighting
(global-font-lock-mode 1)

;; Also hightlight parens
(setq show-paren-delay 0
      show-paren-style 'parenthesis)
(show-paren-mode 1)

;; Set scheme implementation
(setq scheme-program-name "scm")

;; Set the keys the way that I like
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-x\C-k" 'kill-region)
(global-set-key "\C-cs" 'shell)
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\C-c\C-c" 'clipboard-kill-ring-save)
(global-set-key "\C-c\C-v" 'clipboard-yank)
(global-set-key "\C-c\C-x" 'clipboard-kill-region)
(global-set-key "\M-g" 'goto-line)

;; Configure Apperance
(set-frame-width (selected-frame) 165)
(set-frame-height (selected-frame) 450)
;;(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode nil)
(transient-mark-mode 1)


;; Override default text colors
(custom-set-faces
;  '(font-lock-comment-face ((((class color)) (:foreground "firebrick"))))
 '(font-lock-comment-face ((((class color)) (:foreground "green4"))))
 '(region ((((class color)) (:background "wheat"))))
;  '(highlight ((((class color)) (:background "green1"))))
;  '(font-lock-string-face ((((class color)) (:foreground "green4"))))
;  '(font-lock-keyword-face ((((class color)) (:foreground "orange"))))
 '(font-lock-type-face ((((class color)) (:foreground "blue"))))
;  '(font-lock-variable-name-face ((((class color)) (:foreground "brown"))))
;   '(font-lock-function-name-face ((((class color)) (:foreground "royal blue"))))
  '(font-lock-function-name-face ((((class color)) (:foreground "firebrick"))))
)

;; Start a shell
(shell)

;; Ruby                                                                         
;; based on http://www.rubygarden.org/Ruby/page/show/InstallingEmacsExtensions  

(add-to-list 'load-path "~/.emacs.d/site-lisp/ruby")

    (autoload 'ruby-mode "ruby-mode"
      "Mode for editing ruby source files")
    (setq auto-mode-alist
          (append '(("\\.rb$" . ruby-mode)) auto-mode-alist))
    (setq interpreter-mode-alist (append '(("ruby" . ruby-mode))
    				     interpreter-mode-alist))
    (autoload 'run-ruby "inf-ruby"
      "Run an inferior Ruby process")
    (autoload 'inf-ruby-keys "inf-ruby"
      "Set local key defs for inf-ruby in ruby-mode")
    (add-hook 'ruby-mode-hook
          '(lambda ()
             (inf-ruby-keys)
    ))

(autoload 'rubydb "rubydb3x" "Ruby debugger" t)


(defun ruby-eval-buffer () (interactive)
"Evaluate the buffer with ruby."
(shell-command-on-region (point-min) (point-max) "ruby"))

(defun my-ruby-mode-hook ()
(font-lock-mode t)
(setq standard-indent 2) 
;;(pabbrev-mode t)
(ruby-electric-mode t)
(define-key ruby-mode-map "\C-c\C-a" 'ruby-eval-buffer))
(add-hook 'ruby-mode-hook 'my-ruby-mode-hook)


;; Python
;; Double check this
;;(define-key python-mode-map "\C-c\C-r" 'python-send-region)

;; Enable ido-mode
(ido-mode t)
(setq ido-enable-flex-matching t)

;; Enable spell checking
(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'latex-mode-hook 'turn-on-flyspell)
;; flyspell-prog-mode only checks the comments
(add-hook 'c-mode-common-hook 'flyspell-prog-mode)
(add-hook 'python-mode-hook 'flyspell-prog-mode)

(defun turn-on-flyspell ()
   "Force flyspell-mode on using a positive arg.  For use in hooks."
   (interactive)
   (flyspell-mode 1))

;; I kill tabs
(setq-default indent-tab-mode nil)

;; C
(setq c-default-style "bsd"
      c-basic-offset 4)

;;(define-key ido-define-mode-map (kbd \"C-w\") 'ido-delete-backward-updir)

(add-to-list 'load-path "~/.emacs.d/site-lisp/git")
(require 'git)

(add-to-list 'load-path "~/.emacs.d/color-theme")
(require 'color-theme)
(color-theme-initialize)
(color-theme-charcoal-black)

(require 'pabbrev "~/.emacs.d/pabbrev.el")
(global-pabbrev-mode)

