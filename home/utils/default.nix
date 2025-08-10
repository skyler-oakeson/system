{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnome-disk-utility
    pwvucontrol
    qbittorrent
  ];
}
