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

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight text on yank.",
  group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end
})
