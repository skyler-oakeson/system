{ config, pkgs, ... }:
{
  config = {
    programs.nushell = {
      enable = true;
      configFile.source = ./nushell/config.nu;
    };
  };
}
