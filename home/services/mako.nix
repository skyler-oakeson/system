{
  user,
  ...
}:
{
  config = {
    services.mako = {
      enable = if (user ? services.mako) then user.services.mako else true;
      settings = {
        "include" = "${user.locations.theme}/colors_mako.conf";
        default-timeout = 10000;
        anchor = "top-right";
        actions = true;
        border-size = user.preferences.ui.borderSize;
        markup = true;
        icons = true;
        margin = "10, 30, 0";
        font = "monospace 10";
      };
    };
  };
}
