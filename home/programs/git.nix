{
  programs.git = {
    enable = true;
    settings = {
      user = {
        name = "Noodl3r";
        email = "echelon.r6s@gmail.com";
      };
      init.defaultBranch = "main";
      push = {autoSetupRemote = true;};
    };
  };
}
