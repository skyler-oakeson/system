# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Wallust
#
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  config,
  lib,
  pkgs,
  colors,
  ...
}:
let
  cfg = config.wallust;
  templates = "/home/skyler/.config/system/home/modules/wallust/templates";

  notTooBright = {
    backend = "wal";
    color_space = "lch";
    palette = "dark16";
    saturation = 40;
    check_contrast = true;
    dynamic_threshold = true;
    fallback_generator = "interpolate";
    alpha = 100;
  };

  current = notTooBright;
in
{
  options = {
    wallust = with lib; {
      enable = mkEnableOption {
        description = "Install and configure wallust.";
        default = false;
      };
    };
  };

  config = {
    programs.wallust = {
      settings = {
        # backend = "wal";
        # color_space = "lch";
        # palette = "dark16";
        # saturation = 40;
        # check_contrast = true;
        # dynamic_threshold = true;
        # fallback_generator = "interpolate";
        # alpha = 100;

        templates = {
          kitty.template = "${templates}/colors_kitty.conf";
          kitty.target = "${colors}/colors_kitty.conf";
          waybar.template = "${templates}/colors_waybar.css";
          waybar.target = "${colors}/colors_waybar.css";
          hypr.template = "${templates}/colors_hypr.conf";
          hypr.target = "${colors}/colors_hypr.conf";
          gtk.template = "${templates}/colors_gtk.css";
          gtk.target = "${colors}/colors_gtk.css";
          nvim.template = "${templates}/colors_neopywal.vim";
          nvim.target = "${colors}/colors_neopywal.vim";
          mako.template = "${templates}/colors_mako.conf";
          mako.target = "${colors}/colors_mako.conf";
          ghostty.template = "${templates}/colors_ghostty";
          ghostty.target = "${colors}/colors_ghostty";
        };
      }
      // current;
    };
  };
}
