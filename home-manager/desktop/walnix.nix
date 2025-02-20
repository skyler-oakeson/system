{ ... }:
{
  walnix = {
    enable = true;
    path = ./wallpapers/chromatic_dark_1.jpg;
    backend = "wal";
    saturation = 30;
    checkContrast = true;
    dynamicThreshold = true;
    palette = "harddark16";
    # colorSpace = "lch";
    # threshold = 5;
  };
}
