;; Here is the root of your personal configs.
;; Either place config straight in here,
;; such as this colour theme (feel free to change it to your own favourite theme)

;; use blackbored colour theme
(load-file (concat dotfiles-lib-dir "blackbored.el"))
(color-theme-blackbored)

;;Or load external files such as this bindings file:
(load-dotfile "config/bindings.el")

;; set default font
(set-face-attribute 'default nil :font "Inconsolata-8")

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
(setq emms-source-file-default-directory "~/Windows/Music")

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