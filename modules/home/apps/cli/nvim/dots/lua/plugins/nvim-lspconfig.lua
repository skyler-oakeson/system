vim.pack.add({ "https://github.com/neovim/nvim-lspconfig" })

vim.lsp.config('*', {
  root_markers = { '.git' }
})
vim.lsp.enable("clangd")
vim.lsp.enable("hls")
vim.lsp.config('hls', {
  filetypes = { 'haskell', 'lhaskell', 'cabal' },
})
vim.lsp.enable("ts_ls")
vim.lsp.enable("nixd")
vim.lsp.enable("nil_ls")
vim.lsp.config("nil_ls", {
  settings = {
    ['nil'] = {
      formatting = {
        command = { "nixfmt" }
      },
    }
  }
})

vim.lsp.enable("jdtls")
vim.lsp.enable("html")
vim.lsp.enable("csharp_ls")

vim.lsp.enable("rust_analyzer")
vim.lsp.config("rust_analyzer", {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true,
      }
    }
  }
})

vim.lsp.enable("lua_ls")
vim.lsp.enable("texlab")
-- vim.lsp.enable("pylsp")
-- vim.lsp.config("pylsp", {
--   settings = {
--     pylsp = {
--       plugins = {
--         pycodestyle = {
--           enabled = false
--         }
--       }
--     }
--   }
-- })

-- vim.lsp.config("ruff")

vim.lsp.enable("basedpyright")
