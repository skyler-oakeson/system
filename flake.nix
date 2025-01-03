{
  description = "Nixos Config Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";
    nix-colors.url = "github:misterio77/nix-colors";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    hyprland-qtutils,
    nix-colors,
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
        system = system;
        pkgs = pkgs;
        modules = [
          # inputs.home-manager.nixosModules.default
          ./hosts/elm/configuration.nix
        ];
      };
    };

    homeConfigurations = {
      skyler = home-manager.lib.homeManagerConfiguration {
        pkgs = pkgs;
        extraSpecialArgs = {inherit inputs;};
        modules = [
          ./hosts/home.nix
        ];
      };
    };
  };
}
