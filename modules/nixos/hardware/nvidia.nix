{
  config,
  lib,
  ...
}:
let
  cfg = config.hardware.drivers.nvidia;
in
with lib; {
  options = {
    hardware = {
      drivers = {
        nvidia = {
          enable = mkEnableOption {
            description = "Install and use NVIDIA GPU drivers.";
          };
        };
      };
    };
  };

  config = mkIf (cfg.enable) {
    hardware.graphics = {
      enable = true;
    };

    services.xserver.videoDrivers = [ "nvidia" ];

    hardware.nvidia = {
      modesetting.enable = true;

      # Helps with suspend and wake
      powerManagement.enable = true;

      open = false;
      nvidiaSettings = true;
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
