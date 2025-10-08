{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = {
    xdg.configFile."nvim/".source =
      config.lib.file.mkOutOfStoreSymlink "/home/skyler/.config/system/modules/home/apps/cli/nvim/dots/";

    home.packages = with pkgs; [
      neovim
    ];
  };
}
