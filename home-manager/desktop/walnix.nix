{ ... }:
{
  walnix = {
    enable = true;
    path = ./wallpapers/loupe.png;
    alpha = 100;
    backend = "wal";
    saturation = 40;
    checkContrast = true;
    dynamicThreshold = true;
    palette = "dark16";
    colorSpace = "labmixed";
    # threshold = 5;
  };
}
