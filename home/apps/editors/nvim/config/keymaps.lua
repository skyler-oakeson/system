vim.g.mapleader = ' '

-- focus windows --
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

-- clear search --
vim.keymap.set('n', ',n', vim.cmd.nohl)

-- paste clipboard --
vim.keymap.set({ 'n', 'v' }, '<leader>y', '"+y')
vim.keymap.set({ 'n', 'v' }, '<leader>Y', '"+Y')

-- paste from clipboard --
vim.keymap.set({ 'n', 'v' }, '<leader>p', '"+p')
vim.keymap.set({ 'n', 'v' }, '<leader>P', '"+P')

-- delete to empty register --
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('n', '<leader>x', '"_x')

-- toggle relative number --
vim.keymap.set('n', '<leader>r', '<cmd>set relativenumber!<cr>')

-- gitsigns commands --
vim.keymap.set('n', ']h', '<cmd>Gitsigns next_hunk<cr>')
vim.keymap.set('n', '[h', '<cmd>Gitsigns prev_hunk<cr>')

vim.keymap.set('n', '<leader>hr', '<cmd>Gitsigns reset_hunk<cr>')
vim.keymap.set('n', '<leader>hR', '<cmd>Gitsigns reset_buffer<cr>')
vim.keymap.set('n', '<leader>tb', '<cmd>Gitsigns toggle_current_line_blame<cr>')

-- keep screen centered when jumping --
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Prev search result (centered)" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Half page down (centered)" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Half page up (centered)" })
vim.keymap.set("n", "<C-o>", "<C-o>zz", { desc = "Prev jump (centered)" })
vim.keymap.set("n", "<C-i>", "<C-i>zz", { desc = "Next Jump (centered)" })

-- move through buffers --
vim.keymap.set("n", "[b", ":bnext<CR>")
vim.keymap.set("n", "]b", ":bprevious<CR>")

vim.keymap.set("n", "<leader>`", ":so ~/.config/nvim/init.lua<CR>")

vim.keymap.set('n', 'gr', vim.lsp.buf.references, { remap = true })
vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
