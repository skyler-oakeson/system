{
  pkgs,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf (config.display.drivers.amd.enable) {
    boot.initrd.kernelModules = [ "amdgpu" ];
    environment.systemPackages = with pkgs; [ lact ];

    # Enable for wayland and xorg
    services.xserver.videoDrivers = [ "amdgpu" ];

    # For 32 bit applications
    hardware.graphics = {
      enable32Bit = true; # For 32 bit applications
      extraPackages32 = with pkgs; [
        driversi686Linux.amdvlk
      ];
      # AMD vulkan drivers
      extraPackages = with pkgs; [
        amdvlk
      ];
    };

    # Start the gpu management deamon
    systemd = {
      packages = with pkgs; [ lact ];
      services.lactd.wantedBy = [ "multi-user.target" ];
    };

    # for Southern Islands (SI i.e. GCN 1) cards
    # for Sea Islands (CIK i.e. GCN 2) cards
    boot.kernelParams = [
      "radeon.si_support=0"
      "amdgpu.si_support=1"
      "radeon.cik_support=0"
      "amdgpu.cik_support=1"
    ];
  };
}
