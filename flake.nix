{
  description = "NixOS from Scratch";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-doom-emacs-unstraightened = {
      url = "github:marienz/nix-doom-emacs-unstraightened";
      inputs = {
        doomdir.url = "./doom";
        nixpkgs.follows = "nixpkgs";
      };
    };
    nixneovimplugins = {
      url = "github:NixNeovim/NixNeovimPlugins";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    pi = {
      url = "github:earendil-works/pi/stable";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    nix-doom-emacs-unstraightened,
    home-manager,
    nixneovimplugins,
    pi,
    ...
  }: let
    mkHost = host:
      nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = {
          inherit host nixneovimplugins;
        };
        modules = [
          nvf.nixosModules.default
          ./configuration.nix
          home-manager.nixosModules.home-manager
          {
            home-manager = {
              useGlobalPkgs = true;
              useUserPackages = true;
              extraSpecialArgs = {
                inherit nix-doom-emacs-unstraightened;
                inherit pi;
              };
              users.noodl3 = import ./home.nix;
              backupFileExtension = "backup";
            };
          }
        ];
      };
  in {
    nixosConfigurations = {
      multivac = mkHost "multivac";
      minivac = mkHost "minivac";
    };
  };
}
