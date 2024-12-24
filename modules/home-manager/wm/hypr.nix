{ pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprpaper
    hyprlock
    hypridle
    hyprcursor
    hyprutils
    waybar
  ];


  wayland.windowManager.hyprland = {
    enable = true;
    package = pkgs.hyprland;
    xwayland.enable = true;

    # Whether to enable hyprland-session.target on hyprland startup
    systemd = {
        enable = true;
        variables = ["--all"];
    };

    settings = {
        monitor=",3456x2234,auto,1";

        dwindle = {
            pseudotile = "yes";
            preserve_split = "yes";
        };

        env = [
            "MOZ_ENABLE_WAYLAND,1"
            "XCURSOR_SIZE,24"
            # "QT_QPA_PLATFORMTHEME,qt6ct"
            # "QT_QPA_PLATFORM,wayland;xcb"
            # "QT_QPA_PLATFORMTHEME,qt6ct"
            # "QT_QPA_PLATFORMTHEME,qt5ct"
            # "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
            # "QT_AUTO_SCREEN_SCALE_FACTOR,1"
        ];

        "$terminal" = "kitty";
        "$fileManager" = "kitty ranger";
        "$menu" = "wofi --width=30% --height=30% --show drun";
        "$mod" = "MOD4";

        "exec-once" = "hyprpaper";

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
            border_size = 1;
            # "col.active_border" = "";
            # "col.inactive_border" = "";
            layout = "dwindle";
            resize_on_border = false;
            allow_tearing = false;
            border_part_of_window = false ;
        };


        decoration = {
            # See https://wiki.hyprland.org/Configuring/Variables/ for more

            rounding = 3;
            
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

            shadow = {
                range = 30;
                render_power = 4;
                color = "0x66000000";
                offset = "5 5";
            };
        };


        ## SLIDE IN OUT
        animations = {
            enabled = true;
            bezier = [
                "wind, 0.05, 0.9, 0.1, 1.05"
                "winIn, 0.1, 1.1, 0.1, 1.1"
                "winOut, 0.3, -0.3, 0, 1"
                "liner, 1, 1, 1, 1"
            ];
            animation =[
                "windows, 1, 6, wind, slide"
                "windowsIn, 1, 6, winIn, slide"
                "windowsOut, 1, 5, winOut, slide"
                "windowsMove, 1, 5, wind, slide:"
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
        ];
      };
    };
}
