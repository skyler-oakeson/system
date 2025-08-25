vim.pack.add({ "https://github.com/stevearc/oil.nvim" })
require('oil').setup({
    default_file_explorer = true,

    columns = {
        "icon",
    },

    float = {
        border = "single"
    },

    keymaps_help = {
        border = "single"
    },

    ssh = {
        border = "single"
    },

    progress = {
        border = "single"
    },

    confirmation = {
        border = "single"
    },

    watch_for_changes = true,

    buf_options = {
        buflisted = false,
        bufhidden = "hide",
    },

    win_options = {
        wrap = false,
        signcolumn = "yes",
        cursorcolumn = false,
        foldcolumn = "0",
        spell = false,
        list = false,
        conceallevel = 3,
        concealcursor = "nvic",
    },

    keymaps = {
        ["g?"] = { "actions.show_help", mode = "n" },
        ["<CR>"] = "actions.select",
        ["<C-s>"] = { "actions.select", opts = { vertical = true } },
        ["<C-h>"] = { "actions.select", opts = { horizontal = true } },
        ["<C-t>"] = { "actions.select", opts = { tab = true } },
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = { "actions.close", mode = "n" },
        ["<C-l>"] = "actions.refresh",
        ["-"] = { "actions.parent", mode = "n" },
        ["_"] = { "actions.open_cwd", mode = "n" },
        ["`"] = { "actions.cd", mode = "n" },
        ["~"] = { "actions.cd", opts = { scope = "tab" }, mode = "n" },
        ["gs"] = { "actions.change_sort", mode = "n" },
        ["gx"] = "actions.open_external",
        ["g."] = { "actions.toggle_hidden", mode = "n" },
        ["g\\"] = { "actions.toggle_trash", mode = "n" },
    },


})
vim.keymap.set('n', 'ge', '<cmd>Oil<cr>')
