{
  inputs,
  pkgs,
  user,
  ...
}:
{
  config = {

    home.packages = with pkgs; [
      foxmarks
      pywalfox-native
    ];

    programs.librewolf = {
      enable = true;
      settings = {
        "toolkit.legacyUserProfileCustomizations.stylesheets" = true;
        "privacy.resistFingerprinting" = false;
        "privacy.clearOnShutdown.history" = false;
        "privacy.clearOnShutdown.cookies" = false;
        "network.cookie.lifetimePolicy" = 0;
        "autoDisableScopes" = 0;
        "animatedFox.squareCorners" = true;
      };

      policies = {
        "DefaultDownloadDirectory" = "/home/${user.username}/dwn";
      };

      profiles.${user.username} = {
        extensions.packages = with inputs.firefox-addons.packages.${pkgs.system}; [
          pywalfox
          bitwarden
        ];

        userContent = '''';

        userChrome = '''';
      };
    };
  };
}
