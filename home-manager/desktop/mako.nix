{
  pkgs, 
  config,
  ...
}: {
  home.packages = with pkgs; [
    mako
  ];

  services.mako = with config.walnix.colors.hex; {
    enable = true;
    borderColor = color5;
    textColor = background;
    backgroundColor = color2;
    defaultTimeout = 10000;
    anchor = "top-right";
    borderSize = 2;
  };
}
