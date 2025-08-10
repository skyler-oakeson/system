local pick = require('mini.pick')

pick.setup({
  pick.setup({ source = { show = pick.default_show } }),
  mappings = {
    move_down = '<C-j>',
    move_up   = '<C-k>',
  }
})

vim.keymap.set('n', 'gs', '<cmd>Pick files<cr>', {})
vim.keymap.set('n', 'gh', '<cmd>Pick help<cr>', {})
vim.keymap.set('n', 'gl', '<cmd>Pick grep_live<cr>', {})
vim.keymap.set('n', 'gb', '<cmd>Pick buffers<cr>', {})
