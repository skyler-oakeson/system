{ config, ... }:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "${config.xdg.configHome}/wallpapers/trees_river_painting.jpg" ];
      wallpaper = [ ",${config.xdg.configHome}/wallpapers/trees_river_painting.jpg" ];
    };
  };
}
