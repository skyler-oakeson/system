{ pkgs, ... }:
{
  home.packages = with pkgs; [
    vlc # view video files
    feh # view image files
    zathura # pdf image viewer
    obs-studio # record screen audio and video
    spotify
    discord
  ];
}
