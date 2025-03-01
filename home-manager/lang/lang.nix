{pkgs, ...}:
# ===============================================
# Installed Compilers
#
# Search: https://search.nixos.org for more pkgs
# ===============================================
{
  home.packages = with pkgs; [
    ghc
    # python3
    gcc
    gdb
    rustup
    gradle
    temurin-bin
    dart
  ];
}
