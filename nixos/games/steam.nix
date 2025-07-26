{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    steam.enable = lib.mkEnableOption "enable steam";
  };

  config = lib.mkIf config.steam.enable {
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
      extraCompatPackages = [ ];
      localNetworkGameTransfers.openFirewall = true;
      dedicatedServer.openFirewall = true;
      remotePlay.openFirewall = true;
      gamescopeSession.enable = true;
    };
  };
}
