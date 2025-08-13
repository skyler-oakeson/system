{
  user,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf (config.terminals.kitty.enable) {
    programs.kitty = {
      enable = true;

      settings = {
        include = "${user.locations.theme}/colors_kitty.conf";
        font_family = "monospace";
        font_size = 14.0;
        window_padding_width = 10;
        bold_font = "auto";
        italic_font = "auto";
        bold_italic_font = "auto";
        remember_window_size = "yes";
        confirm_os_window_close = 0;
        input_delay = 0;
        repaint_delay = 2;
        wayland_enable_ime = false;
        sync_to_monitor = false;
      };

      keybindings = {
        "ctrl+c" = "copy_or_interrupt";
      };
    };
  };
}
