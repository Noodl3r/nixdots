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
       workspaces

       :editor
       (evil +everywhere)
       (format +onsave)

       :emacs
       undo
       (dired +dirvish)

       :checkers
       syntax
       (spell +flyspell)
       grammar

       :term
       eshell
       vterm

       :os
       (:if (featurep :system 'macos) macos)
       (tty +osc)

       :lang
       emacs-lisp
       (cc +lsp +tree-sitter)
       (go +lsp)
       (java +lsp +meghanada)
       markdown
       (python +lsp)
       (sh +lsp)
       lean

       (:if (featurep 'unstraightened) (nix +lsp))

       :tools
       direnv
       magit
       (lsp +eglot)


       :config
       (default +bindings +smartparens))
