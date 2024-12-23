{ pkgs, ... }: 

# ===============================================
# Installed Compilers, LSP's, and Formatters
# 
# Search: https://search.nixos.org for more pkgs 
# ===============================================

{
  home.packages = with pkgs; [ 
    # Compilers 
    ghc
    python39
    gcc

    # LSPs
    nil

    # Formatters
    alejandra
  ];
}
