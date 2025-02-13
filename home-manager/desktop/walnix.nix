{ ... }:
{
  walnix = {
    enable = true;
    path = ./wallpapers/lighthouse.jpg;
    backend = "wal";
    saturation = 1;
    checkContrast = true;
    # dynamicThreshold = true;
    palette = "dark16";
    colorSpace = "labmixed";
    alpha = 0;
    threshold = 5;
  };
}
