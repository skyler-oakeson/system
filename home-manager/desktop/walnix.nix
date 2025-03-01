{ ... }:
{
  walnix = {
    enable = true;
    path = ./wallpapers/forest_path.jpg;
    backend = "wal";
    saturation = 40;
    checkContrast = true;
    dynamicThreshold = true;
    palette = "dark16";
    colorSpace = "labmixed";
    # threshold = 5;
  };
}
