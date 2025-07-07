# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# File-Explorers
#
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.file-explorers;
in
{
  options = with lib; {
    file-explorers = {
      default = mkOption {
        type = types.enum [
          "ranger"
          "yazi"
          "superfile"
          "nnn"
        ];
        default = "";
      };

      superfile = {
        enable = mkEnableOption {
          description = "Install superfile.";
          default = false;
        };
      };

      yazi = {
        enable = mkEnableOption {
          description = "Install yazi.";
          default = false;
        };
      };

      ranger = {
        enable = mkEnableOption {
          description = "Install ranger.";
          default = false;
        };
      };

      nnn = {
        enable = mkEnableOption {
          description = "Install nnn.";
          default = false;
        };
      };
    };
  };

  config = {
    home.packages =
      with pkgs;
      [
      ]
      ++ lib.optionals (cfg.ranger.enable) [ ranger ]
      ++ lib.optionals (cfg.yazi.enable) [ superfile ]
      ++ lib.optionals (cfg.superfile.enable) [ yazi ]
      ++ lib.optionals (cfg.nnn.enable) [ nnn ];
  };
}
