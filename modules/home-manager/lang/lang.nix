{ pkgs, ... }: 

# ===============================================
# Installed Programming Languages
# 
# Search: https://search.nixos.org for more pkgs 
# ===============================================

{
  home.packages = with pkgs; [ 
    ghc
    python39
    gcc
  ];
}
