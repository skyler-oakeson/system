{ pkgs, ... }:
# ===============================================
# Installed Formatters and Linters
#
# Search: https://search.nixos.org for more pkgs
# ===============================================
{
  home.packages = with pkgs; [
    nixfmt-rfc-style
  ];
}
