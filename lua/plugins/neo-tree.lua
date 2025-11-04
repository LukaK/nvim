---
--- File system navigation
---

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',

    -- 👇 required for window picker to work
    {
      's1n7ax/nvim-window-picker',
      version = '2.*',
      opts = {
        hint = 'floating-big-letter',
        autoselect_one = true,
        filter_rules = {
          include_current_win = false,
          bo = {
            filetype = {
              'neo-tree', 'neo-tree-popup', 'notify',
              'no-neck-pain', 'qf', 'help', 'startify', 'dashboard',
            },
            buftype = { 'terminal', 'quickfix', 'nofile', 'prompt' },
          },
        },
      },
    },
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree toggle<CR>', { desc = 'NeoTree toggle' } },
  },
  opts = {
    -- never replace these buffers when opening a file
    open_files_do_not_replace_types = {
      "terminal", "trouble", "qf", "help", "nofile", "prompt", "no-neck-pain"
    },

    -- add relative numbers to neo-tree
    event_handlers = {
      {
        event = 'neo_tree_buffer_enter',
        handler = function()
          vim.opt.relativenumber = true
        end,
      },
    },

    -- global window behavior (affects mappings like <CR>)
    window = {
      mappings = {
        ["<cr>"] = "open_with_window_picker", -- ensure files don't land in no-neck-pain panes
        ["l"] = "open",
        ["h"] = "close_node",
      },
    },

    -- window picker config: exclude no-neck-pain & aux windows
    window_picker = {
      enabled = true,
      autoselect_one = true,
      include_current = false,
      filter_rules = {
        bo = {
          filetype = {
            "neo-tree", "neo-tree-popup", "notify",
            "no-neck-pain", "qf", "help", "startify", "dashboard",
          },
          buftype = { "terminal", "quickfix", "nofile", "prompt" },
        },
      },
    },

    filesystem = {
      window = {
        position = "float",
        mappings = {
          ['\\'] = 'close_window',
        },
      },
      hijack_netrw_behavior = "open_default",
    },
  },
}
