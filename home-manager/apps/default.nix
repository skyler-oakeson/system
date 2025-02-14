{pkgs, ...}: {
  imports = [
    ./kitty.nix
    ./zsh.nix
    ./firefox.nix
  ];

  home.packages = with pkgs; [
    discord
    spotify
    pwvucontrol
  ];

}
