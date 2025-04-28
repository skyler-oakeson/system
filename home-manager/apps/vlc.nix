# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# VLC
# 
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  config,
  lib,
  pkgs,
  ...
}: 
  let cfg = config.apps.vlc;
  in
{
  options = {
    apps = {
      vlc = with lib; {
        enable = mkEnableOption { 
          description = "Install vlc.";
          default = false;
        };
      };
    };
  };
  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      vlc
    ];
  };
}
