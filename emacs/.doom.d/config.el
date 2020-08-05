;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Helder Burato Berto"
      user-mail-address "helder.burato@gmail.com")

(display-time-mode 1)
(display-battery-mode 1)
(toggle-frame-maximized)

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))
(setq doom-font (font-spec :family "Hack" :size 13))
(setq doom-big-font (font-spec :family "Hack" :size 20))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(after! org
  :config
  (setq org-log-done 'time)
  (setq org-clock-persist 'history)
  (setq org-directory "~/org/")
  (setq org-log-into-drawer t)

  (setq org-todo-keywords
    '((sequence "TODO(t)" "INPROGRESS(i!)" "HOLD(h@/!)" "|" "DONE(d!)" "CANCELLED(c@/!)"))
    org-todo-keyword-faces
    '(("TODO" :foreground "#8be9fd" :weight normal :underline t)
       ("INPROGRESS" :foreground "#bd93f9" :weight normal :underline t)
       ("HOLD" :foreground "#f1fa8c" :weight normal :underline t)
       ("DONE" :foreground "#50fa7b" :weight normal :underline t)
       ("CANCELLED" :foreground "#ff5555" :weight normal :underline t)))

  (setq org-capture-templates
    '(
       ("n" "Note" entry (file +org-capture-notes-file)
         "* %^{DESCRIPTION} \nEntered on %U\n%? %i\n  %a")
       ("t" "Todo" entry (file+olp+datetree +org-capture-todo-file "Inbox")
         "* TODO %?\n  %i\n  %a")
       ("s" "Snippet" entry (file "snippets.org")
         "* %^{DESCRIPTION} %^g \n#+begin_src %^{LANG}\n%?%i\n#+end_src")
       ("c" "Changelog" entry (file+headline +org-capture-project-changelog-file "Unreleased")
         "* %U %?\n%i\n%a")
       ("j" "Journal" entry (file+olp+datetree +org-capture-journal-file)
         "* %U %?\n%i\n%a" :prepend t))
    ))
