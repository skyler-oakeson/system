# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# OBS-studio
#
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  config,
  lib,
  pkgs,
  ...
}: 
  let cfg = config.apps.obs-studio;
  in
{
  options = {
    apps = {
      obs-studio = with lib; {
        enable = mkEnableOption { 
          description = "Install obs-studio.";
          default = false;
        };
      };
    };
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      obs-studio
    ];
  };
}
