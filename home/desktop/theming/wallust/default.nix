# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Wallust
#
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  user,
  ...
}:
let
  templates = "/home/skyler/.config/system/home/desktop/theming/wallust/templates";

  current = notTooBright;
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
in
{
  config = {
    programs.wallust = {
      enable = true;
      settings = {
        templates = {
          kitty.template = "${templates}/colors_kitty.conf";
          kitty.target = "${user.locations.theme}/colors_kitty.conf";
          waybar.template = "${templates}/colors_waybar.css";
          waybar.target = "${user.locations.theme}/colors_waybar.css";
          hypr.template = "${templates}/colors_hypr.conf";
          hypr.target = "${user.locations.theme}/colors_hypr.conf";
          gtk.template = "${templates}/colors_gtk.css";
          gtk.target = "${user.locations.theme}/colors_gtk.css";
          nvim.template = "${templates}/colors_neopywal.vim";
          nvim.target = "${user.locations.theme}/colors_neopywal.vim";
          mako.template = "${templates}/colors_mako.conf";
          mako.target = "${user.locations.theme}/colors_mako.conf";
          ghostty.template = "${templates}/colors_ghostty";
          ghostty.target = "${user.locations.theme}/colors_ghostty";
        };
      }
      // current;
    };
  };
}
