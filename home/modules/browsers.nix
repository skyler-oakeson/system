# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
# Browsers
#
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  config,
  lib,
  pkgs,
  options,
  username,
  ...
}:
let
  cfg = config.browsers;
in
{
  options = with lib; {
    browsers = {
      default = mkOption {
        type = types.enum [
          "firefox"
          "chromium"
          "qutebrowser"
        ];
        default = "firefox";
      };

    };
  };

  config = {
    programs.firefox = {
      policies = {
        BlockAboutConfig = true;
        # DefaultDownloadDirectory = "${home}/dwn";
      };
    };

    programs.qutebrowser = {
      keyBindings = {
        normal = {
          "pt" = "open -t -- {primary}";
          "pT" = "open -t -- {clipboard}";
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
        "tabs.show" = "switching";
        "tabs.show_switching_delay" = 10000;
        "completion.height" = "25%";
        "tabs.last_close" = "close";
      };
    };
  };
}
