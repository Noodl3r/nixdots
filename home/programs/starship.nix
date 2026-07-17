{
  programs.starship = {
    enable = true;
    enableFishIntegration = true;
    settings = {
      add_newline = true;
      character = {
        success_symbol = "[ξ](bold cyan)";
        error_symbol = "[ξ](bold red)";
        vimcmd_symbol = "[ξ](bold cyan)";
      };
    };
  };
}
