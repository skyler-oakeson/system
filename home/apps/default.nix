{ pkgs, ... }:
{
  imports = [
    ./messaging
    ./editors
    ./viewers
    ./browsers
    ./explorers
    ./terminals
  ];
}
