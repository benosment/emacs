;; Include the official repo and two unofficial, community-maintained repos
(package-initialize)
(setq package-archives
     '(("gnu" . "http://elpa.gnu.org/packages/")
       ("marmalade" . "http://marmalade-repo.org/packages/")
       ("melpa" . "http://melpa.milkbox.net/packages/")))

;; get rid of the splash screen on startup
(setq inhibit-splash-screen t)
(tool-bar-mode -1)
(scroll-bar-mode -1)

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


;; rebind keys the way that I like them
(global-set-key "\M-g" 'goto-line)
(global-set-key "\M-o" 'other-window)
(global-set-key "\C-w" 'backward-kill-word)
(global-set-key "\C-h" 'backward-delete-char)
(global-set-key "\C-j" 'newline-and-indent)
(global-set-key "\C-x\C-k" 'kill-region)

;; create a code-mode hook, which displays the line number on the side
(add-hook 'my-code-mode-hook
          (lambda () (linum-mode 1)))

;; format the line number to four spaces
(setq linum-format "%5d")

;; activate my code hook for python
(add-hook 'python-mode-hook
          (lambda () (run-hooks 'my-code-mode-hook)))

;; have a mixture of helm and IDO
(ido-mode t)
(setq ido-enable-flex-matching t)

(require 'helm-config)
(helm-mode 1)
(setq helm-mode-fuzzy-match t)
(setq helm-completion-in-region-fuzzy-match t)
(define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action)

(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x f") 'ido-find-file)
(global-set-key (kbd "C-x C-f") 'ido-find-file)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-b") 'helm-mini)

(global-set-key (kbd "C-x g") 'magit-status)
(global-set-key (kbd "C-x e") 'eshell)

(require 'yasnippet)
(yas-global-mode 1)

;; Python specific config
(defun python-shell-send-buffer-no-prompt (&optional arg)
  (python-shell-get-or-create-process "/usr/bin/python3 -i" nil t))

(advice-add 'python-shell-send-buffer :before #'python-shell-send-buffer-no-prompt)

;; Git specific config
(setq magit-push-always-verify nil)

(elpy-enable)
(setq elpy-rpc-python-command "python3")
(setq python-shell-interpreter "python3")
