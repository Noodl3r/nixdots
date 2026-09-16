{
  nixneovimplugins,
  pkgs,
  ...
}: {
  neogen-danymat = {
    package = nixneovimplugins.packages.${pkgs.system}.neogen-danymat;
    setupModule = "neogen";
    setupOpts = {
      snippet_engine = "luasnip";
    };
  };
  tiny-code-action-nvim-rachartier = {
    package = nixneovimplugins.packages.${pkgs.system}.tiny-code-action-nvim-rachartier;
    setupModule = "tiny-code-action";
    setupOpts = {
      dependencies = "nvim-telescope/telescope.nvim";
      event = "LspAttach";
      opts.backend = "vim";
    };
  };
}
