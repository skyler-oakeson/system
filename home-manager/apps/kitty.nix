# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Kitty
#
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  lib,
  pkgs,
  config,
  ...
}: 
let
  cfg = config.apps.kitty;
in
{
  options = {
    apps = {
      term = {
        kitty = with lib; {
          enable = mkEnableOption { 
            description = "Install Kitty.";
            default = false;
          };
        };
      };
    };
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      kitty
      neofetch
      btop
    ];
        programs.kitty = {
          enable = true;
  
          shellIntegration = {
            enableZshIntegration = true;
          };
  
          settings = with config.walnix.colors.noHash; {
            font_family = "JetBrainsMono Nerd Font";
            font_size = 12.0;
            window_padding_width = 10;
            bold_font = "auto";
            italic_font = "auto";
            bold_italic_font = "auto";
            remember_window_size = "yes";
            confirm_os_window_close = 0;
  
            background = "#${background}";
            foreground = "#${foreground}";
            selection_background = "#${foreground}";
            selection_foreground = "#${background}";
            url_color = "#${color4}";
            cursor = "#${color5}";
            cursor_text_color = "#${color0}";
            active_border_color = "#${color3}";
            inactive_border_color = "#${color1}";
            active_tab_background = "#${color0}";
            active_tab_foreground = "#${color5}";
            inactive_tab_background = "#${color1}";
            inactive_tab_foreground = "#${color4}";
            tab_bar_background = "#${color1}";
            wayland_titlebar_color = "#${color0}";
            macos_titlebar_color = "#${color0}";
  
            # normal
            color0 = "#${color0}";
            color1 = "#${color1}";
            color2 = "#${color2}";
            color3 = "#${color3}";
            color4 = "#${color4}";
            color5 = "#${color5}";
            color6 = "#${color6}";
            color7 = "#${color7}";
  
            # bright
            color8 = "#${color8}";
            color9 = "#${color9}";
            color10 = "#${color10}";
            color11 = "#${color11}";
            color12 = "#${color12}";
            color13 = "#${color13}";
            color14 = "#${color14}";
            color15 = "#${color15}";
  
            # extended color16 colors
            # color16 = "#${color9}";
            # color17 = "#${color15}";
            # color18 = "#${color1}";
            # color19 = "#${color2}";
            # color20 = "#${color4}";
            # color21 = "#${color6}";
      };
    };
  };
}
