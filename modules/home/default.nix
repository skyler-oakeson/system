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
  browsers.firefox.enable = true;
  browsers.librewolf.enable = true;

  # LAUNCHERS
  launchers.default = "wofi";
  launchers.wofi.enable = true;

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  home.file = {
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
