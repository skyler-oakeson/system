require('telescope').setup({
  defaults = require('telescope.themes').get_dropdown({
    borderchars = {
      prompt = { "─", "│", " ", "│", "┌", "┐", "│", "│" },
      results = { "─", "│", "─", "│", "├", "┤", "┘", "└" },
      preview = { "─", "│", "─", "│", "┌", "┐", "┘", "└" },
    },
  }),
  pickers = {
    find_files = {
      push_tagstack_on_edit = true,
    },
  }
})
require('telescope').load_extension('fzf')
