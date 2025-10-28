{ pkgs, ... }:
{
  services.xserver.enable = true;
  services.xserver.displayManager.startx.enable = true;
  services.xserver.windowManager.xmonad = {
    enable = true;
    enableContribAndExtras = true;
  };

  environment.systemPackages = with pkgs; [
    xterm
  ];
}
