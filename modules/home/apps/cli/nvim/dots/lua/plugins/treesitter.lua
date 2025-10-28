vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })
require('nvim-treesitter.configs').setup({
  auto_install = false,
  ensure_installed = {
    "nix",
    "vim",
    "bash",
    "lua",
    "python",
    "rust",
    "json",
    "c",
    "cpp",
    "markdown",
    "java",
    "html",
    "haskell"
  },

  highlight = {
    enable = true
  },

  incremental_selection = {
    enable = true,
    keymaps = {
      node_incremental = "v",
      node_decremental = "V",
    }
  }
})
