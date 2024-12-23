{ pkgs, ... }: 

# ===============================================
# Command Line Utilities
# 
# Search: https://search.nixos.org for more pkgs 
# ===============================================

{
  environment.systemPackages = with pkgs; [ 
    ripgrep
    fd
    fzf
    tree
    gnumake
    libgccjit
    xclip
  ];
}
