{ pkgs, inputs, ... }: 
{
  environment.systemPackages = with pkgs; [ 
    hyprland
    hyprutils
  ];

  # services.displayManager.sddm.enable = true; #This line enables sddm
  services.xserver.enable = true; # Might need this for Xwayland  
  environment.sessionVariables.NIXOS_OZONE_WL = "1"; # This variable fixes electron apps in wayland

}
