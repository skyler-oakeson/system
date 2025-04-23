{ ... }:
{
  walnix = {
    enable = true;
    path = ./wallpapers/clouds.jpg;
    alpha = 100;
    backend = "thumb";
    saturation = 30;
    checkContrast = true;
    dynamicThreshold = true;
    palette = "dark16";
    colorSpace = "lab";
    fallbackGenerator = "interpolate";
    # threshold = 30;
  };
}
