{ pkgs, ... }:
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Installed Compilers
#
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  home.packages = with pkgs; [
    ghc
    # python3Full
    gcc
    gdb
    rustup
    gradle
    temurin-bin
    dart
    nodejs_24
    dotnet-sdk_9
    texliveFull
    typescript
  ];
}
