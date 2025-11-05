--
-- Umbrela plugin for multiple plugins
--

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    scope = { enabled = true },
    bigfile = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = false },
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
    lazygit = { enabled = true },
    statuscolumn = { enabled = false },
    terminal = { enabled = false },
    dashboard = { enabled = false },
    scratch = { enabled = false },
    zen = { enabled = false },
  },
  keys = {
    {
      '<leader>lg',
      function()
        require('snacks').lazygit()
      end,
      desc = 'LazyGit',
    },
  },
}
