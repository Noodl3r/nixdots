{
  description = "NixOS from Scratch";
  inputs = {
    nixpkgs.url = "nixpkgs/nixos-26.05";
    nvf = {
      url = "github:NotAShelf/nvf";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager/release-26.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    nvf,
    home-manager,
    ...
  }: {
    nixosConfigurations.multivac = nixpkgs.lib.nixosSystem {
      system = "x86_64-linux";
      modules = [
        nvf.nixosModules.default
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            users.noodl3 = import ./home.nix;
            backupFileExtension = "backup";
          };
        }
      ];
    };
  };
}
