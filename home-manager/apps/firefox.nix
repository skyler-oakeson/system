# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Firefox
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
  cfg = config.apps.firefox;
in
{
  options = {
    apps = {
      firefox = with lib; {
        enable = mkEnableOption { 
          description = "Install Firefox."; 
          default = false;
        };
      };
    };
  };
  config = lib.mkIf (cfg.enable) {
      home.packages = with pkgs; [
        (wrapFirefox (firefox-unwrapped.override {pipewireSupport = true;}) {})
      ];
      programs.firefox = {
        enable = false;
    };
  };
}
