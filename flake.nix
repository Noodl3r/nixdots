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
  }: let
    mkHost = config: nixpkgs.lib.nixosSystem{
      system = "x86_64-linux";
      modules = [
	nvf.nixosModules.default
	config
	home-manager.nixosModules.home-manager
	{
	  home-manager = {
	    useGlobalPkgs = true;
	    userUserPackages = true;
	    users.noodl3 = import./home.nix;
	    backupFileExtension = "backup";
    	  };
	}
      ];
    };
    in {
    nixosConfigurations = {
	multivac = mkHost ./hosts/multivac/configuration.nix;
	minivac  = mkHost ./hosts/minivac/configuration.nix;
    };
  };
}
