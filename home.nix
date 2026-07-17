{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./home/core.nix
    ./home/files.nix
    ./home/services.nix
    ./home/packages.nix
    ./home/programs/fish.nix
    ./home/programs/starship.nix
    ./home/programs/zoxide.nix
    ./home/programs/direnv.nix
    ./home/programs/git.nix
    ./home/programs/fastfetch.nix
    ./home/programs/firefox.nix
    ./home/programs/tmux.nix
  ];
}
