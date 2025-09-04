{ pkgs, ... }:
{
  fonts = {
    packages = with pkgs; [
      noto-fonts-emoji
      nerd-fonts.jetbrains-mono
      nerd-fonts.bigblue-terminal
      nerd-fonts._3270
      lato
      spleen
      orbitron
    ];

    fontconfig = {
      defaultFonts = {
        # FIGURE OUT HOW TO PUT CITY LIGHTS HERE
        serif = [ "Computer Modern" ];
        sansSerif = [ "Lato" ];
        monospace = [ "JetBrainsMono NF SemiBold" ];
        # monospace = [ "Spleen 32x64" ];
      };
    };
  };
}
