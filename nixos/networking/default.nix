{ ... }:
{
  imports = [
    ./firewall.nix
    ./localization.nix
    ./proxy.nix
  ];

  networking.networkmanager.enable = true;
  # networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.
}
