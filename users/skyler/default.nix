{
  user,
  ...
}:
{
  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "${user.username}";

  imports = [
    ../../home/apps
    ../../home/develop
    ../../home/utils
    ../../home/services
    ../../home/desktop
  ];

  # TERMINALS
  terminals.default = "kitty";

  # BROWSERS
  browsers.default = "qutebrowser";

  file-explorers.default = "ranger";

  # LAUNCHERS
  launchers.default = "tofi";

  # You should not change this value, even if you update Home Manager. If you do
  # want to update the value, then make sure to first check the Home Manager
  # release notes.
  home.stateVersion = "24.11"; # Please read the comment before changing.

  # Home Manager is pretty good at managing dotfiles. The primary way to manage
  # plain files is through 'home.file'.
  home.file = {
    # # Building this configuration will create a copy of 'dotfiles/screenrc' in
    # # the Nix store. Activating the configuration will then make '~/.screenrc' a
    # # symlink to the Nix store copy.
    # ".screenrc".source = dotfiles/screenrc;

    # # You can also set the file content immediately.
    # ".gradle/gradle.properties".text = ''
    #   org.gradle.console=verbose
    #   org.gradle.daemon.idletimeout=3600000
    # '';
  };

  home.sessionVariables = {
    EDITOR = "nvim";
  };

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;
}
