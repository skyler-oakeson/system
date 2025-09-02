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

  brighter = {
    backend = "wal";
    color_space = "lch";
    palette = "dark16";
    saturation = 70;
    check_contrast = true;
    dynamic_threshold = true;
    fallback_generator = "interpolate";
    alpha = 100;
  };
in
{
  config = {
    programs.wallust =
      let
        templates = ./templates;
        targets = user.locations.theme;
      in
      {
        enable = true;
        settings = {
          templates = {
            kitty.template = "${templates}/colors_kitty.conf";
            kitty.target = "${targets}/colors_kitty.conf";
            waybar.template = "${templates}/colors_waybar.css";
            waybar.target = "${targets}/colors_waybar.css";
            hypr.template = "${templates}/colors_hypr.conf";
            hypr.target = "${targets}/colors_hypr.conf";
            gtk.template = "${templates}/colors_gtk.css";
            gtk.target = "${targets}/colors_gtk.css";
            nvim.template = "${templates}/colors_neopywal.vim";
            nvim.target = "${targets}/colors_neopywal.vim";
            mako.template = "${templates}/colors_mako.conf";
            mako.target = "${targets}/colors_mako.conf";
            ghostty.template = "${templates}/colors_ghostty";
            ghostty.target = "${targets}/colors_ghostty";
            qutebrowser.template = "${templates}/colors_qutebrowser_config.py";
            qutebrowser.target = "${targets}/colors_qutebrowser_config.py";
          };
        }
        // current;
      };
  };
}
