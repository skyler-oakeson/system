vim.pack.add({ "https://github.com/echasnovski/mini.pick" })


local pickers = {
  registry = function()
    local picker = require('mini.pick')
    local selected = picker.start({
      source = { items = vim.tbl_keys(picker.registry), name = 'Registry' }
    })

    if selected == nil then return end

    return picker.registry[selected]()
  end,
  git_status = function()
    local selection = require('mini.pick').builtin.cli({
      command = {
        'git', 'status', '-s'
      }
    }, {
      source = {
        name = 'Git Status',
        preview = function(bufnr, item)
          local file = vim.trim(item):match('%s+(.+)')
          -- get diff and show
          local append_data = function(_, data)
            if data then
              vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, data)
              vim.api.nvim_buf_set_option(bufnr, 'filetype', 'diff')
            end
          end

          vim.fn.jobstart({ 'git', 'diff', 'HEAD', file }, {
            stdout_buffered = true,
            on_stdout = append_data,
            on_stderr = append_data,
            vim.api.nvim_buf_set_option(bufnr, 'modifiable', false)
          })
        end
      }
    })

    if selection then
      vim.cmd.edit(vim.trim(selection):match('%s+(.+)'))
    end
  end,
  find = function()
    local register = vim.fn.getreg('"')
    local cursor = vim.api.nvim_win_get_cursor(0)
    local view = vim.fn.winsaveview()

    vim.cmd([[normal! "xy]])

    local selection = vim.fn.getreg('"')

    vim.fn.setreg('"', register)
    vim.fn.winrestview(view)
    vim.api.nvim_win_set_cursor(0, cursor)

    require('mini.pick').builtin.grep(
      { pattern = selection },
      { source = { name = string.format('Grep "%s"', selection) } }
    )
  end,




  all_files = function()
    require('mini.pick').builtin.cli({
      command = {
        'fd',
        '--type',
        'f',
        '--no-ignore',
        '--hidden',
        '--follow',
        '--exclude',
        '.git',
        '--exclude',
        'node_modules',
        '--exclude',
        'build',
        '--exclude',
        'tmp',
      }
    }, {
      source = {
        name = 'All Files',
      }
    })
  end,
  quickfix = function()
    require('mini.pick').start({
      source = {
        items = vim.fn.getqflist(),
        name = 'Quickfix List'
      }
    })
  end,
  loclist = function()
    require('mini.pick').start({
      source = {
        items = vim.fn.getloclist(0),
        name = 'Location List'
      }
    })
  end,
  oldfiles = function()
    local items = {}
    local cwd = vim.fn.getcwd()
    -- Ensure cwd has a trailing slash
    cwd = cwd:sub(-1) == '/' and cwd or (cwd .. '/')

    for _, path in ipairs(vim.v.oldfiles) do
      local normal_path = nil
      if vim.startswith(path, cwd) then
        -- Use ./ as cwd prefix
        normal_path = '.' .. path:sub(cwd:len())
      else
        -- Use ~ as home directory prefix
        normal_path = vim.fn.fnamemodify(path, ':~')
      end

      table.insert(items, normal_path)
    end

    local selection = require('mini.pick').start({
      source = {
        items = items,
        name = 'Recent Files'
      }
    })

    if selection then
      vim.cmd.edit(vim.trim(selection):match('%s+(.+)'))
    end
  end,
}


local pick = require('mini.pick')
pickers = vim.tbl_extend('force', pickers, pick.builtin)
pick.registry = pickers

-- Bind keys enabling quick access to pickers
-- vim.keymap.set('n', '<F1>', pickers.help)
-- vim.keymap.set('n', ',o', pickers.oldfiles)
-- vim.keymap.set('n', '<leader>,', pickers.resume)
-- vim.keymap.set('n', '<leader>f', pickers.files)
-- vim.keymap.set('n', '<leader>b', pickers.buffers)
-- vim.keymap.set('n', '<leader>s', pickers.grep_live)
-- vim.keymap.set('n', '<leader>f', pickers.all_files)
-- vim.keymap.set('n', '<leader>g', pickers.git_status)
-- vim.keymap.set('n', '<leader>p', pickers.registry)
-- vim.keymap.set('n', '<leader>q', pickers.quickfix)
-- vim.keymap.set('n', '<leader>l', pickers.loclist)
vim.keymap.set('n', 'gs', '<cmd>Pick files<cr>', {})
vim.keymap.set('n', 'gh', '<cmd>Pick help<cr>', {})
vim.keymap.set('n', 'gl', '<cmd>Pick grep_live<cr>', {})
vim.keymap.set('n', 'gb', '<cmd>Pick buffers<cr>', {})


-- <C-qe> Adds to quickfix errors for buffer
-- <C-qp> Adds to quickfix errors for project

pick.setup({
  pick.setup({ source = { show = pick.default_show } }),
  mappings = {
    move_down      = '<C-j>',
    move_up        = '<C-k>',

    send_to_qflist = {
      char = '<c-q>',
      func = function()
        local list = {}
        local matches = pick.get_picker_matches().all

        for _, match in ipairs(matches) do
          if type(match) == 'table' then
            table.insert(list, match)
          else
            local path, lnum, col, search = string.match(match, '(.-)%z(%d+)%z(%d+)%z%s*(.+)')
            local text = path and string.format('%s [%s:%s]  %s', path, lnum, col, search)
            local filename = path or vim.trim(match):match('%s+(.+)')

            table.insert(list, {
              filename = filename or match,
              lnum = lnum or 1,
              col = col or 1,
              text = text or match,
            })
          end
        end

        vim.fn.setqflist(list, 'r')
      end,
    },
  },
  window = {
    config = function()
      local height, width, starts, ends
      local win_width = vim.o.columns
      local win_height = vim.o.lines

      if win_height <= 25 then
        height = math.min(win_height, 18)
        width = win_width
        starts = 1
        ends = win_height
      else
        width = math.floor(win_width * 0.5)   -- 50%
        height = math.floor(win_height * 0.5) -- 30%
        -- center prompt: height * (50% + 30%)
        -- center window: height * [50% + (30% / 2)]
      end

      return {
        col = starts,
        row = ends,
        height = height,
        width = width,
        style = 'minimal',
      }
    end,
  }
})
