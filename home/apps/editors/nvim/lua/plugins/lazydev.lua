vim.pack.add({ "https://github.com/folke/lazydev.nvim" })
-- load only on lua files
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
    pattern = { "*.lua" },
    callback = function()
        if not package.loaded['lazydev'] then
            require('lazydev').setup({
                enabled = true,
            })
        end
    end
})
