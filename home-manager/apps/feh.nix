# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Feh
# Description: Light weight image viewer.
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  config,
  lib,
  pkgs,
  ...
}: 
  let cfg = config.apps.feh;
  in
{
  options = {
    apps = {
      feh = with lib; {
        enable = mkEnableOption { 
          description = "Install feh.";
          default = false;
        };
      };
    };
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      feh
    ];
  };
}
