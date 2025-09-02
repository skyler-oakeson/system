{ lib, ... }:
{
  imports = [
    ./nvidia.nix
    ./amd.nix
    ./wayland.nix
  ];

  options = with lib; {
    display = {
      drivers = {
        amd = {
          enable = mkEnableOption {
            description = "Install and use AMD GPU drivers.";
          };
        };

        nvidia = {
          enable = mkEnableOption {
            description = "Install and use nvidia GPU drivers.";
          };
        };
      };
    };
  };
}
