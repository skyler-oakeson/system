{
  pkgs,
  config,
  lib,
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
        defaultEditor = true;
        viAlias = true;
        vimAlias = true;
        vimdiffAlias = true;
        withPython3 = true;
        withNodeJs = true;
        extraPackages = with pkgs; [
          # nil
          nixd
          nixfmt-rfc-style
          csharp-ls
          clang-tools
          marksman
          rust-analyzer
          jdt-language-server
          typescript-language-server
          lua-language-server
          texlab
          csharp-ls
          basedpyright
          vscode-langservers-extracted
          (pkgs.python3.withPackages (p: [
            p.python-lsp-server
            p.python-lsp-ruff
          ]))
        ];
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

          # {
          #   plugin = lualine-nvim;
          #   config = toLuaFile ./plugins/lualine.lua;
          # }

          {
            plugin = telescope-nvim;
            config = toLuaFile ./plugins/telescope.lua;
          }

          {
            plugin = nvim-autopairs;
            config = toLuaFile ./plugins/autopairs.lua;
          }

          {
            plugin = nvim-treesitter-context;
          }

          # cmp dependecies
          cmp-nvim-lsp
          cmp-buffer
          cmp-path
          cmp-cmdline
          cmp-fuzzy-buffer
          cmp-fuzzy-path
          cmp-nvim-lsp-signature-help
          nvim-cmp
          lspkind-nvim
          {
            plugin = nvim-cmp;
            config = toLuaFile ./plugins/cmp.lua;
          }

          # telescope dependecies
          plenary-nvim
          nvim-web-devicons
          telescope-fzf-native-nvim
          {
            plugin = telescope-nvim;
            config = toLuaFile ./plugins/telescope.lua;
          }

          {
            plugin = gitsigns-nvim;
            config = toLuaFile ./plugins/gitsigns.lua;
          }

          {
            plugin = telescope-nvim;
            config = toLuaFile ./plugins/telescope.lua;
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
        '';
      };
  };
}
