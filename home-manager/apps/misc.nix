# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Misc
# Description: Test packages here!
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  config,
  lib,
  pkgs,
  ...
}: 
  let cfg = config.apps.misc;
  in
{
  options = {
    apps = {
      misc = with lib; {
        enable = mkEnableOption { 
          description = "Install test apps.";
          default = false;
        };
      };
    };
  };
  config = lib.mkIf (
    cfg.enable
  )
  (
    {
      home.packages = with pkgs; [
        vlc
      ];
    }
  );
}
