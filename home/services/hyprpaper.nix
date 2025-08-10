{ user, ... }:
{
  services.hyprpaper = {
    enable = user.services.hyprpaper or true;
    settings = {
      preload = [ "~/.config/wallpapers/trees_river_painting.jpg" ];
      wallpaper = [ ",~/.config/wallpapers/trees_river_painting.jpg" ];
    };
  };
}
