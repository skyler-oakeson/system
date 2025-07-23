{
  pkgs,
  inputs,
  config,
  username,
  lib,
  builtins,
  ...
}:
{
  config = {
    programs.helix = {
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
