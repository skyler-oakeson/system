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

    };
  };

  config = {
    programs.firefox = {
      policies = {
        BlockAboutConfig = true;
        # DefaultDownloadDirectory = "${home}/dwn";
      };
    };
  };
}
