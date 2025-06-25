# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# pwvucontrol
# 
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  config,
  lib,
  pkgs,
  ...
}: 
  let cfg = config.apps.pwvucontrol;
  in
{
  options = {
    apps = {
      pwvucontrol = with lib; {
        enable = mkEnableOption { 
          description = "Install pwvucontrol.";
          default = false;
        };
      };
    };
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      pwvucontrol
    ];
  };
}
