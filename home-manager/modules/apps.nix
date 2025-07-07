# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Apps
#
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  config,
  lib,
  pkgs,
  inputs,
  ...
}:
let
  cfg = config.apps;
in
{
  options = with lib; {
    apps = {
      discord = {
        enable = mkEnableOption {
          description = "Install Chrome.";
          default = false;
        };
      };

      obs-studio = with lib; {
        enable = mkEnableOption {
          description = "Install obs-studio.";
          default = false;
        };
      };

      spicetify = {
        enable = mkEnableOption {
          description = "Install Firefox.";
          default = false;
        };
      };

      neofetch = {
        enable = mkEnableOption {
          description = "Install Neofetch.";
          default = false;
        };
      };

      btop = {
        enable = mkEnableOption {
          description = "Install Neofetch.";
          default = false;
        };
      };

      qbittorrent = {
        enable = mkEnableOption {
          description = "Install Firefox.";
          default = false;
        };
      };

      pwvucontrol = with lib; {
        enable = mkEnableOption {
          description = "Install pwvucontrol.";
          default = false;
        };
      };

      spotify-player = with lib; {
        enable = mkEnableOption {
          description = "Install spotify-player.";
          default = false;
        };
      };
    };
  };

  config = {
    home.packages =
      with pkgs;
      [ ]
      ++ lib.optionals (cfg.discord.enable) [ discord ]
      ++ lib.optionals (cfg.qbittorrent.enable) [ qbittorrent ]
      ++ lib.optionals (cfg.btop.enable) [ btop ]
      ++ lib.optionals (cfg.pwvucontrol.enable) [ pwvucontrol ]
      ++ lib.optionals (cfg.neofetch.enable) [ neofetch ]
      ++ lib.optionals (cfg.obs-studio.enable) [ obs-studio ];

    programs.spotify-player = {
      enable = (cfg.spotify-player.enable);
    };

    # TODO integrate this with wallust
    # programs.spicetify =
    #   let
    #     spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
    #   in
    #   {
    #     enable = (cfg.spicetify.enable);
    #     enabledExtensions = with spicePkgs.extensions; [
    #       adblock
    #     ];
    #     spicetifyPackage = pkgs.spicetify-cli;
    #     spotifyPackage = pkgs.spotify;
    #     theme = spicePkgs.themes.text;
    #     wayland = true;
    #     windowManagerPatch = true;
    #     customColorScheme = with config.walnix.colors.noHash; {
    #       accent = color12;
    #       accent-active = color11;
    #       accent-inactive = color3;
    #       banner = color14;
    #       border-active = color13;
    #       border-inactive = color4;
    #       header = color12;
    #       highlight = color12;
    #       highlight-elevated = color11;
    #       main = background;
    #       main-elevated = color0;
    #       text = color12;
    #       subtext = color5;
    #
    #       sidebar = background;
    #       player = color3;
    #       card = color0;
    #       shadow = background;
    #       selected-row = color3;
    #       button = color3;
    #       button-active = color13;
    #       button-disabled = color5;
    #       tab-active = color2;
    #       notification = color4;
    #       notification-error = color1;
    #       equalizer = color8;
    #       misc = color2;
    #     };
    #   };
  };
}
