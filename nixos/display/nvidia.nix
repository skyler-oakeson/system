{
  config,
  lib,
  ...
}:
{
  config = lib.mkIf (config.display.drivers.nvidia.enable) {
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
