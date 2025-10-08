vim.pack.add({ "https://github.com/Saghen/blink.cmp" })
vim.pack.add({ "https://github.com/mikavilpas/blink-ripgrep.nvim" })
require('blink.cmp').setup({
  -- 'default' (recommended) for mappings similar to built-in completions (C-y to accept)
  -- 'super-tab' for mappings similar to vscode (tab to accept)
  -- 'enter' for enter to accept
  -- 'none' for no mappings
  --
  -- All presets have the following mappings:
  -- C-space: Open menu or open docs if already open
  -- C-n/C-p or Up/Down: Select next/previous item
  -- C-e: Hide menu
  -- C-k: Toggle signature help (if signature.enabled = true)
  -- See :h blink-cmp-config-keymap for defining your own keymap
  keymap = {
    ['<C-k>'] = { 'select_prev', 'fallback' },
    ['<C-j>'] = { 'select_next', 'fallback' }
  },

  cmdline = {
    keymap = {
      ['<C-k>'] = { 'select_prev', 'fallback' },
      ['<C-j>'] = { 'select_next', 'fallback' }
    },
    completion = {
      menu = {
        auto_show = true
      },
      list = {
        selection = {
          preselect = false, auto_insert = true
        }
      }
    },
  },

  appearance = {
    nerd_font_variant = 'mono'
  },

  completion = {
    menu = {
      enabled = true,
      min_width = 15,
      max_height = 10,
      border = nil,
      winblend = 0,
      winhighlight = "",
      -- Keep the cursor X lines away from the top/bottom of the window
      scrolloff = 2,
      -- Note that the gutter will be disabled when border ~= 'none'
      scrollbar = true,
      -- Which directions to show the window,
      -- falling back to the next direction when there's not enough space
      direction_priority = { 's', 'n' },
      auto_show = true,

      -- Screen coordinates of the command line
      cmdline_position = function()
        if vim.g.ui_cmdline_pos ~= nil then
          local pos = vim.g.ui_cmdline_pos -- (1, 0)-indexed
          return { pos[1] - 1, pos[2] }
        end
        local height = (vim.o.cmdheight == 0) and 1 or vim.o.cmdheight
        return { vim.o.lines - height, 0 }
      end,
    },

    documentation = { auto_show = true },

    list = {
      selection = {
        preselect = false, auto_insert = true
      }
    }
  },

  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer', 'cmdline' },

    -- providers = {
    --   ripgrep = {
    --     module = "blink-ripgrep",
    --     name = "Ripgrep",
    --     opts = {},
    --   },
    -- }
  },

  fuzzy = { implementation = "lua" }
})
