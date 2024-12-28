{ pkgs, ...}:

{
    gtk = {
        enable = true;
        cursorTheme = {
           package = pkgs.gnome3.defaultIconTheme;
           name = "Adwaita";
           size = 32;
       };
    };
}
