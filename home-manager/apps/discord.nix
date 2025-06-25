# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Discord
#
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  config,
  lib,
  pkgs,
  ...
}: 
  let cfg = config.apps.discord;
  in
{
  options = {
    apps = {
      discord = with lib; {
        enable = mkEnableOption { 
          description = "Install Discord.";
          default = false;
        };
      };
    };
  };
  config = lib.mkIf (cfg.enable)
  {
    home.packages = with pkgs; [
      discord
    ];
  };
}
