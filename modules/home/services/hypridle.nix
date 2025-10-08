{ user, ... }:
{
  services.hypridle = {
    enable = if (user ? services.mako) then user.services.mako else true;
  };
}
