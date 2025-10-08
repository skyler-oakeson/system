{ pkgs, ... }:
{
  environment.systemPackages = with pkgs; [
    gdb # GNU Project Debugger
    glib
    gsettings-desktop-schemas
    libGL
    libGLU
    libtool
    libgccjit
    libva # video acceleration API
    mesa # open source 3D graphics library

    # --- CORE SYSTEM UTILITIES ---
    coreutils # Basic GNU tools
    coreutils-prefixed # Prefixed version of coreutils
    util-linux # Includes lscpu
    uutils-coreutils-noprefix # An improvement over coreutils

    # --- BUILD ESSENTIALS ---
    gnumake # Make files
    gnutls # GNU transport layer security library
    gcc # GNU compiler collection
    pkg-config # Package information finder
    gnum4
    cmake
    autoconf
    automake

    # --- VERSION CONTROL ---
    git
    hwinfo # hardware detection tool from openSUSE

    # --- HARDWARE INFORMATION TOOLS ---
    dmidecode # system hardware details
    dool # system statistics tool (dstat replacement)
    inxi # my swiss army knife
    lshw # list hardware
    pciutils # lspci
    read-edid # EDID information
    smartmontools # S.M.A.R.T. monitoring
    upower # D-Bus service for power management
    usbutils # lsusb
    evtest # live-test keyboards
    libinput # handle inputs in Wayland

    # --- AUDIO TOOLS ---
    alsa-utils # ALSA utilities

    # --- HARDWARE TESTING ---
    stress # perform stress tests on CPU

    # --- EDITOR ---
    vim

    # --- NIX ---
    nix-index # search nixpkgs from cmd
  ];
}
