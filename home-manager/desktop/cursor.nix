{ pkgs, ... }:
{
  home.pointerCursor = {
    x11.enable = true;
    gtk.enable = true;
    name = "Vanilla-DMZ";
    size = 32;
    package = pkgs.vanilla-dmz;
  };
}
