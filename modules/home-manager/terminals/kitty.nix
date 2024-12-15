{ config, lib, pkgs, ... }:

{
  programs.kitty = {
    enable = true;
    settings = {
      font_family = "JetBrainsMonoNerd Font";
      font_size = 12.0;
      window_padding_width = 10;
      bold_font = "auto";
      italic_font = "auto";
      bold_italic_font = "auto";
      remember_window_size = "yes";
      confirm_os_window_close = 0;
    };
  };
}
