{
  description = "Nixos Config Flake";

  inputs = {
    nixpkgs = {
      url = "nixpkgs/nixos-unstable";
    };
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

    nvim-blink = {
      url = "github:Saghen/blink.cmp";
      flake = true;
    };
  };

  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      inherit (self) outputs;
      hosts = import ./data/hosts.nix;
      users = import ./data/users.nix;
      overlays = import ./overlays { inherit inputs; };
    in
    {
      nixosConfigurations = {
        ${hosts.host0.hostname} =
          let
            host = hosts.host0;
            system = host.system;
            pkgs = import nixpkgs {
              inherit system;
              config = {
                allowUnfree = true;
              };
              overlays = [
                overlays.nvim-neopywal
                overlays.nvim-blink
              ];
            };
            user = users.user0;
            lib = nixpkgs.lib;
          in
          lib.nixosSystem {
            inherit system pkgs;
            specialArgs = {
              inherit
                inputs
                host
                user
                ;
            };
            modules = [
              ./hosts/${host.hostname}/configuration.nix
              home-manager.nixosModules.home-manager
              {
                home-manager = {
                  useUserPackages = true;
                  useGlobalPkgs = true;
                  extraSpecialArgs = {
                    inherit
                      inputs
                      host
                      user
                      ;
                  };
                  users.${user.username} = import ./users/${user.username}; # give it home.nix
                };
              }
            ];
          };

        # homeConfigurations = {
        #   skyler = home-manager.lib.homeManagerConfiguration {
        #     inherit pkgs;
        #     extraSpecialArgs = {
        #       inherit
        #         inputs
        #         username
        #         system
        #         ;
        #       colors = "/home/${username}/.cache/wallust";
        #     };
        #     modules = [
        #       ./home/home.nix
        #       spicetify-nix.homeManagerModules.default
        #     ];
        #   };
        # };
      };
    };
}
