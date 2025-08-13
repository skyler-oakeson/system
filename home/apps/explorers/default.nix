{
  config,
  lib,
  utils,
  ...
}:
{
  options = {
    explorers = {
      default = utils.mkDefaultOption config.explorers;

      ranger = {
        enable = lib.mkEnableOption {
          description = "intall configured ranger";
          default = false;
        };
      };

      yazi = {
        enable = lib.mkEnableOption {
          description = "intall configured yazi";
          default = false;
        };
      };
    };
  };

  imports = [
    ./ranger.nix
    ./yazi.nix
  ];
}
