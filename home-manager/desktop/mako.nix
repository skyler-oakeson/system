# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Mako
#
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  pkgs,
  config,
  lib,
  ...
}: 
let
  cfg = config.desktop.mako;
in
{
  options = {
    desktop = {
      mako = with lib; {
        enable = mkEnableOption { description = "Install Mako."; };
        default = false;
      };
    };
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      mako
    ];
  
    services.mako = with config.walnix.colors.hex; {
      enable = true;
      borderColor = color13;
      textColor = background;
      backgroundColor = color5;
      defaultTimeout = 10000;
      anchor = "top-right";
      borderSize = 2;
    };
  };
}
