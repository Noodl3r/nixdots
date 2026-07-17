{
  programs.direnv = {
    enable = true;
    nix-direnv.enable = true;
    config = {
      global = {
        # Hides block
        hide_env_diff = true;
        # Silence everything
        # log_format = "-";
      };
    };
  };
}
