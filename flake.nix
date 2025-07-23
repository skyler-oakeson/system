{
  description = "Nixos Config Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hyprland-qtutils.url = "github:hyprwm/hyprland-qtutils";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";

    nvim-neopywal = {
      url = "github:RedsXDD/neopywal.nvim";
      flake = false;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      spicetify-nix,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      system = "x86_64-linux";
      username = "skyler";
      lib = nixpkgs.lib;
      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
          allowUnfreePredicate = (pkg: true);
        };
      };
    in
    {
      nixosConfigurations = {
        elm = lib.nixosSystem {
          inherit pkgs;
          specialArgs = {
            inherit
              inputs
              system
              username
              ;
          };
          modules = [
            # inputs.home-manager.nixosModules.default
            ./nixos/hosts/elm/configuration.nix
          ];
        };
      };

      homeConfigurations = {
        skyler = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          extraSpecialArgs = {
            inherit
              inputs
              username
              system
              ;
            colors = "/home/${username}/.cache/wallust";
          };
          modules = [
            ./home-manager/home.nix
            spicetify-nix.homeManagerModules.default
          ];
        };
      };
    };
}
