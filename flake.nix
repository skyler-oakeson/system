{
  description = "Nixos Config Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";
    walnix.url = "path:/home/skyler/code/nix/walnix/";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    hyprland-qtutils,
    walnix,
    spicetify-nix,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = import nixpkgs {
      inherit system;
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
        extraSpecialArgs = {inherit inputs;};
        modules = [
          ./home-manager/home.nix
          walnix.homeManagerModules.walnix
          spicetify-nix.homeManagerModules.default
        ];
      };
    };
  };
}
