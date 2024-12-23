{ pkgs, ... }:

{
  wayland.windowManager.hyprland = {
    enable = false;
    package = pkgs.hyprland;
    xwayland.enable = true;

    # Whether to enable hyprland-session.target on hyprland startup
    systemd.enable = true;

    settings = {
        "$mod" = "MOD4";
        bind = [

        ];
    };
  };
}
