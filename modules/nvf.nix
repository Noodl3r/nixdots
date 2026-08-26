# https://nvf.notashelf.dev/
{pkgs, ...}: {
  programs.nvf = {
    enable = true;
    # Your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings.vim = {
      keymaps = import ./keymaps.nix;
      snippets.luasnip = {
        enable = true;
        setupOpts.enable_autosnippets = true;
        customSnippets.snipmate = import ./snippets.nix;
      };
      globals.mapleader = " ";
      lineNumberMode = "relNumber";
      viAlias = true;
      vimAlias = false;
      autopairs.nvim-autopairs.enable = true;
      opts = {
        expandtab = true;
        tabstop = 4;
        shiftwidth = 4;
        signcolumn = "no";
        scrolloff = 6;
        wrap = true;
        linebreak = true;
        breakindent = true;
      };
      visuals = {
        rainbow-delimiters.enable = true;
        indent-blankline.enable = true;
        cinnamon-nvim.enable = true;
        highlight-undo.enable = true;
      };
      spellcheck = {
        enable = true;
      };
      lsp = {
        enable = true;
        formatOnSave = true;
        inlayHints.enable = true;
        lspkind.enable = true;
        trouble.enable = true;
        otter-nvim.enable = true;
        mappings = {
          codeAction = "<leader>ca";
          goToDeclaration = "<leader>gD";
          goToDefinition = "<leader>gd";
          goToType = "<leader>gt";
          nextDiagnostic = "<leader>n";
          previousDiagnostic = "<leader>N";
          renameSymbol = "<leader>gr";
        };
      };
      treesitter = {
        enable = true;
        # The dumb thing at the top of the screen.
        # context.enable = true;
        highlight.enable = true;
        indent.enable = true;
        autotagHtml = true;
      };
      #debugger = {
      #nvim-dap = {
      #enable = true;
      #ui.enable = true;
      #};
      #};
      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        markdown.enable = true;
        clang = {
          enable = true;
          extraDiagnostics.enable = false;
        };
        cmake.enable = true;
        java.enable = true;
        python.enable = true;
        rust.enable = true;
        docker.enable = true;
        lua.enable = true;
        ocaml = {
          enable = true;
          format.enable = true;
          lsp.enable = true;
        };
        # typst = {
        #   enable = true;
        #   lsp.enable = false;
        #   extensions.typst-preview-nvim.setupOpts = {
        #     invert_colors = "auto";
        #   };
        # };
      };
      diagnostics = {
        enable = true;
        nvim-lint.enable = true;
        config.virtual_text = true;
      };
      autocomplete = {
        blink-cmp = {
          enable = true;
          friendly-snippets.enable = true;
          setupOpts = {
            keymap.preset = "super-tab";
            cmdline.keymap.preset = "super-tab";
          };
        };
      };
      telescope = {
        enable = true;
        mappings = {
          gitFiles = "<leader>ff";
          liveGrep = "<leader>fg";
          findProjects = "<leader>fd";
        };
      };
      utility = {
        oil-nvim.enable = true;
        oil-nvim.gitStatus.enable = true;
        diffview-nvim.enable = true;
        surround.enable = true;
      };
      ui = {
        borders.enable = true;
        colorizer.enable = true;
        smartcolumn = {
          enable = true;
          setupOpts.custom_colorcolumn = {
            c = "80";
            cpp = "80";
          };
        };
      };
      terminal = {
        toggleterm = {
          enable = true;
          lazygit.enable = true;
        };
      };
      git = {
        enable = true;
      };
      luaConfigPost = ''
        vim.cmd.colorscheme("industry")
        vim.opt.cmdheight = 0
        vim.opt.laststatus = 0
      '';
      luaConfigRC = {
        typst = builtins.readFile ./lua/typst.lua;
      };
    };
  };
}
