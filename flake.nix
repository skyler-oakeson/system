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
    hyprland.url = "github:hyprwm/Hyprland";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nvim-neopywal = {
      url = "github:RedsXDD/neopywal.nvim";
      flake = false;
    };

    neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
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
      formatter.x86_64-linux = nixpkgs.legacyPackages.${hosts.host0.system}.nixfmt-tree;
      nixosConfigurations = {
        ${hosts.host0.hostname} =
          let
            host = hosts.host0;
            system = host.system;
            user = users.user0;
            utils = import ./utils { inherit lib; };
            pkgs = import nixpkgs {
              inherit system;
              config = {
                allowUnfree = true;
              };
              overlays = [
                overlays.nvim-neopywal
                inputs.neovim-nightly-overlay.overlays.default
              ];
            };
            lib = nixpkgs.lib;
          in
          lib.nixosSystem {
            inherit system pkgs;
            specialArgs = {
              inherit
                inputs
                host

                # TRANSFER THIS TO USERS SO YOU CAN ITERATE THROUGH IT TO CREATE ALL OF THEM
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
                      utils
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
