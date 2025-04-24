{pkgs, ...}: {
  fonts = {
    packages = with pkgs; [
      monocraft
      noto-fonts
      noto-fonts-cjk-sans
      noto-fonts-emoji
      nerd-fonts.jetbrains-mono
      cm_unicode
      lato
    ];
    fontconfig = {
      defaultFonts = {
        serif = ["Computer Modern"];
        sansSerif = ["Lato"];
        monospace = ["JetBrainsMono Nerd Font"];
      };
    };
  };
}
