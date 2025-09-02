{ pkgs, ... }:
{
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
