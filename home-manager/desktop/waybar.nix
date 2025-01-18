{
  pkgs,
  config,
  lib,
  ...
}: {
  home.packages = with pkgs; [
    waybar
  ];

  programs.waybar = {
    enable = true;
    settings = {
      mainBar = {
        margin-top = 5;
        margin-left = 10;
        margin-right = 10;
        height = 30;
        reload_style_on_change = true;

        modules-left =
          [
            "hyprland/workspaces"
            "hyprland/window"
          ]
          ++ (
            if (builtins.getEnv "HOST" == "yew")
            then ["hyprland/window"]
            else []
          );

        modules-center =
          [
          ]
          ++ (
            if (builtins.getEnv "HOST" == "elm")
            then ["hyprland/window"]
            else []
          );

        modules-right = [
          "pulseaudio"
          # "backlight"
          "network"
          "temperature"
          # "battery"
          "clock"
        ];

        "hyprland/window" = {
          "format" = "{}";
          "max-length" = 35;
          "rewrite" = {
            "" = "Desktop";
          };
          "separate-outputs" = true;
        };

        "hyprland/workspaces" = {
          "format" = "{icon}";
          "on-click" = "activate";
          "sort-by-number" = true;
          "persistent-workspaces" = {
          };
        };
        "clock" = {
          "tooltip-format" = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
          "format-alt" = "{:%Y-%m-%d}";
        };
        "cpu" = {
          "format" = "  {usage}%";
          "tooltip" = false;
        };
        "memory" = {
          "format" = "{}%  ";
        };
        "temperature" = {
          "critical-threshold" = 80;
          "format" = "{icon} {temperatureC}°C";
          "format-icons" = ["" "" ""];
        };
        "battery" = {
          "states" = {
            "warning" = 30;
            "critical" = 15;
          };
          "format" = "{icon}  {capacity}%";
          "format-full" = "{icon}  {capacity}%";
          "format-charging" = "  {capacity}%";
          "format-plugged" = "  {capacity}%";
          "format-alt" = "{time} {icon}";
          "format-icons" = ["" "" "" "" ""];
        };
        "network" = {
          "format-wifi" = "  {signalStrength}%";
          "format-ethernet" = "{cidr} ";
          "tooltip-format" = "{ifname} via {gwaddr} ";
          "format-linked" = "{ifname} (No IP) ";
          "format-disconnected" = " ⚠ ";
          "format-alt" = "{ifname}: {ipaddr}/{cidr}";
        };
        "pulseaudio" = {
          "format" = "{icon}  {volume}%";
          "format-bluetooth" = "{volume}% {icon} {format_source}";
          "format-bluetooth-muted" = " {icon} {format_source}";
          "format-muted" = "  {volume}%";
          "format-icons" = {
            "headphone" = "";
            "hands-free" = "";
            "headset" = "";
            "phone" = "";
            "portable" = "";
            "car" = "";
            "default" = ["" "" ""];
          };
          "on-click" = "pwvucontrol";
        };
        "backlight" = {
          "scroll-step" = 1;
          "on-scroll-up" = "brightnessctl set +10";
          "on-scroll-down" = "brightnessctl set 10-";
          "device" = "eDP-1";
          "format" = "{icon} {percent:>2}%";
          "format-icons" = ["" "" "" "" "" "" "" "" ""];
          "tooltip" = false;
          "reverse-scrolling" = true;
        };
      };
    };
    style = ''
      * {
        font-family: "JetBrainsMono Nerd Font", Roboto, Helvetica, Arial, sans-serif;
        font-size: 16px;
      }

      window#waybar {
        background-color: transparent;
        border-radius: 0px;
        transition-property: background-color;
        transition-duration: .5s;
      }

      button {
        /* Use box-shadow instead of border so the text isn't offset */
        box-shadow: inset 0 -3px transparent;
        /* Avoid rounded borders under each button name */
        border: none;
        border-radius: 0;
      }

      button:hover {
        background: inherit;
        box-shadow: inset 0 -3px @base05;
      }

      #pulseaudio:hover {
        background-color: @base05;
      }

      #workspaces {
          color: @base05;
      }

      #workspaces button.active {
          color: @base00;
          background: @base05
      }

      #workspaces button {
        padding: 0 5px;
        background-color: transparent;
        color: @base05;
      }


      #workspaces button:hover {
        background: @base06;
      }

      #workspaces button.focused {
        background-color: @base06;
      }

      #workspaces button.urgent {
        background-color: @base05;
      }

      #mode {
        background-color: @base05;
        box-shadow: inset 0 -3px #ffffff;
      }

      #clock,
      #battery,
      #cpu,
      #memory,
      #temperature,
      #network,
      #pulseaudio {
        padding: 0 10px;
      }

      #pulseaudio {
        color: @base05;
      }

      #network {
        color: @base05;
      }

      #temperature {
        color: @base05;
      }

      #battery {
        color: @base05;
      }

      #clock {
        color: @base05;
      }

      #window {
        color: @base05;
      }

      #backlight {
        color: @base05;
      }

      .modules-right,
      .modules-left {
        background-color: @base00;
        border-radius: 0px;
        border: solid 1px;
        border-color: @base05
      }

      .modules-right {
        padding: 0 10px;
      }

      .modules-left {
        padding: 0 10px;
      }

      .modules-center {
        padding: 0 10px;
      }

      #battery.charging,
      #battery.plugged {
        color: @base05;
      }

      @keyframes blink {
        to {
          color: @base00;
        }
      }

      /* Using steps() instead of linear as a timing function to limit cpu usage */
      #battery.critical:not(.charging) {
        background-color: @base00;
        color: @base05;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: steps(12);
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      label:focus {
        background-color: @base00;
      }

      #pulseaudio.muted {
        color: @base05;
      }
    '';
  };
}
