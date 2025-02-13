{pkgs, ...}: 

{
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
      csharp-ls
      clang-tools
      marksman
      rust-analyzer
      jdt-language-server
      typescript-language-server
      lua-language-server
      (pkgs.python311.withPackages (ppkgs: [
        ppkgs.python-lsp-server
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
        p.tree-sitter-cpp
        p.tree-sitter-markdown
        p.tree-sitter-java
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

    ];

    extraLuaConfig = ''
      ${builtins.readFile ./config/opt.lua}
      ${builtins.readFile ./config/keymaps.lua}
    '';
  };
  
}
