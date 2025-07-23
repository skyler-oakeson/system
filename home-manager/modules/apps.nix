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
  cfg = config.programs;
in
{
  options = with lib; {
    programs = {
      discord = {
        enable = mkEnableOption {
          description = "Install and configure Chrome.";
          default = false;
        };
      };

      qbittorrent = {
        enable = mkEnableOption {
          description = "Install firefox.";
          default = false;
        };
      };

      pwvucontrol = with lib; {
        enable = mkEnableOption {
          description = "Install pwvucontrol; An volumn in and out control.";
          default = false;
        };
      };

      vlc = with lib; {
        enable = mkEnableOption {
          description = "Install vlc editor.";
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
      ++ lib.optionals (cfg.pwvucontrol.enable) [ pwvucontrol ]
      ++ lib.optionals (cfg.vlc.enable) [ vlc ];

    programs.spotify-player = {
      actions = [
        {
          action = "GoToArtist";
          key_sequence = "g A";
        }
        {
          action = "GoToAlbum";
          key_sequence = "g B";
          target = "PlayingTrack";
        }
        {
          action = "ToggleLiked";
          key_sequence = "C-l";
        }
      ];

      settings = {
        cover_img_width = 5;
        cover_img_length = 12;
        cover_img_scale = 1.0;
        seek_duration_secs = 10;
        device = {
          volume = 100;
        };
      };
    };

    # TODO integrate this with wallust
    programs.spicetify =
      let
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
      in
      {
        enabledExtensions = with spicePkgs.extensions; [
          adblock
        ];
        spicetifyPackage = pkgs.spicetify-cli;
        spotifyPackage = pkgs.spotify;
        theme = spicePkgs.themes.text;
        wayland = true;
        windowManagerPatch = true;
      };
  };
}
