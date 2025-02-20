{pkgs, config, ...}: {
  home.packages = with pkgs; [
    (wrapFirefox (firefox-unwrapped.override { pipewireSupport = true;}) {})
  ];

  programs.firefox = {
    enable = false;
  };

}
