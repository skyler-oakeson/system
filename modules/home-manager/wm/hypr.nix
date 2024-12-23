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
    enable = false;
    package = pkgs.hyprland;
    xwayland.enable = true;

    # Whether to enable hyprland-session.target on hyprland startup
    systemd = {
        enable = true;
        variables = ["--all"];
    };

    settings = {
        dwindle = {
            pseudotile = true;
            preserve_split = true;
        };

        env = [

        ];

        "$mod" = "MOD4";
        binde = [
            # Volume button that allows press and hold, volume limited to 150%
            ", XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+"
        ];

        bindm = [
            # Move/resize windows with mainMod + LMB/RMB and dragging
            "$mainMod, mouse:272, movewindow"
            "$mainMod, mouse:273, resizewindow"
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

    home.pointerCursor = {
      gtk.enable = true;
      # x11.enable = true;
      package = pkgs.bibata-cursors;
      name = "Bibata-Modern-Classic";
      size = 16;
    };
}
