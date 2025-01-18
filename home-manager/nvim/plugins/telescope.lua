require('telescope').setup({
    defaults = {
        borderchars = {
            "─", "│", "─", "│", "┌", "┐", "┘", "└"
        }
    }
})
require('telescope').load_extension('fzf')
