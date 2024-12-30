{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    wofi
  ];

  programs.wofi = {
    enable = true;
  };
}
