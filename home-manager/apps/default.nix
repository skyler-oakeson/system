{pkgs, ...}: {
  imports = [
    ./kitty.nix
    ./zsh.nix
    ./firefox.nix
    ./spicetify.nix
  ];

  home.packages = with pkgs; [
    discord
    pwvucontrol
    obs-studio
    vlc
    (vscode-with-extensions.override {
        vscodeExtensions = with vscode-extensions; [
            ms-dotnettools.csdevkit
            ms-dotnettools.csharp
            ms-dotnettools.vscode-dotnet-runtime
            vscodevim.vim
        ];
    })
  ];

}
