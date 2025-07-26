{ inputs }:
self: super:
let
  nvim-neopywal = super.vimUtils.buildVimPlugin {
    name = "nvim-neopywal";
    src = inputs.nvim-neopywal;
    doCheck = false;
  };
in
{
  vimPlugins = super.vimPlugins // {
    inherit nvim-neopywal;
  };
}
