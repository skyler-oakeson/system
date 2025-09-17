{
  config,
  lib,
  pkgs,
  ...
}:
{
  config = lib.mkIf (config.editors.nvim.enable) {

    xdg.configFile."nvim/".source =
      config.lib.file.mkOutOfStoreSymlink "/home/skyler/.config/system/home/apps/editors/nvim/dots";

    home.packages = with pkgs; [
      neovim
    ];
  };
}
