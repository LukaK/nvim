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
  },
  cmd = 'Neotree',
  keys = {
    { '\\', ':Neotree toggle<CR>', { desc = 'NeoTree toggle' } },
  },
  opts = {
    -- add relative numbers to neo-tree
    event_handlers = {
      {
        event = 'neo_tree_buffer_enter',
        handler = function()
          vim.opt.relativenumber = true
        end,
      },
    },
    filesystem = {
      window = {
        position = "float",
        mappings = {
          ['\\'] = 'close_window',
        },
      },
    },
  },
}
