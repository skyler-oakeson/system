require("oil").setup({
  default_file_explorer = true,
  git = {
    add = function(path)
      return false
    end,
    mv = function(src_path, dest_path)
      return false
    end,
    rm = function(path)
      return false
    end,
  },

  float = {
    -- Padding around the floating window
    padding = 2,
    -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
    max_width = .5,
    max_height = .5,
    border = "single",
    win_options = {
      winblend = 0,
    },
    -- optionally override the oil buffers window title with custom function: fun(winid: integer): string
    get_win_title = nil,
    -- preview_split: Split direction: "auto", "left", "right", "above", "below".
    preview_split = "auto",
    -- This is the config that will be passed to nvim_open_win.
    -- Change values here to customize the layout
    override = function(conf)
      return conf
    end,
  },

  confirmation = {
    border = "single"
  },

  progress = {
    border = "single"
  },

  ssh = {
    border = "single"
  },

  keymaps_help = {
    border = "single"
  }
})


vim.keymap.set("n", "ge", ":Oil<cr>")
