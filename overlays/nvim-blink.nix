{ inputs }:
self: super:
let
  nvim-blink = super.vimUtils.buildVimPlugin {
    name = "nvim-blink";
    src = inputs.nvim-blink;
    doCheck = false;
  };
in
{
  vimPlugins = super.vimPlugins // {
    inherit nvim-blink;
  };
}
