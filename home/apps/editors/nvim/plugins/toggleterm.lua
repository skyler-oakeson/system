require('toggleterm').setup {
  open_mapping = [[<c-\>]],
  shell = vim.o.shell,
  direction = 'float',
  shade_terminals = true,
  float_opts = {
    border = 'single',
    title_pos = 'center',
  },
}
