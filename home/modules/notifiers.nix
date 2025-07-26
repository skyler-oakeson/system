# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Mako
#
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  lib,
  ...
}:
{
  options = with lib; {
    notifiers = {
      default = mkOption {
        type = types.enum [
          "mako"
        ];
        default = "mako";
      };
    };
  };
  config = {
    services.mako = {
      settings = {
        "include" = "~/.cache/wallust/colors_mako.conf";
        default-timeout = 10000;
        anchor = "top-right";
        actions = true;
        border-size = 1;
        markup = true;
        icons = true;
        margin = "10, 30, 0";
        font = "monospace 10";
      };
    };
  };
}
