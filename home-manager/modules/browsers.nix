# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Browsers
#
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  config,
  lib,
  pkgs,
  home,
  options,
  ...
}:
let
  cfg = config.browsers;
in
{
  options = with lib; {
    browsers = {
      default = mkOption {
        type = types.enum [
          "firefox"
          "chromium"
        ];
        default = "firefox";
      };

      chromium = {
        enable = mkEnableOption {
          description = "Install Chrome.";
          default = false;
        };
      };

      firefox = {
        enable = mkEnableOption {
          description = "Install Firefox.";
          default = false;
        };
      };
    };
  };

  config = {
    programs.chromium = {
      enable = cfg.chromium.enable;
    };

    programs.firefox = {
      enable = cfg.firefox.enable;
      policies = {
        BlockAboutConfig = true;
        # DefaultDownloadDirectory = "${home}/dwn";
      };
    };
  };
}
