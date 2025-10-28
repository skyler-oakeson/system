{ pkgs, ... }:
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Installed Compilers
#
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  home.packages = with pkgs; [
    # python3Full
    gcc
    gdb
    gradle
    temurin-bin
    nodejs_24
    dotnet-sdk_9
    texliveFull
    typescript
    bun
    (haskellPackages.ghcWithPackages (
      self: with self; [
        haskell-language-server
      ]
    ))
  ];
}
