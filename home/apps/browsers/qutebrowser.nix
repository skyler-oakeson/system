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
          "<Ctrl-0>" = "tab-focus 10";
        };
      };

      keyBindings = {
        ",p" = "spawn --userscript qute-pass";
      };

      settings = {
        "colors.webpage.darkmode.enabled" = true;
        "confirm_quit" = [ "always" ];
        "search.incremental" = true;
        "downloads.location.directory" = user.locations.downloads or "$HOME/downloads";
        "prompt.filebrowser" = false;
        "tabs.show" = "switching";
        "keyhint.radius" = user.preferences.ui.radius or 8;
        "keyhint.delay" = 0;
        "prompt.radius" = user.preferences.ui.radius or 8;
        "completion.height" = "30%";
        "input.insert_mode.auto_load" = true;
        "input.insert_mode.auto_leave" = true;
        "downloads.prevent_mixed_content" = true;
        "downloads.position" = "bottom";
        "window.transparent" = true;
        "completion.web_history.max_items" = 20;
        "completion.timestamp_format" = "%a, %b %d %H:%M:%S";
        "completion.scrollbar.width" = 18;
        "content.default_encoding" = "utf-8";
        "content.blocking.method" = "both";
        "content.cookies.accept" = "all";
        "content.media.video_capture" = true;
        "content.media.audio_capture" = true;
        "content.media.audio_video_capture" = true;
        "content.notifications.enabled" = true;
        "content.notifications.presenter" = "libnotify";
        "content.webgl" = true;
        "content.pdfjs" = true;
        "content.xss_auditing" = false;
        "content.local_content_can_access_remote_urls" = true;
        "content.plugins" = true;
        "content.tls.certificate_errors" = "load-insecurely";
        "content.geolocation" = false;
        "content.javascript.clipboard" = "access";
        "content.prefers_reduced_motion" = true;
        "hints.radius" = 30;
        "hints.uppercase" = true;
        "scrolling.smooth" = false;

        # This is crashing qutebrowser figure out what is crashing it
        # "qt.args" = [
        #   "enable-gpu-rasterization"
        #   "ignore-gpu-blocklist"
        #   "use-gl=egl"
        #   "enable-accelerated-video-decode"
        # ];

        "qt.chromium.experimental_web_platform_features" = "always";
        "statusbar.widgets" = [
          "keypress"
          "search_match"
          "url"
          "progress"
          "clock"
        ];
        "fonts.default_family" = "monospace";
        "fonts.default_size" = "14pt";
        "fonts.statusbar" = "14pt monospace";
        "fonts.downloads" = "14pt monospace";
        "fonts.prompts" = "14pt Victor monospace";
        "fonts.keyhint" = "14pt monospace";
        "fonts.hints" = "12pt monospace";
        "fonts.contextmenu" = "14pt monospace";
        "fonts.completion.category" = "bold 14pt monospace";
        "fonts.tooltip" = "14pt monospace";
        "fonts.completion.entry" = "14pt monospace";
        "fonts.tabs.selected" = "italic 14pt monospace";
        "fonts.tabs.unselected" = "14pt monospace";
        "fonts.messages.info" = "italic 14pt monospace";
        "fonts.messages.error" = "italic 14pt monospace";
        "fonts.messages.warning" = "italic 14pt monospace";
        "tabs.title.format" = "{audio}{current_title}";
        "tabs.title.format_pinned" = "{audio}{index}";
        "tabs.position" = "left";
        "window.title_format" = "{perc}{current_title}";
        "tabs.last_close" = "close";
        "tabs.mode_on_change" = "restore";
        "tabs.indicator.width" = 2;
        "tabs.favicons.scale" = 1;
        "tabs.show_switching_delay" = 700;
        "tabs.pinned.frozen" = false;
        "completion.shrink" = true;
        "auto_save.interval" = 20000;
      };

      # This runs the generated colors file
      extraConfig = ''
        config.source("../../.cache/wallust/colors_qutebrowser_config.py")
      '';
    };
  };
}
