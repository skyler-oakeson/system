# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Hyprland
# Hyprpaper
# Hyprlock
# Hyprcursor
# Hypridle
# Hyprutils
# Hyprshot
#
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  pkgs,
  inputs,
  config,
  lib,
  ...
}:
let
  cfg = config.desktop.hypr;
  cursorSize = 32;
in
{
  options = {
    desktop = {
      hypr = with lib; {
        enable = mkEnableOption {
          description = "Install Hyprland and related apps.";
          default = false;
        };
      };
    };
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      hyprland
      hyprpaper
      hyprlock
      hyprcursor
      hypridle
      hyprutils
      hyprshot
      inputs.hyprland-qtutils.packages."${system}".default
    ];

    services.hyprpaper = {
      enable = true;
      settings = {
        enable = true;
        preload = [ "${config.walnix.path}" ];
        wallpaper = [ ",${config.walnix.path}" ];
      };
    };

    home.pointerCursor = with pkgs; {
      hyprcursor = {
        enable = true;
        size = cursorSize;
      };
      gtk.enable = true;
      x11.enable = true;
      package = vanilla-dmz;
      name = "Vanilla-DMZ-AA";
      size = cursorSize;
    };

    wayland.windowManager.hyprland = with pkgs; {
      enable = true;
      package = hyprland;
      xwayland.enable = true;

      # Whether to enable hyprland-session.target on hyprland startup
      systemd = {
        enable = true;
        variables = [ "--all" ];
      };

      settings = with config.walnix.colors.rgba; {
        monitor = [
          "DP-1,highres@highr,auto,1.0"
          "DP-2,highres@highr,auto,1.25"
        ];

        dwindle = {
          pseudotile = "yes";
          preserve_split = "yes";
        };

        env = [
          "MOZ_ENABLE_WAYLAND,1"
          "NIXOS_OZONE_WL,1"
          "QT_QPA_PLATFORMTHEME,qt6ct"
          "QT_QPA_PLATFORM,wayland;xcb"
          "QT_QPA_PLATFORMTHEME,qt6ct"
          "QT_QPA_PLATFORMTHEME,qt5ct"
          "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
          "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        ];

        "$terminal" = "${config.apps.term.selected}";
        "$fileManager" = "kitty ranger";
        "$menu" = "wofi --width=30% --height=30% --show drun";
        "$mod" = "MOD4";

        "exec-once" = [
          "setcursor Vanilla-DMZ ${toString cursorSize}"
          "waybar"
          "mako"
        ];

        "exec" = [
          "pkill hyprpaper"
          "hyprpaper"
        ];

        input = {
          kb_layout = "us";
          repeat_rate = 35;
          repeat_delay = 400;

          follow_mouse = 1;

          touchpad = {
            # natural_scroll = "yes";
            scroll_factor = .4;
            disable_while_typing = true;
            clickfinger_behavior = true;
            tap-to-click = false;
          };

          sensitivity = 0; # -1.0 to 1.0, 0 means no modification.
        };

        gestures = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          workspace_swipe = "on";
          workspace_swipe_fingers = 4;
        };

        general = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          gaps_in = 5;
          gaps_out = 10;
          border_size = 2;
          "col.active_border" = color13;

          # Use this when you want borders
          # "col.inactive_border" = color4;

          # Use this when you want no borders
          "col.inactive_border" = "rgba(00000000)";

          layout = "dwindle";
          resize_on_border = false;
          allow_tearing = false;
        };

        group = {
          "col.border_inactive" = color1;
          "col.border_active" = color0;
          "col.border_locked_active" = color3;

          groupbar = {
            text_color = color4;
            "col.active" = color1;
            "col.inactive" = color0;
          };
        };

        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
        };

        decoration = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          rounding = 0;
          blur = {
            enabled = true;
            size = 12;
            passes = 4;
            new_optimizations = "on";
            xray = false;
            ignore_opacity = true;
          };

          active_opacity = 1.0;
          inactive_opacity = 1.0;
          border_part_of_window = false;

          shadow = {
            enabled = true;
            range = 10;
            render_power = 4;
            sharp = false;
            ignore_window = true;
            color = "rgba(00000062)";
            # color_inactive = "rgba(00000000)";
            offset = "5 5";
            scale = 1.0;
          };
        };

        workspace = [
          "1,monitor:DP-1"
          "2,monitor:DP-2"
        ];

        cursor = {
          enable_hyprcursor = false;
        };

        xwayland = {
          force_zero_scaling = true;
        };

        debug = {
          enable_stdout_logs = true;
        };

        # Sliding windows
        animations = {
          enabled = true;
          bezier = [
            "wind, 0.05, 0.9, 0.1, 1.00"
            "winIn, 0.1, 1.0, 0.1, 1.0"
            "winOut, 0.3, 0.1, 0, 1"
            "liner, 1, 1, 1, 1"
          ];
          animation = [
            "windows, 1, 5, wind, popin"
            "windowsIn, 1, 5, winIn, popin"
            "windowsOut, 1, 5, winOut, popin"
            "windowsMove, 1, 5, wind"
            "border, 1, 1, liner"
            "borderangle, 1, 30, liner, loop"
            "fade, 1, 10, default"
            "workspaces, 1, 5, wind"
          ];
        };

        windowrulev2 = [
          # Example windowrule v1
          # windowrule = float, ^(kitty)$
          # Example windowrule v2
          # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$
          # See https://wiki.hyprland.org/Configuring/Window-Rules/ for more
          "suppressevent maximize, class:.*" # You'll probably like this.

          # General floating
          "float,class:(dotfiles-floating)"
          "size 1000 700,class:(dotfiles-floating)"
          "center,class:(dotfiles-floating)"
          "pin, class:(dotfiles-floating)"

          # Pavucontrol floating
          "float,class:(.*org.pulseaudio.pavucontrol.*)"
          "size 700 600,class:(.*org.pulseaudio.pavucontrol.*)"
          "center,class:(.*org.pulseaudio.pavucontrol.*)"
          "pin,class:(.*org.pulseaudio.pavucontrol.*)"

          # Spotify floating special
          "workspace:special, float, size 1000 1000, class:^(spotify)$"

        ];

        layerrule = [
          # Removes black border on screenshots
          "noanim, hyprpicker"
          "noanim, selection"
        ];

        binde = [
          # Volume button that allows press and hold, volume limited to 150%
          ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ];

        bindm = [
          # Move/resize windows with mod + LMB/RMB and dragging
          "$mod, mouse:272, movewindow"
          "$mod, mouse:273, resizewindow"
        ];

        bindl = [
          # Volume button that will activate even while an input inhibitor is active
          ", XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"

          # Volume button that will mute
          ", XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
        ];

        bind = [
          "$mod, C, exec, $terminal"
          "$mod, Q, killactive,"
          "$mod, E, exec, $fileManager"
          "$mod, V, togglefloating,"
          "$mod, SPACE, exec, pkill wofi || $menu"
          "$mod, ESCAPE, exec, systemctl suspend"

          "$mod, U, pseudo, # dwindle"
          "$mod, T, togglesplit, # dwindle"
          "$mod, F, fullscreen, 0"

          # Move focus with mod + vim keys
          "$mod, H, movefocus, l"
          "$mod, L, movefocus, r"
          "$mod, K, movefocus, u"
          "$mod, J, movefocus, d"

          # Move windows with mod and shift + vim keys
          "$mod Shift, H, movewindow, l"
          "$mod Shift, L, movewindow, r"
          "$mod Shift, K, movewindow, u"
          "$mod Shift, J, movewindow, d"

          # Switch workspaces with mod + [0-9]
          "$mod, 1, workspace, 1"
          "$mod, 2, workspace, 2"
          "$mod, 3, workspace, 3"
          "$mod, 4, workspace, 4"
          "$mod, 5, workspace, 5"
          "$mod, 6, workspace, 6"
          "$mod, 7, workspace, 7"
          "$mod, 8, workspace, 8"
          "$mod, 9, workspace, 9"
          "$mod, 0, workspace, 10"
          "$mod, N, workspace, +1"
          "$mod, P, workspace, -1"

          # Move active window to a workspace with mod + SHIFT + [0-9]
          "$mod SHIFT, 1, movetoworkspace, 1"
          "$mod SHIFT, 2, movetoworkspace, 2"
          "$mod SHIFT, 3, movetoworkspace, 3"
          "$mod SHIFT, 4, movetoworkspace, 4"
          "$mod SHIFT, 5, movetoworkspace, 5"
          "$mod SHIFT, 6, movetoworkspace, 6"
          "$mod SHIFT, 7, movetoworkspace, 7"
          "$mod SHIFT, 8, movetoworkspace, 8"
          "$mod SHIFT, 9, movetoworkspace, 9"
          "$mod SHIFT, 0, movetoworkspace, 10"
          "$mod SHIFT, N, movetoworkspace, +1"
          "$mod SHIFT, P, movetoworkspace, -1"

          # Example special workspace (scratchpad)
          "$mod, S, togglespecialworkspace, magic"
          "$mod SHIFT, S, movetoworkspace, special:magic"

          # Scroll through existing workspaces with mod + scroll
          "$mod, mouse_down, workspace, e+1"
          "$mod, mouse_up, workspace, e-1"

          # Take screenshot
          "$mod, PRINT, exec, hyprshot -m region"
          "$mod CONTROL, PRINT, exec, hyprshot -m output -m active"
        ];
      };
    };
  };
}
