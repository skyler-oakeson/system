{
  config,
  lib,
  ...
}:
{
  config = lib.mkIf (config.explorers.yazi.enable) {
    programs.yazi = {
      enable = true;
      enableZshIntegration = true;
    };
  };
}
