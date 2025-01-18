{pkgs, ...}: {
  imports = [
    ./kitty.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    firefox
    discord
    spotify
    pwvucontrol
  ];
}
