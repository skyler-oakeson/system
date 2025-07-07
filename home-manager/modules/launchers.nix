# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Wofi
#
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  pkgs,
  config,
  lib,
  colors,
  ...
}:
let
  cfg = config.launchers;
in
{
  options = with lib; {
    launchers = {
      default = mkOption {
        type = types.enum [
          "wofi"
          "tofi"
          "rofi"
        ];
        default = "wofi";
      };

      wofi = {
        enable = mkEnableOption {
          description = "Install wofi.";
          default = false;
        };
        cmd = mkOption {
          type = types.str;
          default = "wofi --width=30% --height=30% --show drun";
        };
      };

      rofi = {
        enable = mkEnableOption {
          description = "Install rofi.";
          default = false;
        };
        cmd = mkOption {
          type = types.str;
          default = "rofi -show drun";
        };
      };

      tofi = {
        enable = mkEnableOption {
          description = "Install tofi.";
          default = false;
        };
        cmd = mkOption {
          type = types.str;
          default = "tofi-drun";
        };
      };
    };
  };

  config = {

    programs.wofi = {
      enable = (cfg.wofi.enable);
      settings = {
        hide_scroll = true;
        normal_window = true;
        no_actions = true;
        allow_markup = true;
        key_up = "Ctrl-k";
        key_down = "Ctrl-j";
      };
      style = ''
        @import "/home/skyler/.cache/wallust/colors_waybar.css";

        #window {
          font-family: "JetBrainsMono Nerd Font";
          font-size: 16px;
          background: @background;
          color: @color13;
          font-style: oblique;
          border-bottom: none;
          outline: none;
        }

        #input {
          border-radius: 0px;
          outline: none;
          padding: 5;
          border: 0px;
          background: @background;
          color: @foreground;
        }

        #input:focus {
          outline: none;
          box-shadow: none;
        }

        #entry {
          padding: 5px;
          margin: 0px 10px;
          border-radius: 0px;
          outline: none;
          color: @color2;
        }

        #entry:innerbox {
          margin: 0px 5px;
        }

        #entry:selected {
          background: @color2;
          foreground: @foreground;
        }

        #text:selected {
          foreground: @color13;
        }

        #scroll {
          outline: none;
          border: none;
          margin: -2px 0px;
        }
      '';
    };

    programs.rofi = {
      enable = (cfg.rofi.enable);
      theme = "dmenu";
    };

    programs.tofi = {
      enable = (cfg.tofi.enable);
      settings = {
        include = "${colors}/colors_tofi";
        font = "monospace";
        text-cursor-style = "block";
        drun-launch = true;
        terminal = "${config.terminals.default}";
        font-size = 12;
        outline-width = 0;
        border-width = 0;
        prompt-text = "> ";
        anchor = "top";
        horizontal = true;
        height = 30;
        width = "100%";
        result-spacing = 30;
        padding-top = 2;
        padding-bottom = 2;
        margin-top = 10;
        margin-right = 10;
        margin-left = 10;
      };
    };
  };
}
