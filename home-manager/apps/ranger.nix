# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Ranger
#
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  config,
  lib,
  pkgs,
  ...
}: 
  let cfg = config.apps.ranger;
  in
{
  options = {
    apps = {
      ranger = with lib; {
        enable = mkEnableOption { 
          description = "Install ranger.";
          default = false;
        };
      };
    };
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      ranger
    ];
  };
}
