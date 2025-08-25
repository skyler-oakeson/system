{
  pkgs,
  inputs,
  config,
  lib,
  host,
  user,
  ...
}:
let
  cursorSize = 32;
in
{
  config = {
    home.packages = with pkgs; [
      hyprshot
      hyprutils
      wl-clipboard
      inputs.hyprland-qtutils.packages."${system}".default
    ];

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
        enableXdgAutostart = true;
        variables = [ "--all" ];
      };

      settings = {
        source = "${user.locations.theme}/colors_hypr.conf";

        monitor = lib.imap1 (
          i: monitor:
          "${monitor.id},${monitor.resolution}@${toString monitor.refreshRate},auto,${toString monitor.scale}"
        ) (lib.attrsets.mapAttrsToList (name: value: value) host.monitors);

        workspace = lib.imap1 (i: monitor: "${toString i},monitor${monitor.id}") (
          lib.attrsets.mapAttrsToList (name: value: value) host.monitors
        );

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

        "$terminal" = config.terminals.default or "";
        "$fileManager" = config.explorers.default or "";
        "$browser" = config.browsers.default or "";
        "$menu" = "${config.launchers.${config.launchers.default}.cmd}";
        "$mod" = "MOD4";

        "exec-once" = [
          "waybar"
        ];

        input = {
          kb_layout = "us";
          repeat_rate = 35;
          repeat_delay = 400;

          follow_mouse = 1;

          touchpad = {
            # natural_scroll = "yes";
            scroll_factor = 0.4;
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
          gaps_in = 10;
          gaps_out = "0, 20, 20, 20";
          border_size = 1;
          "col.active_border" = "$color8";

          # Use this when you want borders
          "col.inactive_border" = "$color0";

          # Use this when you want no borders
          # "col.inactive_border" = "rgba00000000";

          layout = "dwindle";
          resize_on_border = true;
          allow_tearing = false;
        };

        group = {
          "col.border_inactive" = "$color1";
          "col.border_active" = "$color0";
          "col.border_locked_active" = "$color3";

          groupbar = {
            text_color = "$color4";
            "col.active" = "$color1";
            "col.inactive" = "$color0";
          };
        };

        misc = {
          disable_hyprland_logo = true;
          disable_splash_rendering = true;
          enable_anr_dialog = false;
        };

        decoration = {
          # See https://wiki.hyprland.org/Configuring/Variables/ for more
          rounding = user.preferences.ui.radius;
          blur = {
            enabled = false;
            size = 4;
            passes = 4;
            noise = 0;
            contrast = 1.0;
            brightness = 1.0;
            new_optimizations = "on";
            xray = false;
            ignore_opacity = true;
          };

          active_opacity = 1.0;
          inactive_opacity = 0.90;
          border_part_of_window = false;

          # screen_shader = builtins.readFile ./shaders/bluelight.frag;

          shadow = {
            enabled = true;
            range = 0;
            render_power = 4;
            sharp = true;
            ignore_window = true;
            color = "rgba(00000080)";
            offset = "8 8";
            scale = 1.0;
          };
        };

        cursor = {
          enable_hyprcursor = true;
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
          "$mod, E, exec, $terminal -e $fileManager"
          "$mod, F, fullscreen, 0"
          "$mod, SPACE, exec, pkill $menu || $menu"
          "$mod, ESCAPE, exec, systemctl suspend"

          "$mod, V, togglefloating,"
          "$mod, T, togglesplit, # dwindle"
          "$mod, U, pseudo, # dwindle"
          "$mod, B, exec, $browser"

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
