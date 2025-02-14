{ ... }:
{
  walnix = {
    enable = true;
    path = ./wallpapers/loupe.png;
    backend = "wal";
    saturation = 10;
    checkContrast = true;
    dynamicThreshold = true;
    palette = "dark16";
    colorSpace = "labmixed";
    # threshold = 5;
  };
}
