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
            "*" = 4; # 5 workspaces by default on every monitor
            "HDMI-A-1" = 3; # but only three on HDMI-A-1
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
          "on-click" = "pavucontrol";
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

      @define-color background #${config.colorScheme.palette.base00};
      @define-color foreground #${config.colorScheme.palette.base05};

      window#waybar {
        background-color: rgba(0, 0, 0, 0);
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

      /* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
      button:hover {
        background: inherit;
        box-shadow: inset 0 -3px @foreground;
      }

      /* you can set a style on hover for any module like this */
      #pulseaudio:hover {
        background-color: @foreground;
      }

      #workspaces {
          color: @foreground;
      }

      #workspaces button.active {
          color: @background;
          background: @foreground
      }

      #workspaces button {
        padding: 0 5px;
        background-color: transparent;
        color: @foreground;
      }


      #workspaces button:hover {
        background: rgba(0, 0, 0, 0.2);
      }

      #workspaces button.focused {
        background-color: @background;
        box-shadow: inset 0 -3px @foreground;
      }

      #workspaces button.urgent {
        background-color: @foreground;
      }

      #mode {
        background-color: @foreground;
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
        color: @foreground;
      }

      #network {
        color: @foreground;
      }

      #temperature {
        color: @foreground;
      }

      #battery {
        color: @foreground;
      }

      #clock {
        color: @foreground;
      }

      #window {
        color: @foreground;
      }

      #backlight {
        color: @foreground;
      }

      .modules-right,
      .modules-left {
        background-color: @background;
        border-radius: 0px;
        border: solid 1px;
        border-color: @foreground
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
        color: @foreground;
      }

      @keyframes blink {
        to {
          color: @background;
        }
      }

      /* Using steps() instead of linear as a timing function to limit cpu usage */
      #battery.critical:not(.charging) {
        background-color: @background;
        color: @foreground;
        animation-name: blink;
        animation-duration: 0.5s;
        animation-timing-function: steps(12);
        animation-iteration-count: infinite;
        animation-direction: alternate;
      }

      label:focus {
        background-color: @background;
      }

      #pulseaudio.muted {
        color: @foreground;
      }
    '';
  };
}
