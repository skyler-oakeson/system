{pkgs, ...}:
# ===============================================
# Command Line Utilities
#
# Search: https://search.nixos.org for more pkgs
# ===============================================
{
  environment.systemPackages = with pkgs; [
    ripgrep
    fd
    fzf
    tree
    gnumake
    cmake
    libgccjit
    wl-clipboard
    zip
    unzip
    comma
    usbutils
  ];
}
