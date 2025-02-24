local lspconfig = require("lspconfig")
lspconfig.clangd.setup {}
lspconfig.ts_ls.setup {}
lspconfig.nil_ls.setup {}
lspconfig.jdtls.setup {}
lspconfig.rust_analyzer.setup {
  settings = {
    ['rust-analyzer'] = {
      diagnostics = {
        enable = true,
      }
    }
  }
}
lspconfig.lua_ls.setup {}
lspconfig.pylsp.setup {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          enabled = false
        }
      }
    }
  }
}

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then return end
    if client.supports_method('textDocument/formatting') then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = args.buf,
        callback = function()
          vim.lsp.buf.format({ bufnr = args.buf, id = client.id })
        end
      })
    end
  end,
})
