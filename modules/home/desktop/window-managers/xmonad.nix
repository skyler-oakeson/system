{ pkgs, ... }:
{
  config = {
    xsession.windowManager.xmonad = {
      enable = true;
    };
  };
}
