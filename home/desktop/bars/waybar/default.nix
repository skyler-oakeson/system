{
  user,
  ...
}:
{
  config = {
    home.file = {
      ".config/waybar/power_menu.xml" = {
        source = ./power_menu.xml;
      };
    };

    programs.waybar = {
      enable = true;
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
            "clock"
            "custom/power"
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

          "custom/power" = {
            "format" = "[ ]";
            "tooltip" = false;
            "menu" = "on-click";
            "menu-file" = "~/.config/waybar/power_menu.xml";
            "menu-actions" = {
              "shutdown" = "shutdown";
              "reboot" = "reboot";
              "suspend" = "systemctl suspend";
              "hibernate" = "systemctl hibernate";
            };
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
            "format-muted" = "__%";
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
        @import "${user.locations.theme}/colors_waybar.css";

        * {
          font-family: "monospace";
          font-size: 20px;
        }

        window#waybar {
          background-color: transparent;
          border-radius: ${toString user.preferences.ui.radius}px;
        }

        button {
          border: solid ${toString user.preferences.ui.borderSize}px;
          border-radius: ${toString user.preferences.ui.radius}px;
          border-color: @foreground;
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
            margin-left: 5px;
            margin-right: 5px;
        }

        #workspaces button.active {
            color: @color8;
        }

        #workspaces button {
          background-color: @background;
          border-color: @color8;
          color: @foreground;
          margin-left: 2px;
          margin-right: 2px;
          box-shadow: 5px 5px rgba(0, 0, 0, .25);
        }

        #workspaces button.focused {
          background-color: @foreground;
          color: @background;
        }

        #window {
          border: solid ${toString user.preferences.ui.borderSize}px;
          border-color: @color8;
        }

        menu {
          border-radius: ${toString user.preferences.ui.radius}px;
          background: @background;
          color: @color8;
          box-shadow: 5px 5px rgba(0, 0, 0, .25);
          border-color: @foreground;
        }

        menuitem {
        }

        #custom-power,
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
          color: @color8;
          background: @background;
          border: solid ${toString user.preferences.ui.borderSize}px;
          border-color: @color8;
          margin-right: 10px;
          box-shadow: 5px 5px rgba(0, 0, 0, .25);
          padding: 5px 5px;
          border-radius: ${toString user.preferences.ui.radius}px;
        }

        #pulseaudio {
          color: @color4;
        }

        #network {
          color: @color14;
        }


        #temperature {
          color: @color11;
        }

        #clock {
          color: @color13;
        }

        #custom-power {
          color: @color5;
        }

        .modules-left,
        .modules-center,
        .modules-right {
          background-color: transparent;
          /* background: radial-gradient(@background .5px,transparent 2px) 0 0/5px 5px, transparent; */
          margin-bottom: 10px;
          border-radius: ${toString user.preferences.ui.radius}px;
        }
      '';
    };
  };
}
