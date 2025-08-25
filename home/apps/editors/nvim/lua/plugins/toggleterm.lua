vim.pack.add({ "https://github.com/akinsho/toggleterm.nvim" })
require('toggleterm').setup {
    open_mapping = [[<c-\>]],
    shell = vim.o.shell,
    direction = 'float',
    shade_terminals = true,
    float_opts = {
        border = 'single',
        title_pos = 'center',
    },
}

vim.api.nvim_create_autocmd("BufEnter", {
    callback = function()
        local dir = vim.api.nvim_buf_get_name(0):match("(.*[/\\])")
        vim.keymap.set("n", '<c-t>', string.format(":TermExec cmd=\"cd %s; clear\"<CR>", dir))
    end,
})
