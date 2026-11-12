{
  pkgs,
  nix-doom-emacs-unstraightened,
  ...
}:
{
  imports = [
    nix-doom-emacs-unstraightened.homeModule
  ];
  programs.doom-emacs = {
    enable = true;
    emacs = pkgs.emacs-gtk;
    extraPackages = epkgs: [
      epkgs.treesit-grammars.with-all-grammars
    ];
  };
}
