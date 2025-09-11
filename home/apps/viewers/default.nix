{ pkgs, ... }:
{
  imports = [
    ./spotify.nix
  ];

  home.packages = with pkgs; [
    vlc # view video files
    feh # view image files
    obs-studio # record screen audio and video
  ];
}
