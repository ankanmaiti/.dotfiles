{
  description = "Home Manager configuration of santu";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, nixpkgs-unstable, ... }@inputs:
    let
      hostname 		= "nixos";
      username 		= "santu";

      system 		= "x86_64-linux";
      pkgs 		= nixpkgs.legacyPackages.${system};
      pkgs-unstable 	= nixpkgs-unstable.legacyPackages.${system};
    in
    {

      nixosConfigurations.${hostname} = nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          ./configuration.nix
        ];

        specialArgs = {
	  inherit inputs;
	  inherit pkgs-unstable;
	};
      };


      # home-manager config
      homeConfigurations.${username} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        modules = [
	  ./home.nix 
	];

        extraSpecialArgs = {
	  inherit inputs;
	  inherit pkgs-unstable;
	};
      };
      

    };
}
