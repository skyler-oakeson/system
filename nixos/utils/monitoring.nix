{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    bottom # better htop alternative
    btop # better htop alternative
    glxinfo # info for OpenGL & Mesa
    hyperfine # command-line benchmarking tool
    nmon # system monitoring tool
    psmisc # killall, pstree, etc.
    lm_sensors # tools for reading hardware sensors
    fastfetch # faster neofetch
  ];
}
