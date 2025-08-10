# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# File-Explorers
#
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  config,
  lib,
  pkgs,
  ...
}:
{
  options = with lib; {
    file-explorers = {
      default = mkOption {
        type = types.enum [
          "ranger"
          "yazi"
          "superfile"
          "nnn"
        ];
        default = "ranger";
      };
    };
  };

  config = {
    home.packages = with pkgs; [
      ranger
    ];
  };
}
