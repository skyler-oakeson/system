{pkgs, ...}: {
  home.packages = with pkgs; [
    firefox
  ];

  programs.firefox = {
    enable = true;
  };
}
