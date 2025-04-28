# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

# Wofi
#
# Search: https://search.nixos.org for more pkgs
# ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
{
  pkgs,
  config,
  lib,
  ...
}: 
  let cfg = config.apps.wofi;
  in
{
  options = {
    apps = {
      wofi = with lib; {
        enable = mkEnableOption { 
          description = "Install wofi."; 
          default = false;
        };
      };
    };
  };

  config = lib.mkIf (cfg.enable) {
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
          color: #${color11};
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
          color: #${color11};
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
          background: #${color11};
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
  };
}
