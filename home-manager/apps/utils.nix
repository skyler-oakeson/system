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
  let cfg = config.apps.utils;
  in
{
  options = {
    apps = {
      utils = with lib; {
        enable = mkEnableOption { 
          description = "Install command line utils.";
          default = false;
        };
      };
    };
  };

  config = lib.mkIf (cfg.enable) {
      home.packages = with pkgs; [
        ripgrep
        fd
        fzf
        tree
        gnumake
        cmake
        libgccjit
        wl-clipboard
        zip
        unzip
        comma
        usbutils
        jq
     ];
  };
}
