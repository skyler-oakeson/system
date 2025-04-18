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

        modules-left = ["hyprland/window"];
        modules-center = ["hyprland/workspaces"];

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
          "format" = "[{:%I:%M}]";
          "format-alt" = "[{:%m-%d-%Y}]";
          "tooltip" = false;
        };
        "cpu" = {
          "format" = "  {usage}%";
          "tooltip" = false;
        };
        "memory" = {
          "format" = "{}%  ";
          "tooltip" = false;
        };
        "temperature" = {
          "critical-threshold" = 80;
          "format" = "[temp: {temperatureC}°C]";
          "format-icons" = ["" "" ""];
          "tooltip" = false;
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
          "tooltip" = false;
        };
        "network" = {
          "format-wifi" = "[wifi: {signalStrength}%]";
          "format-ethernet" = "{cidr} ";
          "tooltip" = false;
          "format-linked" = "{ifname} (No IP) ";
          "format-disconnected" = "[wifi: !]";
          "format-alt" = "{ifname}: {ipaddr}/{cidr}";
        };
        "pulseaudio" = {
          "format" = "[vol: {volume}%]";
          "format-bluetooth" = "{volume}% {icon} {format_source}";
          "format-bluetooth-muted" = " {icon} {format_source}";
          "format-muted" = "[mut: {volume}%]";
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
          "tooltip" = false;
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
    style = with config.walnix.colors.rgba;
    ''
      @define-color color0 ${color0}; @define-color color1 ${color1}; @define-color color2 ${color2}; 
      @define-color color3 ${color3}; @define-color color4 ${color4}; @define-color color5 ${color5}; 
      @define-color color6 ${color6}; @define-color color7 ${color7}; @define-color color8 ${color8}; 
      @define-color color9 ${color9}; @define-color color10 ${color10}; @define-color color11 ${color11}; 
      @define-color color12 ${color12}; @define-color color13 ${color13}; @define-color color14 ${color14}; 
      @define-color color15 ${color15}; @define-color background ${background}; 
      @define-color foreground ${foreground};

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
        background: @color6;
      }

      #pulseaudio:hover {
        background-color: @background;
      }

      #workspaces {
          color: @color5;
          background: @background;
      }

      #workspaces button.active {
          color: @background;
          background: @color5;
      }

      #workspaces button {
        padding: 0 5px;
        background-color: transparent;
        color: @color5;
      }

      #workspaces button.focused {
        background-color: @color6;
      }

      #workspaces button.urgent {
        background-color: @background;
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
        color: @color5;
      }

      #window {
        padding: 0 5px;
      }


      .modules-left, 
      .modules-center,
      .modules-right {
        background-color: @background;
        border-radius: 0px;
        border: solid 2px;
        border-color: @color5;
        padding: 0 10px;
      }

      .modules-center {
        padding: 0 0px;
      }

      #battery.charging,
      #battery.plugged {
        color: @background;
      }

      @keyframes blink {
        to {
          color: @base00;
        }
      }

      /* Using steps() instead of linear as a timing function to limit cpu usage */
      #battery.critical:not(.charging) {
        background-color: @background;
        color: @color5;
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
        color: @background;
        background-color: @color5;
      }
    '';
  };
}
