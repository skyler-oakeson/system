vim.pack.add({ "https://github.com/akinsho/toggleterm.nvim" })
require('toggleterm').setup {
  open_mapping = [[<c-\>]],
  shell = vim.o.shell,
  direction = 'horizontal',
  shade_terminals = true,
  height = math.floor(0.33 * vim.o.lines),
  float_opts = {
    border = 'single',
    title_pos = 'center',
  },
}

vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    local dir = vim.api.nvim_buf_get_name(0):match("(.*[/\\])")
    vim.keymap.set("n", '<c-t>', string.format(":TermExec cmd=\"cd %s; clear\"<CR>", dir))
  end,
})
