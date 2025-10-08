{
  pkgs,
  lib,
  config,
  ...
}:
{
  options = with lib; {
    display = {
      desktopEnvironment = {
        hyprland = {
          enable = mkEnableOption {
            description = "Install Hyprland.";
          };
        };

        xmonad = {
          enable = mkEnableOption {
            description = "Install xmonad.";
          };
        };
      };
    };
  };

  config =
    lib.mkIf (config.display.environment.hyprland.enable) {
      programs.hyprland.enable = true;
      # Screen sharing with Wayland.
      xdg.portal = {
        enable = true;
        configPackages = with pkgs; [
          xdg-desktop-portal-wlr
          xdg-desktop-portal-hyprland
        ];
      };
    }
    // lib.mkIf (config.display.environment.xmonad.enable) {
      services.xserver.enable = true;
      services.xserver.desktopManager.xmonad.enable = true;
    };
}
