{ ... }:
{
  walnix = {
    enable = true;
    path = ./wallpapers/sunset_on_buildings.jpg;
    alpha = 100;
    backend = "wal";
    saturation = 40;
    checkContrast = true;
    dynamicThreshold = true;
    palette = "dark16";
    colorSpace = "lab";
    # threshold = 5;
  };
}
