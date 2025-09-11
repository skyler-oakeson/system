{
  pkgs,
  lib,
  user,
  config,
  ...
}:
{
  services.hyprpaper = {
    enable = true;
    settings = {
      preload = [ "${config.xdg.configHome}/wallpapers/${user.preferences.wallpaper.file}" ];
      wallpaper = [ ",${config.xdg.configHome}/wallpapers/${user.preferences.wallpaper.file}" ];
    };
  };

  home.activation = {
    mkWallpaper = lib.hm.dag.entryAfter [ "writeBoundary" "installPackages" "git" ] ''
      if [ ! -d "${config.xdg.configHome}/wallpapers" ]; then
        ${pkgs.git}/bin/git clone ${user.preferences.wallpaper.repo} ${config.xdg.configHome}/wallpapers
      fi
    '';
  };
}
