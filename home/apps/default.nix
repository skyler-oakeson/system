{ pkgs, ... }:
{
  imports = [
    ./communicators
    ./editors
    ./viewers
    ./browsers
    ./explorers/file-explorers.nix
    ./terminals/terminals.nix
  ];
}
