# ===============================================
# Docker
#
# Search: https://search.nixos.org for more pkgs
# ===============================================
{
  config,
  lib,
  pkgs,
  ...
}: 
  let cfg = config.utils.docker;
  in
{
  options = {
    utils = {
      docker = with lib; {
        enable = mkEnableOption { 
          description = "Install docker.";
          default = false;
        };
      };
    };
  };

  config = lib.mkIf (cfg.enable) {
    virtualisation.docker.enable = true;
    virtualisation.docker.daemon.settings = {
      data-root = "/home/skyler/.docker";
  };
    users.extraGroups.docker.members = [ "skyler" ];
  };
}
