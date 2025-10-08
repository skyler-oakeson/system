{
  config,
  lib,
  utils,
  ...
}:
{
  options = {
    browsers = {
      default = utils.mkDefaultOption config.browsers;

      firefox = {
        enable = lib.mkEnableOption {
          description = "intall configured firefox";
          default = false;
        };
      };

      qutebrowser = {
        enable = lib.mkEnableOption {
          description = "intall configured qutebrowser";
          default = false;
        };
      };

      librewolf = {
        enable = lib.mkEnableOption {
          description = "intall configured librewolf";
          default = false;
        };
      };
    };
  };

  imports = [
    ./qutebrowser.nix
    ./firefox.nix
    ./librewolf.nix
  ];
}
