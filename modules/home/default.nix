{
  config,
  user,
  ...
}:
{
  home.username = "${user.username}";

  imports = [
    ./apps
    ./develop
    ./utils
    ./services
    ./desktop
    ./shells
  ];

  # TERMINALS
  terminals.default = "kitty";
  terminals.kitty.enable = true;

  # BROWSERS
  browsers.default = "qutebrowser";
  browsers.qutebrowser.enable = true;
  browsers.firefox.enable = false;
  browsers.librewolf.enable = false;

  # LAUNCHERS
  launchers.default = "wofi";
  launchers.wofi.enable = true;

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.file = {
  };

  # Move this into the same file as mime types
  home.sessionVariables = {
    EDITOR = "nvim";
    BROWSER = "qutebrowser";
  };

  xdg.mimeApps.enable = true;
  # xdg.mimeApps.defaultApplications = {
  #   "text/html" = "org.qutebrowser.qutebrowser.desktop";
  #   "x-scheme-handler/http" = "org.qutebrowser.qutebrowser.desktop";
  #   "x-scheme-handler/https" = "org.qutebrowser.qutebrowser.desktop";
  #   "x-scheme-handler/about" = "org.qutebrowser.qutebrowser.desktop";
  #   "x-scheme-handler/unknown" = "org.qutebrowser.qutebrowser.desktop";
  # };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
