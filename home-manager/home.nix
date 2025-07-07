{
  pkgs,
  inputs,
  config,
  username,
  ...
}:
{
  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "${username}";
  home.homeDirectory = "/home/${username}";

  imports = [
    ./modules
  ];

  terminals = {
    default = "kitty";
    kitty.enable = true;
  };

  browsers = {
    default = "firefox";
    firefox.enable = true;
    chromium.enable = true;
  };

  window-managers = {
    hypr.enable = true;
  };

  viewers = {
    feh.enable = true;
    vlc.enable = true;
  };

  file-explorers = {
    ranger.enable = true;
    default = "ranger";
  };

  shells = {
    zsh.enable = true;
  };

  notifiers = {
    mako.enable = true;
  };

  launchers = {
    default = "tofi";
    wofi.enable = false;
    rofi.enable = true;
    tofi.enable = false;
  };

  apps = {
    qbittorrent.enable = true;
    pwvucontrol.enable = true;
    obs-studio.enable = true;
    spicetify.enable = true;
    discord.enable = true;
    btop.enable = true;
    neofetch.enable = true;
    nvim.enable = true;
    spotify-player.enable = true;
  };

  test-pkgs.enable = true;
  waybar.enable = true;
  utils.enable = true;
  wallust.enable = true;

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
