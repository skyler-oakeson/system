{ lib, ... }:
{
  options = with lib; {
    browsers = {
      default = mkOption {
        type = types.enum [
          "firefox"
          "chromium"
          "qutebrowser"
        ];
        default = "firefox";
      };
    };
  };

  imports = [
    ./qutebrowser.nix
    ./firefox.nix
  ];
}
