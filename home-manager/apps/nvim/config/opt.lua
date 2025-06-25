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

local _border = "single"
vim.lsp.handlers["textDocument/hover"] = vim.lsp.buf.hover({ border = _border })
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.buf.signature_help({ border = _border })

vim.diagnostic.config {
  float = { border = _border }
}

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight text on yank.",
  group = vim.api.nvim_create_augroup("HighlightYank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end
})
