vim.g.mapleader = ' '

-- telescope keymap --
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

vim.keymap.set('n', 'gn', vim.lsp.buf.rename)

-- focus windows --
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- clear search --
vim.keymap.set('n', '<leader>n', vim.cmd.nohl)

-- paste clipboard --
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set({ 'n', 'v' }, '<leader>Y', '"+Y')

-- paste from clipboard --
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p')
vim.keymap.set({ 'n', 'v' }, '<leader>P', '"+P')

-- delete to empty register --
vim.keymap.set('n', '<leader>d', '"_d')

-- toggle relative number --
vim.keymap.set('n', '<leader>r', '<cmd>set relativenumber!<cr>')

-- gitsigns commands --
vim.keymap.set('n', ']c', '<cmd>Gitsigns next_hunk<cr>')
vim.keymap.set('n', '[c', '<cmd>Gitsigns prev_hunk<cr>')
vim.keymap.set('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<cr>')
vim.keymap.set('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<cr>')
vim.keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<cr>')
