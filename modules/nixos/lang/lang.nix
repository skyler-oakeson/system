{ pkgs, ... }: 

# ===============================================
# Installed Programming Languages
# 
# Search: https://search.nixos.org for more pkgs 
# ===============================================

{
  environment.systemPackages = with pkgs; [ 
    ghc
    python39
    gcc
  ];
}
