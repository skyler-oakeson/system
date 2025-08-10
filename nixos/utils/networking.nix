{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    curl # command line HTTP client
    dig # DNS lookup utility
    ipfetch # neofetch for IP addresses
    wget # web file downloader
    wirelesstools # wireless network configuration tools
    xh # better curl
  ];
}
