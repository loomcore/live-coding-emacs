;; Here is the root of your personal configs.
;; Either place config straight in here,
;; such as this colour theme (feel free to change it to your own favourite theme)

;; use blackbored colour theme
(load-file (concat dotfiles-lib-dir "blackbored.el"))
(color-theme-blackbored)

;;Or load external files such as this bindings file:
(load-dotfile "config/bindings.el")

;; set default font
(set-face-attribute 'default nil :font "Oxygen Mono-8")

;; tell auctex to output pdfs
(setq TeX-PDF-mode t)

;; markdown-mode
(autoload 'markdown-mode "markdown-mode.el"
   "Major mode for editing Markdown files" t)
(setq auto-mode-alist
   (cons '("\\.md" . markdown-mode) auto-mode-alist))

;; go-mode
(add-to-list 'load-path "../lib/go-mode-load.el" t)
(require 'go-mode-load)

;; emms
(add-to-list 'load-path "~/.emacs.d/lib/emms/")
(require 'emms-setup)
(emms-standard)
(emms-default-players)
(setq emms-source-file-default-directory "~")

;; display time in modeline
(setq display-time-day-and-date t
      display-time-24hr-format t)
(display-time)

;; ecl
(setq inferior-lisp-program "ecl") ; your Lisp system
;;(add-to-list 'load-path "~/hacking/lisp/slime/")  ; your SLIME directory
;;(require 'slime)
(slime-setup)

;; sml-mode
;;(load-dotfile "../lib/sml-mode-startup.elc")
(add-to-list 'load-path "../lib/sml-mode/")
(load "../lib/sml-mode/sml-mode-startup.el")
;;(autoload 'sml-mode "sml-mode" "Major mode for editing SML." t)
;;(autoload 'run-sml "sml-proc" "Run an inferior SML process." t)
;;(add-to-list 'auto-mode-alist '("\\.\\(sml\\|sig\\)\\'" . sml-mode))

;; scheme-complete (for chicken)
(autoload 'scheme-smart-complete "scheme-complete" nil t)
(eval-after-load 'scheme
  '(define-key scheme-mode-map "\e\t" 'scheme-smart-complete))
;; (setq lisp-indent-function 'scheme-smart-indent-function) ;; smarter scheme-complete indentation
(setq scheme-default-implementation 'chicken)
(setq scheme-program-name "csi -:c")

;; prolog mode (no longer automatic, to distinguish from cperl-mode)
;;(setq auto-mode-alist
;;      (append
;;       '(("\\.pl" . prolog-mode))
;;       auto-mode-alist))
(setq prolog-program-name "swipl")
(setq prolog-consult-string "[user].\n")
;If you want this.  Indentation is either poor or I don't use
;it as intended.
;(setq prolog-indent-width 8)

(global-set-key (kbd "<f12>") (lambda nil (interactive) (shell-command "acpi")))

;; picolisp-mode
(add-to-list 'load-path "/home/phil/.emacs.d/lib/picoLisp/lib/el")
(load "tsm.el") ;; Picolisp TransientSymbolsMarkup (*Tsm)
(autoload 'run-picolisp "inferior-picolisp")
(autoload 'picolisp-mode "picolisp" "Major mode for editing Picolisp." t)
(setq picolisp-program-name "pil +")

(add-to-list 'auto-mode-alist '("\\.l$" . picolisp-mode))

(add-hook 'picolisp-mode-hook
   (lambda ()
;;      (paredit-mode +1) ;; Loads paredit mode automatically
      (tsm-mode) ;; Enables TSM
      (define-key picolisp-mode-map (kbd "RET") 'newline-and-indent)))
;;      (define-key picolisp-mode-map (kbd "C-h") 'paredit-backward-delete) ) )

;; erlang-mode
(setq load-path (cons  "/usr/lib/erlang/lib/tools-2.6.8/emacs"
      load-path))
      (setq erlang-root-dir "/usr/lib/erlang")
      (setq exec-path (cons "/usr/lib/erlang/bin" exec-path))
      (require 'erlang-start)

(add-to-list 'auto-mode-alist '("\\.\\(erl\\|hrl\\)\\'" . erlang-mode))

(require 'erlang-flymake)

;; python-mode
(add-to-list 'load-path "/home/phil/.emacs.d/lib/python-mode/")
(setq py-install-directory "/home/phil/.emacs.d/lib/python-mode/")
(require 'python-mode)
(setq py-shell-name "/usr/bin/python2.7")

;; pymacs config
(autoload 'pymacs-apply "pymacs")
(autoload 'pymacs-call "pymacs")
(autoload 'pymacs-eval "pymacs" nil t)
(autoload 'pymacs-exec "pymacs" nil t)
(autoload 'pymacs-load "pymacs" nil t)
(autoload 'pymacs-autoload "pymacs")
;;(eval-after-load "pymacs"
;;  '(add-to-list 'pymacs-load-path YOUR-PYMACS-DIRECTORY"))

;; ropemacs config
(require 'pymacs)
(pymacs-load "ropemacs" "rope-")

;; ryan mcguire's python-mode customisations
(autoload 'python-mode "python-mode" "Python Mode." t)
(add-to-list 'auto-mode-alist '("\\.py\\'" . python-mode))
(add-to-list 'interpreter-mode-alist '("python" . python-mode))
(setq interpreter-mode-alist
      (cons '("python" . python-mode)
            interpreter-mode-alist)
      python-mode-hook
      '(lambda () (progn
                    (set-variable 'py-indent-offset 4)
                    (set-variable 'py-smart-indentation nil)
                    (set-variable 'indent-tabs-mode nil)
                    ;;(highlight-beyond-fill-column)
                    (define-key python-mode-map "\C-m" 'newline-and-indent)
                    ;;(pabbrev-mode)
                    (abbrev-mode)
         )
      )
)

;; ledger-mode
;; (load "ldg-new")
(add-to-list 'load-path "/home/phil/.emacs.d/lib/ledger/")
(load "ledger")

;; replace perl-mode with cperl-mode
(defalias 'perl-mode 'cperl-mode)