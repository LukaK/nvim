--
-- Umbrela plugin for multiple plugins
--

-- TODO: Setup rename with neotree
return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    scope = { enabled = true },
    bigfile = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    quickfile = { enabled = true },
    scroll = { enabled = true },
    words = { enabled = true },
    indent = {
      enabled = true,
      animate = {
        enabled = false, -- disable animated highlighting of the indent line
      },
      scope = {
        enabled = false, -- disable highlighting of the current line
      },
    },
    lazygit = { enabled = false }, -- TODO: Check if lazygit is usefull
    statuscolumn = { enabled = false }, -- TODO: Find where existing status column is defined, check if you can disable your own configuraation of status column
    terminal = { enabled = false }, -- TODO: Check if you can use it instead of toggle term
    dashboard = { enabled = false },
    scratch = { enabled = false },
    zen = { enabled = false },
  },
}
