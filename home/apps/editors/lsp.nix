{ pkgs, ... }:
{
  home.packages = with pkgs; [
    # nil
    nixd
    nixfmt-rfc-style
    csharp-ls
    clang-tools
    marksman
    rustup
    jdt-language-server
    typescript-language-server
    lua-language-server
    texlab
    csharp-ls
    basedpyright
    vscode-langservers-extracted
    # (pkgs.python3.withPackages (p: [
    #   p.python-lsp-server
    #   p.python-lsp-ruff
    # ]))
  ];
}
