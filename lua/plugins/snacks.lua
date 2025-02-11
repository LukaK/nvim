--
-- Umbrela plugin for multiple plugins
--

-- TODO: Setup rename with neotree, works with import statements
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
    lazygit = { enabled = false }, -- TODO: Install lazygit and install neogin
    statuscolumn = { enabled = false },
    terminal = { enabled = false },
    dashboard = { enabled = false },
    scratch = { enabled = false },
    zen = { enabled = false },
  },
  keys = {},
}
