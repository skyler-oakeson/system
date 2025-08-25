{
  config,
  lib,
  utils,
  ...
}:
{
  options = with lib; {
    editors = {
      default = utils.mkDefaultOption config.editors;
      helix = {
        enable = mkEnableOption {
          description = "intall configured helix";
          default = false;
        };
      };

      nvim = {
        enable = mkEnableOption {
          description = "intall configured nvim";
          default = false;
        };
      };
    };
  };

  imports = [
    ./nvim
    ./helix
    ./lsp.nix
  ];
}
