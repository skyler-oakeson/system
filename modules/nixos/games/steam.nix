{pkgs, ...}:
{
  environment.systemPackages = with pkgs; [
    steam
    gamescope
    # steamcmd
    # steam-tui

    openssl
    nghttp2
    libidn2
    rtmpdump
    libpsl
    curl
    krb5
    keyutils
  ];

  programs.steam = {
    enable = true;
    extraCompatPackages = [];
    localNetworkGameTransfers.openFirewall = true;
    gamescopeSession.enable = true;
  };
}
