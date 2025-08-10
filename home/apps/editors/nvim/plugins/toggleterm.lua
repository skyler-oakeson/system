require('toggleterm').setup {
    open_mapping = [[<c-\>]],
    shell = vim.o.shell,
    direction = 'horizontal',
    shade_terminals = true,
    float_opts = {
        border = 'single',
        title_pos = 'center',
    },
}
