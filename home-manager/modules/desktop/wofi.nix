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
    # style = ''
    #   #window {
    #     font-family: "JetBrainsMono Nerd Font";
    #     font-size: 16px;
    #     background: #${config.colorScheme.palette.base00};
    #     color: #${config.colorScheme.palette.base05};
    #     font-style: oblique;
    #     border-bottom: none;
    #     outline: none;
    #   }
    #
    #   #input {
    #     border-radius: 0px;
    #     outline: none;
    #     padding: 5;
    #     border: 0px;
    #     background: #${config.colorScheme.palette.base00};
    #     color: #${config.colorScheme.palette.base05};
    #   }
    #
    #   #input:focus {
    #     outline: none;
    #   }
    #
    #   #entry {
    #     padding: 5px;
    #     border-radius: 0px;
    #     outline: none;
    #   }
    #
    #   #entry:innerbox {
    #   }
    #
    #   #entry:selected {
    #     background: #${config.colorScheme.palette.base02};
    #     foreground: #${config.colorScheme.palette.base07};
    #   }
    #
    #   #text:selected {
    #     foreground: #${config.colorScheme.palette.base00};
    #   }
    #
    #   #scroll {
    #     outline: none;
    #     border: none;
    #     margin: -2px 0px;
    #   }
    # '';
  };
}
