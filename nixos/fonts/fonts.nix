{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      noto-fonts-emoji
      nerd-fonts.jetbrains-mono
      nerd-fonts.bigblue-terminal
      nerd-fonts._3270
      lato
    ];

    fontconfig = {
      defaultFonts = {
        serif = [ "Computer Modern" ];
        sansSerif = [ "Lato" ];
        monospace = [ "JetBrainsMono NF SemiBold" ];
      };
    };
  };
}
