require('telescope').setup({
  defaults = require('telescope.themes').get_dropdown({
    borderchars = {
      prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
      preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    },
  }),
  pickers = {
    find_files = {
      push_tagstack_on_edit = true,
    },
  }
})
require('telescope').load_extension('fzf')

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fa',
  "<cmd>lua require'telescope.builtin'.find_files({ find_command = { 'rg', '--files', '--hidden', '-g', '!.git' }})<cr>",
  {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>fr', builtin.registers, {})
vim.keymap.set('n', '<leader>fz', builtin.current_buffer_fuzzy_find, {})
vim.keymap.set('n', '<leader>fm', builtin.marks, {})
vim.keymap.set('n', '<leader>fs', '<cmd>Telescope git_status<cr>')
vim.keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>')
vim.keymap.set('n', 'gd', '<cmd>Telescope lsp_definitions<cr>')
