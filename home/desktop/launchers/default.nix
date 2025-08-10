{ lib, ... }:
{
  imports = [
    ./rofi.nix
    ./tofi.nix
    ./wofi.nix
  ];

  options = with lib; {
    launchers = {
      default = mkOption {
        type = types.enum [
          "wofi"
          "tofi"
          "rofi"
        ];
        default = "wofi";
      };

      wofi = {
        enable = mkEnableOption {
          description = "install wofi";
          default = false;
        };
        cmd = mkOption {
          type = types.str;
          default = "wofi --width=30% --height=30% --show drun";
        };
      };

      rofi = {
        enable = mkEnableOption {
          description = "install rofi";
          default = false;
        };
        cmd = mkOption {
          type = types.str;
          default = "rofi -show drun";
        };
      };

      tofi = {
        enable = mkEnableOption {
          description = "install tofi";
          default = false;
        };
        cmd = mkOption {
          type = types.str;
          default = "tofi-drun";
        };
      };
    };
  };

}
