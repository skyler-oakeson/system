# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Terminals
#
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  lib,
  pkgs,
  config,
  user,
  ...
}:
let
  cfg = config.terminals;
in
{
  options = with lib; {
    terminals = {
      default = mkOption {
        type = types.enum [
          "kitty"
          "ghostty"
        ];
        default = "kitty";
      };
    };
  };

  config = {
    programs.kitty = {
      enable = true;
      settings = {
        include = "${user.locations.theme}/colors_kitty.conf";
        font_family = "monospace";
        font_size = 14.0;
        window_padding_width = 10;
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";
        remember_window_size = "yes";
        confirm_os_window_close = 0;
      };
    };

    programs.ghostty = {
      enable = true;
      settings = {
        theme = "${user.locations.theme}/colors_ghostty";
        font-family = "monospace";
        keybind = [
          "ctrl+shift+h=goto_split:left"
          "ctrl+shift+l=goto_split:right"
          "ctrl+shift+k=goto_split:up"
          "ctrl+shift+j=goto_split:down"
        ];
        font-size = 14;
        window-padding-y = 10;
        window-padding-x = 10;
        window-save-state = "always";
        clipboard-trim-trailing-spaces = true;
        confirm-close-surface = false;
        shell-integration = "zsh";
      };
    };
  };
}
