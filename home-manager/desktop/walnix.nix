{ ... }:
{
  walnix = {
    enable = true;
    path = ./wallpapers/forest.png;
    alpha = 100;
    backend = "wal";
    saturation = 40;
    checkContrast = true;
    dynamicThreshold = true;
    palette = "dark16";
    colorSpace = "lch";
    # threshold = 5;
  };
}
