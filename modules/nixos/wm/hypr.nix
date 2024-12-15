{ pkgs, lib, inputs, ... }: 
{
  environment.systemPackages = with pkgs; [ 
    hyprland
    hyprpaper
    hyprlock
    hypridle
    hyprutils
  ];
}
