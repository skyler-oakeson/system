{
  config,
  lib,
  user,
  ...
}:
{
  config = lib.mkIf (config.browsers.firefox.enable) {
    programs.firefox = {
      enable = true;
      policies = {
        BlockAboutConfig = true;
        DefaultDownloadDirectory = user.locations.downloads or "$HOME/downloads";
      };
    };
  };
}
