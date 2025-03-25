require('toggleterm').setup {
  open_mapping = [[<c-\>]],
  shade_terminals = false,
  shell = vim.o.shell,
  direction = 'float',
  float_opts = {
    border = 'single',
    title_pos = 'center',
  },
}
