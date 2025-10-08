{ pkgs, ... }:
{
  imports = [
    ./browser
    ./cli
    ./terminal
    ./gui
  ];
}
