{
  pkgs,
  inputs,
  config,
  lib,
  ...
}:
let
  cfg = config.apps.neovim;
in
{
  options = {
    apps = {
      neovim = with lib; {
        enable = mkEnableOption {
          description = "Install Neovim.";
          default = false;
        };
      };
    };
  };

  config = lib.mkIf (cfg.enable) {

    # overlay any flake inputs that are nvim plugins here
    nixpkgs = {
      overlays = [
        (
          self: super:
          let
            nvim-improvedft = super.vimUtils.buildVimPlugin {
              name = "nvim-improvedft";
              src = inputs.nvim-improvedft;
            };
          in
          {
            vimPlugins = super.vimPlugins // {
              inherit nvim-improvedft;
            };
          }
        )
      ];
    };

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
        extraPackages = with pkgs; [
          nil
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
            plugin = nvim-improvedft;
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
            plugin = mini-base16;
            config =
              with config.walnix.colors.hex;
              toLua ''
                require('mini.base16').setup({
                  palette = {
                     base00 = '${background}',  base01 = '${color1}',      base02 = '${color2}',  base03 = '${color3}',
                     base04 = '${color4}',      base05 = '${color5}',      base06 = '${color6}',  base07 = '${color7}',
                     base08 = '${color8}',      base09 = '${color9}',      base0A = '${color10}', base0B = '${color11}',
                     base0C = '${color12}',     base0D = '${color13}',     base0E = '${color14}', base0F = '${color15}'
                  }
                })

                vim.cmd [[
                  hi NonText ctermbg=none guibg=NONE
                  hi Normal guibg=NONE ctermbg=NONE
                  hi NormalNC guibg=NONE ctermbg=NONE
                  hi SignColumn ctermbg=NONE ctermfg=NONE guibg=NONE
                  hi LineNr guibg=NONE
                  hi LineNrBelow guibg=NONE
                  hi LineNrAbove guibg=NONE
                  hi CursorLineNr guibg=NONE
                  hi GitSignsAdd guibg=NONE
                  hi GitSignsChange guibg=NONE
                  hi GitSignsDelete guibg=NONE
                  hi CursorLineSign guibg=NONE
                  hi DiagnosticSignError guibg=NONE
                  hi DiagnosticSignWarn guibg=NONE
                  hi DiagnosticSignInfo guibg=NONE
                  hi DiagnosticSignHint guibg=NONE
                  hi DiagnosticSignOk guibg=NONE
                  hi Pmenu ctermbg=NONE ctermfg=NONE guibg=NONE
                  hi FloatBorder ctermbg=NONE ctermfg=NONE guibg=NONE
                  hi NormalFloat ctermbg=NONE ctermfg=NONE guibg=NONE
                  hi TabLine ctermbg=None ctermfg=None guibg=None
                ]]
              '';
          }

          {
            plugin = wal-vim;
          }
        ];

        extraLuaConfig = ''
          ${builtins.readFile ./config/opt.lua}
          ${builtins.readFile ./config/keymaps.lua}
        '';
      };
  };
}
