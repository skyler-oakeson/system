# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Command Line Utilities
#
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.utils;
in
{
  options = {
    utils = with lib; {
      enable = mkEnableOption {
        description = "Install command line utils.";
        default = false;
      };
    };
  };

  config = lib.mkIf (cfg.enable) {
    home.packages = with pkgs; [
      ripgrep
      fd
      fzf
      tree
      zip
      unzip
      comma
      usbutils
      neofetch
      btop
      wl-clipboard
      autoconf
      automake
      libtool
      gnum4
      gnumake
      cmake
      libgccjit
      findutils
      nix-index
    ];

    programs.git = {
      enable = true;
    };
  };
}
