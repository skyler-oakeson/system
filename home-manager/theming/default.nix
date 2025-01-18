{
  pkgs,
  builtins,
  lib,
  ...
}: let
  wallpaper = ./wallpapers/bay.jpg;
  scheme = import ./generate.nix { inherit pkgs; } wallpaper;
in {

  home.packages = with pkgs; [
    wallust
  ];

  stylix = {
    enable = true;
    image = wallpaper;
    polarity = "dark";
    base16Scheme = "${pkgs.base16-schemes}/share/themes/rose-pine.yaml";
    targets = {
      waybar = {
        enable = false;
      };
      neovim = {
        transparentBackground = {
          main = true;
          signColumn = true;
        };
      };
    };

    fonts = {
      serif = {
        package = pkgs.cm_unicode;
        name = "Computer Modern";
      };
      
      sansSerif = {
        package = pkgs.lato;
        name = "Lato";
      };

      monospace = {
        package = pkgs.nerd-fonts.jetbrains-mono;
        name = "JetBrainsMono";
      };

      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };
  };

  gtk.enable = true;
}
