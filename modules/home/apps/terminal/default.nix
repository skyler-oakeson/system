{
  config,
  lib,
  utils,
  ...
}:
{
  options = with lib; {
    terminals = {
      default = utils.mkDefaultOption config.terminals;

      kitty = {
        enable = mkEnableOption {
          description = "intall configured kitty";
          default = false;
        };
      };

      ghostty = {
        enable = mkEnableOption {
          description = "intall configured ghostty";
          default = false;
        };
      };
    };
  };

  imports = [
    ./kitty.nix
    ./ghostty.nix
  ];
}
