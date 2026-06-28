{ ... }:

{
  programs.nvf = {
    enable = true;
    # Your settings need to go into the settings attribute set
    # most settings are documented in the appendix
    settings.vim = {
      lineNumberMode = "relNumber";
      viAlias = true;
      vimAlias = false;
      autopairs.nvim-autopairs.enable = true;
      theme = {
        enable = true;
        name = "oxocarbon";
        style = "dark";
        transparent = false;
      };
      lsp = {
        enable = true;
        formatOnSave = true;
        lspkind.enable = true;
        trouble.enable = true;
        otter-nvim.enable = true;
      };
      debugger = {
        nvim-dap = {
          enable = true;
          ui.enable  = true;
        };
      };
      languages = {
        enableFormat = true;
        enableTreesitter = true;
        enableExtraDiagnostics = true;

        nix.enable = true;
        markdown.enable = true;
        clang.enable = true;
        cmake.enable = true;
        java.enable = true;
        python.enable = true;
        rust.enable = true;
        docker.enable = true;
        lua.enable = true;
      };
      autocomplete = {
        blink-cmp.enable = true;
      };
      fzf-lua = {
        enable = true;
        profile = "borderless-full";
      };
      utility.oil-nvim = {
        enable = true;
        gitStatus.enable = true;
    };
}
