{
  config,
  lib,
  ...
}:
{
  config = lib.mkIf (config.editors.helix.enable) {
    programs.helix = {
      enable = true;
      settings = {
        editor.cursor-shape = {
          normal = "block";
          insert = "bar";
          select = "underline";
        };
      };
    };
  };
}
