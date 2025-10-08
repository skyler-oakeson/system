{
  config,
  lib,
  user,
  ...
}:
{
  programs.wofi = lib.mkIf (config.launchers.wofi.enable) {
    enable = true;
    settings = {
      hide_scroll = true;
      normal_window = true;
      no_actions = true;
      allow_markup = true;
      key_up = "Ctrl-k";
      key_down = "Ctrl-j";
      show_all = false;
    };
    style = ''
      @import "${user.locations.theme}/colors_waybar.css";

      #window {
        font-family: "monospace";
        background: @background;
        color: @foreground;
        font-style: oblique;
        border-bottom: none;
        outline: none;
      }

      #input {
        border-radius: ${toString user.preferences.ui.radius}px;
        outline: 2px;
        padding: 5;
        font-size: 20px;
        border: 0px;
        background: @background;
        color: @foreground;
      }

      #input:focus {
        outline: none;
        box-shadow: none;
      }

      #entry {
        padding: 5px;
        margin: 0px 10px;
        font-size: 20px;
        border-radius: ${toString user.preferences.ui.radius}px;
        outline: none;
        color: @foreground;
      }

      #entry:innerbox {
        margin: 0px 5px;
      }

      #entry:selected {
        background: @color0;
        foreground: @foreground;
      }

      #text:selected {
        foreground: @color13;
      }

      #scroll {
        outline: none;
        border: none;
        margin: -2px 0px;
      }
    '';
  };
}
