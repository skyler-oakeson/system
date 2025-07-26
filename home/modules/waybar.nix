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
  config = {
    programs.waybar = {
      settings = {
        mainBar = {
          margin-top = 20;
          margin-bottom = 10;
          margin-right = 10;
          margin-left = 20;
          height = 10;
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
            "format" = "{:%I:%M}";
            "format-alt" = "{:%m-%d-%Y}";
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
            "format" = "{temperatureC}°C";
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
            "format-wifi" = "W{signalStrength}%";
            "format-ethernet" = "E {cidr}";
            "format-linked" = "[eth]: {cidr} (No IP)";
            "format-disconnected" = "E/W !";
            "format-alt" = "A {ipaddr}";
            "tooltip" = false;
          };

          "pulseaudio" = {
            "format" = "{volume}%";
            "format-bluetooth" = "{volume}% {icon} {format_source}";
            "format-bluetooth-muted" = " {icon} {format_source}";
            "format-muted" = "_%";
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
          font-family: "monospace";
          font-size: 16px;
        }

        window#waybar {
          background-color: transparent;
          border-radius: 0px;
        }

        button {
          border: solid 1;
          border-radius: 0;
          border-color: @color0;
        }

        button:hover {
          color: @color2;
        }

        #pulseaudio:hover {
          background-color: @background;
        }

        #workspaces {
            color: @foreground;
            background-color: transparent;
        }

        #workspaces button.active {
            border-color: @color8;
        }

        #workspaces button {
          background-color: @background;
          color: @foreground;
        }

        #workspaces button.focused {
          background-color: @foreground;
          color: @background;
        }

        #window {
          border: solid 1px;
          border-color: @color0;
        }

        #window,
        #clock,
        #pulseaudio,
        #battery,
        #cpu,
        #memory,
        #temperature,
        #network,
        #backlight,
        #pulseaudio {
          color: @foreground;
          background: @background;
          border: solid 1px;
          border-color: @color0;
          margin-right: 10px;
          box-shadow: 5px 5px rgba(0, 0, 0, .50);
          padding: 0 5px;
        }

        .modules-left,
        .modules-center,
        .modules-right {
          background-color: transparent;
          /* background: radial-gradient(@background .5px,transparent 2px) 0 0/5px 5px, transparent; */
          margin-bottom: 10px;
        }

        .modules-center {
          box-shadow: 5px 5px rgba(0, 0, 0, .50);
        }

        #pulseaudio.muted {
          color: @background;
          background-color: @color13;
        }
      '';
    };
  };
}
