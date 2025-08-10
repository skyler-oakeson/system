vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.wo.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.cursorlineopt = 'number'
vim.opt.cursorline = true
vim.opt.mouse = "n"
vim.opt.spellsuggest = { "best", 10 }
vim.opt.scrolloff = 3
vim.opt.undofile = true;
vim.opt.iskeyword:append("-")
vim.opt.path:append("**")
vim.o.winborder = 'single'
vim.cmd(":hi statusline guibg=NONE")

local augroup = vim.api.nvim_create_augroup("UserConfig", {})

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight text on yank.",
    group = augroup,
    callback = function()
        vim.highlight.on_yank()
    end
})

vim.api.nvim_create_autocmd("BufReadPost", {
    group = augroup,
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end
})

vim.api.nvim_create_autocmd("VimResized", {
    group = augroup,
    callback = function()
        vim.cmd("tabdo wincmd =")
    end
})
