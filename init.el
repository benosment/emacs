;; Include the official repo and two unofficial, community-maintained repos
(package-initialize)
(setq package-archives
     '(("gnu" . "http://elpa.gnu.org/packages/")
       ("marmalade" . "http://marmalade-repo.org/packages/")
       ("melpa" . "http://melpa.milkbox.net/packages/")))

;; get rid of the splash screen on startup
(setq inhibit-splash-screen t)

;; display the line and column number
(setq line-number-mode t)
(setq column-number-mode t)

;; highlight selection
(transient-mark-mode t)

;; no tabs
(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq indent-line-function 'insert-tab)

;; turn on org-mode and auto-fill mode for default
(add-hook 'org-mode-hook 'turn-on-auto-fill)

;; cleanup whitespace before saving
(add-hook 'before-save-hook 'whitespace-cleanup)

;; mark the atom one dark theme as safe
(custom-set-variables
 '(custom-safe-themes
   (quote
    ("12722541c8998f056b761bf63a92216aaf4610e4eb1afe7991842a31fa28b6d8" default))))
(custom-set-faces
 )

;; Use the atom one dark theme
(load-theme 'atom-one-dark)

;; enable ido mode for better buffer matching
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)

;; rebind keys the way that I like them
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-o" 'other-window)

;; create a code-mode hook, which displays the line number on the side
(add-hook 'my-code-mode-hook
          (lambda () (linum-mode 1)))

;; format the line number to four spaces
(setq linum-format "%5d")

;; activate my code hook for python
(add-hook 'python-mode-hook
          (lambda () (run-hooks 'my-code-mode-hook)))
