{ pkgs, ... };

{
  programs.nvf = {
    enable = true;
    settings.vim = {
      lineNumberMode = "relNumber";
      searchCase = "smart";
      tabWidth = 2;
      expandTab = true;
      scrollOffset = 6;
    };
  };
}
