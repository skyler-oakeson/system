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
let
  cfg = config.file-explorers;
in
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
        default = "";
      };
    };
  };
}
