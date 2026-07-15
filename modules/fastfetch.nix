{pkgs, ...}: {
  home.packages = with pkgs; [
    fastfetch
  ];
  programs.fastfetch.settings = {
    logo = {
      source = "nixos";
      type = "small";
    };
    display = {
      separator = ": ";
    };
    modules = [
      "title"
      "separator"
      "os"
      "uptime"
      "shell"
      "wm"
      "packages"
    ];
  };
}
