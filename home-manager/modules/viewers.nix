# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# File-Viewers
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
  cfg = config.viewers;
in
{
  options = {
    viewers = {
      feh = with lib; {
        enable = mkEnableOption {
          description = "Install feh photo viewer.";
          default = false;
        };
      };

      vlc = with lib; {
        enable = mkEnableOption {
          description = "Install vlc.";
          default = false;
        };
      };
    };
  };

  config = {
    home.packages =
      with pkgs;
      [ ] ++ lib.optionals (cfg.feh.enable) [ feh ] ++ lib.optionals (cfg.vlc.enable) [ vlc ];
  };
}
