{
  config,
  pkgs,
  ...
}: {
  imports = [
    ./home/core.nix
    ./home/files.nix
    ./home/services.nix
    ./home/programs/fish.nix
    ./home/programs/zoxide.nix
    ./home/programs/direnv.nix
    ./home/programs/fastfetch.nix
    ./home/programs/firefox.nix
  ];
}
