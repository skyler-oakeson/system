require('telescope').setup({
  defaults = {
    borderchars = {
      "─", "│", "─", "│", "┌", "┐", "┘", "└"
    }
  },
  pickers = {
    find_files = {
      push_tagstack_on_edit = true,
    },
  }
})
require('telescope').load_extension('fzf')
