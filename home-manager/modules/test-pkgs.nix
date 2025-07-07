# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Test Packages
# Description: Test packages here!
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.test-pkgs;
in
{
  options = {
    test-pkgs = with lib; {
      enable = mkEnableOption {
        description = "Install test pkgs.";
        default = false;
      };
    };
  };

  config = lib.mkIf (cfg.enable) ({
    home.packages = with pkgs; [
      graphviz
      dot2tex
    ];
  });
}
