{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf (config.explorers.ranger.enable) {
    home.packages = with pkgs; [ ranger ];
  };
}
