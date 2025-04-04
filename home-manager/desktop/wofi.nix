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
      }

      #entry {
        padding: 5px;
        border-radius: 0px;
        outline: none;
      }

      #entry:innerbox {
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
