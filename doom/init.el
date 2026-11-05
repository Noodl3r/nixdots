(doom! :completion
       (company +childframe)
       vertico

       :ui
       doom
       dashboard
       modeline
       nav-flash
       ophints
       (popup +defaults)
       window-select
       vc-gutter

       :editor
       (evil +everywhere)
       (format +onsave)

       :emacs
       undo
       dired

       :term
       eshell
       vterm

       :os
       (:if (featurep :system 'macos) macos)
       (tty +osc)

       :lang
       emacs-lisp
       (cc +lsp +tree-sitter)
       (:if (featurep 'unstraightened) (nix +lsp))

       :tools
       direnv
       magit
       (sh +lsp)
       (lsp +eglot)


       :config
       (default +bindings +smartparens))
