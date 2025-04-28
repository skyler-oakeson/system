{
  pkgs,
  inputs,
  config,
  ...
}: {
  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "skyler";
  home.homeDirectory = "/home/skyler";

  imports = [
    ./desktop
    ./apps
    ./lang
  ];

  nixpkgs.config = {
    allowUnfree = true;
  };

  apps = {
    qbittorrent.enable = true;
    pwvucontrol.enable = true;
    obs-studio.enable = true;
    spicetify.enable = true;
    discord.enable = true;
    firefox.enable = true;
    neovim.enable = true;
    ranger.enable = true;
    kitty.enable = true;
    utils.enable = true;
    misc.enable = true;
    zsh.enable = true;
    vlc.enable = true;
    wofi.enable = true;
  };

  desktop = {
    hypr.enable = true;
    waybar.enable = true;
    mako.enable = true;
  };

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
