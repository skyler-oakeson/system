vim.lsp.enable("clangd")
vim.lsp.enable("ts_ls")
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

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end
    if client.supports_method('textDocument/formatting', args.buf) then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
        end
      })
    end
  end,
})
