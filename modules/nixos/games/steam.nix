{
  pkgs,
  lib,
  config,
  ...
}:
{

  options = {
    games = {
      steam.enable = lib.mkEnableOption "enable steam and system settings to run it.";
    };
  };

  config = lib.mkIf config.games.steam.enable {
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

    programs.appimage.enable = true;
    programs.appimage.binfmt = true;
  };
}
