{
  pkgs,
  inputs,
  config,
  user,
  lib,
  ...
}:
{
  # Home Manager needs a bit of information about you and the paths it should manage.
  home.username = "${user.username}";

  imports = [
    ../../home/modules
  ];

  # TERMINALS
  terminals.default = "ghostty";
  programs.kitty.enable = true;
  programs.ghostty.enable = true;

  # BROWSERS
  browsers.default = "qutebrowser";
  programs.firefox.enable = true;
  programs.chromium.enable = false;
  programs.qutebrowser.enable = true;

  file-explorers.default = "ranger";
  programs.ranger.enable = true;

  # WINDOW MANAGERS
  programs.hypr.enable = true;
  programs.waybar.enable = true;

  # SHELLS
  programs.zsh.enable = true;

  # NOTIFICATION SERVICES
  notifiers.default = "mako";
  services.mako.enable = true;

  # LAUNCHERS
  launchers.default = "tofi";
  programs.wofi.enable = false;
  programs.rofi.enable = false;
  programs.tofi.enable = true;

  # APPS
  programs.btop.enable = true;
  programs.obs-studio.enable = true;
  programs.spotify-player.enable = true;
  programs.wallust.enable = true;
  programs.neovim.enable = true;
  programs.helix.enable = false;
  programs.feh.enable = true;
  programs.vlc.enable = true;
  programs.fastfetch.enable = true;
  programs.qbittorrent.enable = true;
  programs.pwvucontrol.enable = true;
  programs.discord.enable = true;

  test-pkgs.enable = true;
  utils.enable = true;

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
