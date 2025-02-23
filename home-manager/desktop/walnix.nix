{ ... }:
{
  walnix = {
    enable = true;
    path = ./wallpapers/forest_path.jpg;
    backend = "wal";
    saturation = 30;
    checkContrast = true;
    dynamicThreshold = true;
    palette = "dark16";
    colorSpace = "lchmixed";
    # threshold = 5;
  };
}
