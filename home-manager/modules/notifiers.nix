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
  cfg = config.notifiers;
in
{
  options = {
    notifiers = with lib; {

      default = mkOption {
        type = types.enum [
          "mako"
        ];
        default = "mako";
      };

      mako = {
        enable = mkEnableOption { description = "Install Mako."; };
        default = false;
      };
    };
  };

  config = {
    services.mako = {
      enable = (cfg.mako.enable);
      settings = {
        "include" = "~/.cache/wallust/colors_mako.conf";
        default-timeout = 10000;
        anchor = "top-right";
        border-size = 2;
        markup = true;
        icons = true;
        margin = 20;
        font = "monospace 10";
      };
    };
  };
}
