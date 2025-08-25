{
  config,
  lib,
  user,
  ...
}:
{
  programs.rofi = lib.mkIf (config.launchers.rofi.enable) {
    enable = false;
    theme = "dmenu";
  };
}
