{ pkgs, ... }: 

# ===============================================
# Installed LSP's
# 
# Search: https://search.nixos.org for more pkgs 
# ===============================================

{
  home.packages = with pkgs; [ 
    nil
    csharp-ls
    marksman
    typescript-language-server
    (pkgs.python311.withPackages (ppkgs: [
      ppkgs.python-lsp-server
    ]))
  ];
}
