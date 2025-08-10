{ lib, ... }:
{
  imports = [
    ./nvim
    ./helix
  ];

  options = {
    editors = {
      helix = {
        enable = lib.mkEnableOption {
          description = "intall configured helix";
          default = false;
        };
      };

      nvim = {
        enable = lib.mkEnableOption {
          description = "intall configured nvim";
          default = false;
        };
      };
    };
  };
}
