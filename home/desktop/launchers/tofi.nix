{ config, user, ... }:
{
  programs.tofi = {
    enable = true;
    settings = {
      include = "${user.locations.theme}/colors_tofi";
      font = "monospace";
      text-cursor-style = "block";
      drun-launch = true;
      terminal = "${config.terminals.default}";
      font-size = 12;
      outline-width = 0;
      border-width = 1;
      prompt-text = "> ";
      anchor = "top";
      horizontal = true;
      height = 30;
      width = "100%";
      result-spacing = 30;
      padding-top = 2;
      padding-bottom = 2;
      margin-top = 10;
      margin-right = 10;
      margin-left = 10;
    };
  };
}
