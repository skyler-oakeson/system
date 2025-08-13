{
  user,
  lib,
  config,
  ...
}:
{
  config = lib.mkIf (config.terminals.ghostty.enable) {
    programs.ghostty = {
      enable = true;
      settings = {
        theme = "${user.locations.theme}/colors_ghostty";
        font-family = "monospace";
        keybind = [ ];
        font-size = 14;
        window-padding-y = 10;
        window-padding-x = 10;
        window-save-state = "always";
        clipboard-trim-trailing-spaces = true;
        confirm-close-surface = false;
        shell-integration = "zsh";
      };
    };
  };
}
