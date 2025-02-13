{ pkgs, ... }:
{
  home.pointerCursor = {
    x11.enable = true;
    gtk.enable = true;
    name = "Vanilla-DMZ";
    package = pkgs.vanilla-dmz;
  };
}
