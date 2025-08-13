{
  config,
  lib,
  user,
  ...
}:
{
  config = lib.mkIf (config.browsers.qutebrowser.enable) {
    programs.qutebrowser = {
      enable = true;
      keyBindings = {
        normal = {
          "<Ctrl-1>" = "tab-focus 1";
          "<Ctrl-2>" = "tab-focus 2";
          "<Ctrl-3>" = "tab-focus 3";
          "<Ctrl-4>" = "tab-focus 4";
          "<Ctrl-5>" = "tab-focus 5";
          "<Ctrl-6>" = "tab-focus 6";
          "<Ctrl-7>" = "tab-focus 7";
          "<Ctrl-8>" = "tab-focus 8";
          "<Ctrl-9>" = "tab-focus 9";
        };
      };

      settings = {
        "colors.webpage.darkmode.enabled" = true;
        "confirm_quit" = [ "always" ];
        "input.insert_mode.auto_enter" = true;
        "search.incremental" = true;
        "tabs.position" = "bottom";
        "tabs.show" = "always";
        "tabs.show_switching_delay" = 10000;
        "completion.height" = "25%";
        "tabs.last_close" = "close";
        "keyhint.delay" = 0;
        "prompt.radius" = user.preferences.ui.radius or 8;
        "keyhint.radius" = user.preferences.ui.radius or 8;
        "downloads.location.directory" = user.locations.downloads or "$HOME/downloads";
      };
    };
  };
}
