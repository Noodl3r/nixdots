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
}
