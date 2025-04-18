{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    wofi
  ];

  programs.wofi = {
    enable = true;
    settings = {
      hide_scroll = true;
      normal_window = true;
      no_actions = true;
      allow_markup = true;
      key_up = "Ctrl-k";
      key_down = "Ctrl-j";
    };
    style = with config.walnix.colors.noHash; ''
      #window {
        font-family: "JetBrainsMono Nerd Font";
        font-size: 16px;
        background: #${background};
        color: #${color5};
        font-style: oblique;
        border-bottom: none;
        outline: none;
      }

      #input {
        border-radius: 0px;
        outline: none;
        padding: 5;
        border: 0px;
        background: #${background};
        color: #${color5};
      }

      #input:focus {
        outline: none;
        box-shadow: none;
      }

      #entry {
        padding: 5px;
        margin: 0px 10px;
        border-radius: 0px;
        outline: none;
        color: #${foreground};
      }

      #entry:innerbox {
        margin: 0px 5px;
      }

      #entry:selected {
        background: #${color5};
        foreground: #${background};
      }

      #text:selected {
        foreground: #${foreground};
      }

      #scroll {
        outline: none;
        border: none;
        margin: -2px 0px;
      }
    '';
  };
}
