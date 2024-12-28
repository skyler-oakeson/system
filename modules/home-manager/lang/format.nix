{ pkgs, ... }: 

# ===============================================
# Installed Formatters
# 
# Search: https://search.nixos.org for more pkgs 
# ===============================================

{
  home.packages = with pkgs; [ 
    alejandra
  ];
}
