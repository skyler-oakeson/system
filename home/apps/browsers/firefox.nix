{ user, lib, ... }:
{
  config = {
    programs.firefox = {
      enable = true;
      policies = {
        BlockAboutConfig = true;
      };
    }
    // lib.mkMerge [
      (lib.mkIf (user ? locations.downloads) {
        policies.DefaultDownloadDirectory = user.locations.downloads;
      })
    ];
  };
}
