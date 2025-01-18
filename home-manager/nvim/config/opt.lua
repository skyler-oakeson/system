vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.wo.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.cursorlineopt = 'number'
vim.opt.cursorline = true
vim.opt.mouse = ""
vim.opt.spellsuggest = { "best", 10 }
vim.opt.scrolloff = 3

vim.cmd [[
  hi NonText ctermbg=none guibg=NONE
  hi Normal guibg=NONE ctermbg=NONE
  hi NormalNC guibg=NONE ctermbg=NONE
  hi SignColumn ctermbg=NONE ctermfg=NONE guibg=NONE

  hi Pmenu ctermbg=NONE ctermfg=NONE guibg=NONE
  hi FloatBorder ctermbg=NONE ctermfg=NONE guibg=NONE
  hi NormalFloat ctermbg=NONE ctermfg=NONE guibg=NONE
  hi TabLine ctermbg=None ctermfg=None guibg=None
]]

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight text on yank.",
  group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end
})
