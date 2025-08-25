vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter-context" })
require('treesitter-context').setup({
    enable = true,
    max_lines = 3,
    line_numbers = true
})
