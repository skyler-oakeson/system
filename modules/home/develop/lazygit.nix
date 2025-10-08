{ user, ... }:
{
  config = {
    programs.lazygit = {
      enable = true;
      settings = {
        gui = {
          border = if user.preferences.ui.radius != 0 then "rounded" else "single";
        };
      };
    };
  };
}
