{

  description = "Nixos config flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {self, nixpkgs, home-manager, ...}@inputs: 
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in {

    nixosConfigurations = {
      elm = lib.nixosSystem {
	    specialArgs = {inherit inputs;};
        system = system;
	    modules = [ 
	      # inputs.home-manager.nixosModules.default
	      ./hosts/elm/configuration.nix
	    ];
      };
    };

    homeConfigurations = {
      skyler = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [
	      ./hosts/elm/home.nix
        ];
      };
    };
  };
}
