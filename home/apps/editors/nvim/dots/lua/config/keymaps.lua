vim.g.mapleader = ' '

-- vim.keymap.set('n', 'gn', vim.lsp.buf.rename)
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
vim.keymap.set('n', '<leader>x', '"_x')

-- toggle relative number --
vim.keymap.set('n', '<leader>r', '<cmd>set relativenumber!<cr>')

-- gitsigns commands --
vim.keymap.set('n', ']c', '<cmd>Gitsigns next_hunk<cr>')
vim.keymap.set('n', '[c', '<cmd>Gitsigns prev_hunk<cr>')
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

-- Stay in visual mode after indenting visual selection
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Keep cursor inplace while joining lines
vim.keymap.set('n', 'J', 'mzJ`z', { noremap = true })
vim.keymap.set("n", "<leader>`", ":so ~/.config/nvim/init.lua<CR>")

-- set lsp keymaps here --
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
vim.keymap.set('n', ',e', "<cmd>lua vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.ERROR })<cr>")
vim.keymap.set('n', ',w', "<cmd>lua vim.diagnostic.setqflist({ severity = vim.diagnostic.severity.WARN })<cr>")

-- terminal keybinds --
local opts = { buffer = 0 }
vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
