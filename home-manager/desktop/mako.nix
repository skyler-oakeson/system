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
    borderColor = color13;
    textColor = background;
    backgroundColor = color5;
    defaultTimeout = 10000;
    anchor = "top-right";
    borderSize = 2;
  };
}
