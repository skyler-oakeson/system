require('nvim-treesitter.configs').setup({
  auto_install = false,

  highlight = {
    enable = true
  },

  incremental_selection = {
    enable = false,
    keymaps = {
      node_incremental = "v",
      node_decremental = "V",
    }
  }
})
