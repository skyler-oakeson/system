{
  description = "Nixos Config Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";
    walnix.url = "path:/home/skyler/Code/Nix/walnix/";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    hyprland-qtutils,
    walnix,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = import nixpkgs {
      system = "x86_64-linux";
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      elm = lib.nixosSystem {
        specialArgs = {inherit inputs;};
        inherit system;
        inherit pkgs;
        modules = [
          # inputs.home-manager.nixosModules.default
          ./nixos/hosts/elm/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      skyler = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          ./home-manager/home.nix
          walnix.homeManagerModules.walnix
        ];
      };
    };
  };
}
