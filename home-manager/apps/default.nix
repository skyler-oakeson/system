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
  ];

}
