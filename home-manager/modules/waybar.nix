# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Waybar
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
  cfg = config.waybar;
in
{
  options = {
    waybar = with lib; {
      enable = mkEnableOption {
        description = "Install Waybar.";
        default = false;
      };
    };
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      waybar
    ];

    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          margin-top = 10;
          margin-left = 10;
          margin-right = 10;
          margin-bottom = 0;
          height = 30;
          reload_style_on_change = true;

          modules-left = [ "hyprland/window" ];
          modules-center = [ "hyprland/workspaces" ];

          modules-right = [
            "pulseaudio"
            "backlight"
            "network"
            "temperature"
            # "battery"
            "clock"
          ];

          "hyprland/window" = {
            "format" = "{}";
            "max-length" = 50;
            "rewrite" = {
              "" = "Desktop";
            };
            "separate-outputs" = false;
            "tooltip" = false;
          };

          "hyprland/workspaces" = {
            "format" = "{icon}";
            "on-click" = "activate";
            "sort-by-number" = true;
            "persistent-workspaces" = {
            };
            "tooltip" = false;
          };

          "clock" = {
            "format" = "[time]: {:%I:%M}";
            "format-alt" = "[date]: {:%m-%d-%Y}";
            "tooltip" = false;
          };

          "cpu" = {
            "format" = "[cpu]: {usage}%";
            "tooltip" = false;
          };

          "memory" = {
            "format" = "[mem]: {}%";
            "tooltip" = false;
          };

          "temperature" = {
            "critical-threshold" = 80;
            "format" = "[temp]: {temperatureC}°C";
            "tooltip" = false;
          };

          "battery" = {
            "states" = {
              "warning" = 30;
              "critical" = 15;
            };
            "format" = "[bat]: {capacity}%";
            "tooltip" = false;
          };

          "network" = {
            "format-wifi" = "[wifi]: {signalStrength}%";
            "format-ethernet" = "[eth]: {cidr}";
            "format-linked" = "[eth]: {cidr} (No IP)";
            "format-disconnected" = "[eth/wifi]: !";
            "format-alt" = "[add]: {ipaddr}";
            "tooltip" = false;
          };

          "pulseaudio" = {
            "format" = "[vol]: {volume}%";
            "format-bluetooth" = "{volume}% {icon} {format_source}";
            "format-bluetooth-muted" = " {icon} {format_source}";
            "format-muted" = "[vol]: mute";
            "on-click" = "pwvucontrol";
            "tooltip" = false;
          };

          "backlight" = {
            "scroll-step" = 1;
            "on-scroll-up" = "brightnessctl set +10";
            "on-scroll-down" = "brightnessctl set 10-";
            "device" = "eDP-1";
            "format" = "[light]: {percent:>2}%";
            "tooltip" = false;
            "reverse-scrolling" = true;
          };

        };
      };

      style = ''
        @import "../../.cache/wallust/colors_waybar.css";

        * {
          font-family: "JetBrainsMono Nerd Font", Roboto, Helvetica, Arial, sans-serif;
          font-size: 16px;
        }

        window#waybar {
          background-color: transparent;
          border-radius: 0px;
        }

        button {
          /* Use box-shadow instead of border so the text isn't offset */
          box-shadow: inset 0 -3px transparent;
          /* Avoid rounded borders under each button name */
          border: none;
          border-radius: 0;
        }

        button:hover {
          background-color: @color13;
        }

        #pulseaudio:hover {
          background-color: @background;
        }

        #workspaces {
            color: @color7;
            background-color: @background;
        }

        #workspaces button.active {
            color: @background;
            background-color: @color2;
        }

        #workspaces button.hover {
            color: @background;
            background-color: @color7;
        }

        #workspaces button {
          padding: 0 5px;
          background-color: @background;
          color: @color7;
        }

        #workspaces button.focused {
          background-color: @color7;
          color: @background;
        }

        #clock,
        #pulseaudio,
        #battery,
        #cpu,
        #memory,
        #temperature,
        #network,
        #backlight,
        #window,
        #pulseaudio {
          padding: 0 10px;
          color: @color7;
        }

        #window {
          padding: 0 5px;
        }

        .modules-left,
        .modules-center,
        .modules-right {
          background-color: @background;
          border-radius: 0px;
          border: solid 0px;
          border-color: @color4;
          padding: 0 10px;
        }

        .modules-right:hover {
          border: solid 2px;
        }

        .modules-center {
          padding: 0 0px;
        }

        label:focus {
          background-color: @background;
        }

        #pulseaudio.muted {
          color: @background;
          background-color: @color13;
        }
      '';
    };
  };
}
