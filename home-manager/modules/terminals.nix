# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Kitty
#
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  lib,
  pkgs,
  config,
  colors,
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
        ];
        default = "kitty";
      };

      kitty = with lib; {
        enable = mkEnableOption {
          description = "Install Kitty.";
          default = false;
        };
      };
    };
  };

  config = lib.mkIf (cfg.kitty.enable) {
    home.packages = with pkgs; [
      kitty
    ];

    programs.kitty = {
      enable = true;
      settings = {
        include = "${colors}/colors_kitty.conf";
        font_family = "JetBrainsMono Nerd Font";
        font_size = 12.0;
        window_padding_width = 10;
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";
        remember_window_size = "yes";
        confirm_os_window_close = 0;
      };
    };
  };
}
