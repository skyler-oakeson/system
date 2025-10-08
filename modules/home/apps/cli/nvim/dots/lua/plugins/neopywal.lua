vim.pack.add({ "https://github.com/RedsXDD/neopywal.nvim" })
require("neopywal").setup({
  -- Uses a template file `~/.cache/wallust/colors_neopywal.vim` instead of the
  -- regular pywal template at `~/.cache/wal/colors-wal.vim`.
  use_palette = "wallust",

  -- This option allows to specify where Neopywal should look for a ".vim" template file
  -- (e.g.: os.getenv("HOME") .. "/.cache/wal/custom_neopywal_template.vim").
  -- colorscheme_file = "",

  -- This option allows to use a custom built-in theme palettes like "catppuccin-mocha" or "tokyonight".
  -- To get the list of available themes take a look at `https://github.com/RedsXDD/neopywal.nvim#Alternative-Palettes`.
  -- Take note that this option takes precedence over `use_wallust` and `colorscheme_file`.
  -- use_palette = "catppuccin-mocha",

  -- Sets the background color of certain highlight groups to be transparent.
  -- Use this when your terminal opacity is < 1.
  transparent_background = true,

  -- With this option you can overwrite all the base colors the colorscheme uses.
  -- For more information take a look at `https://github.com/RedsXDD/neopywal.nvim#Customizing-Colors`
  custom_colors = {},

  -- With this option you can overwrite any highlight groups set by the colorscheme.
  -- For more information take a look at `https://github.com/RedsXDD/neopywal.nvim#Customizing-Highlights`
  custom_highlights = function(C)
    return {
      Comment = { fg = C.color3 },
      TabLineSel = { bg = C.color5 },
      FloatBorder = { bg = C.color1 },
      Pmenu = { bg = C.color6 },
    }
  end,

  -- Dims the background when another window is focused.
  dim_inactive = true,

  -- Apply colorscheme for Neovim's terminal (e.g. `g:terminal_color_0`).
  terminal_colors = true,

  -- Shows the '~' characters after the end of buffers.
  show_end_of_buffer = true,

  -- Shows the '|' split separator characters.
  -- It's worth noting that this options works better in conjunction with `dim_inactive`.
  show_split_lines = true,

  no_italic = false,        -- Force no italic.
  no_bold = false,          -- Force no bold.
  no_underline = false,     -- Force no underline.
  no_undercurl = false,     -- Force no undercurl.
  no_strikethrough = false, -- Force no strikethrough.

  -- Handles the styling of certain highlight groups (see `:h highlight-args`).
  styles = {
    comments = { "italic" },
    conditionals = { "italic" },
    loops = {},
    functions = {},
    keywords = {},
    includes = { "italic" },
    strings = {},
    variables = { "italic" },
    numbers = {},
    booleans = {},
    types = { "italic" },
    operators = {},
  },

  -- Setting this to false disables all default file format highlights.
  -- Useful if you want to enable specific file format options.
  -- Defaults to false when treesitter is enabled,
  -- unless manually enabled inside the `setup()` function.
  default_fileformats = true,

  -- Setting this to false disables all default plugin highlights.
  -- Useful if you want to enable specific plugin options.
  default_plugins = true,

  -- For more fileformats options please scroll down (https://github.com/RedsXDD/neopywal.nvim#Fileformats)
  -- fileformats = {
  --   c_cpp = true,
  --   c_sharp = true,
  -- },

  -- For more plugin options please scroll down (https://github.com/RedsXDD/neopywal.nvim#Plugins)
  -- plugins = {
  --   alpha = true,
  --   coc = false,
  --   mini = {
  --     cursorword = true,
  --     files = true,
  --   },
  -- },
})

vim.cmd([[colorscheme neopywal]])
