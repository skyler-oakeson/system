{
  pkgs,
  ...
}:
{
  config = {
    programs.neovim =
      let
        toLua = str: "lua << EOF\n${str}\nEOF\n";
        toLuaFile = file: "lua << EOF\n${builtins.readFile file}\nEOF\n";
      in
      {
        enable = true;
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
        withPython3 = true;
        withNodeJs = true;
        plugins = with pkgs.vimPlugins; [
          (nvim-treesitter.withPlugins (p: [
            p.tree-sitter-nix
            p.tree-sitter-vim
            p.tree-sitter-bash
            p.tree-sitter-lua
            p.tree-sitter-python
            p.tree-sitter-rust
            p.tree-sitter-json
            p.tree-sitter-c
            p.tree-sitter-c-sharp
            p.tree-sitter-cpp
            p.tree-sitter-markdown
            p.tree-sitter-java
            p.tree-sitter-html
            p.tree-sitter-latex
            p.tree-sitter-bibtex
          ]))

          {
            plugin = nvim-lspconfig;
            config = toLuaFile ./plugins/nvim-lspconfig.lua;
          }

          {
            plugin = nvim-surround;
            config = toLuaFile ./plugins/surround.lua;
          }

          {
            plugin = nvim-autopairs;
            config = toLuaFile ./plugins/autopairs.lua;
          }

          {
            plugin = nvim-treesitter-context;
            config = toLuaFile ./plugins/treesitter-context.lua;
          }

          blink-ripgrep-nvim
          {
            plugin = nvim-blink;
            config = toLuaFile ./plugins/blink.lua;
          }

          {
            plugin = mini-pick;
            config = toLuaFile ./plugins/mini-pick.lua;
          }

          {
            plugin = oil-nvim;
            config = toLuaFile ./plugins/oil.lua;
          }

          {
            plugin = gitsigns-nvim;
            config = toLuaFile ./plugins/gitsigns.lua;
          }

          {
            plugin = toggleterm-nvim;
            config = toLuaFile ./plugins/toggleterm.lua;
          }

          {
            plugin = lazydev-nvim;
            config = toLuaFile ./plugins/lazydev.lua;
          }

          {
            plugin = nvim-neopywal;
            config = toLuaFile ./plugins/neopywal.lua;
          }
        ];

        extraLuaConfig = ''
          ${builtins.readFile ./config/opt.lua}
          ${builtins.readFile ./config/keymaps.lua}
          ${builtins.readFile ./plugins/treesitter.lua}
        '';
      };
  };
}
