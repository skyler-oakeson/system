{ user, ... }:
{
  programs.btop = {
    enable = true;
    settings = {
      theme_background = false;
      vim_keys = true;
      force_tty = true;
      rounded_corners = if user.preferences.ui.radius != 0 then true else false;
    };
  };
}
