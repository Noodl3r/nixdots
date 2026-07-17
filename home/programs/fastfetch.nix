{
  fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "nixos";
        type = "small";
      };
      dispay.separator = ":";
      modules = [
        "title"
        "separator"
        "host"
        "os"
        {
          type = "command";
          key = "OS Age ";
          keyColor = "36";
          text = "os-age";
        }
        "shell"
        "wm"
      ];
    };
  };
}
