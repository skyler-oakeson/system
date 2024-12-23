{ pkgs, ... }: 
{
  environment.systemPackages = with pkgs; [ 
    hyprland
    hyprpaper
    hyprlock
    hypridle
    hyprutils
    waybar
  ];
}
