# ===============================================
# Docker
#
# Search: https://search.nixos.org for more pkgs
# ===============================================
{
  config,
  lib,
  pkgs,
  user,
  ...
}:
{
  config = {
    virtualisation.docker.enable = true;
    virtualisation.docker.daemon.settings = {
      data-root = "/home/${user.username}/.cache/.docker";
    };
    users.extraGroups.docker.members = [ user.username ];
  };
}
