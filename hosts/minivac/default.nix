{
	imports = [
		../../modules/common.nix
		../../home.nix
		./hardware-configuration.nix
	];
	networking.hostname = "minivac"
}
