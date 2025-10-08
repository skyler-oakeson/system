{
  pkgs,
  lib,
  config,
  ...
}:
let
  cfg = config.deskenv.hyprland;
in
with lib; {
  options = {
    deskenv = {
      hyprland = {
        enable = mkEnableOption {
          description = "Install Hyprland.";
        };
      };
    };
  };

  config = mkIf (cfg.enable) {
    programs.hyprland.enable = true;
    # Screen sharing with Wayland.
    xdg.portal = {
      enable = true;
      configPackages = with pkgs; [
        xdg-desktop-portal-wlr
        xdg-desktop-portal-hyprland
      ];
    };
  };
}
