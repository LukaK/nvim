--
-- colorscheme
--

-- FIX: Colors are not good too dark ( alacratty issue )
return {
  -- You can easily change to a different colorscheme.
  -- Change the name of the colorscheme plugin below, and then
  -- change the command in the config to whatever the name of that colorscheme is.
  --
  -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
  'shaunsingh/nord.nvim',
  lazy = false,
  priority = 1000, -- Make sure to load this before all the other start plugins.
  init = function()
    vim.g.nord_contrast = true -- this is reponsible for different contrast in popup windows
    vim.g.nord_borders = true
    vim.g.nord_disable_background = false
    vim.g.nord_italic = false
    require('nord').set()

    -- You can configure highlights by doing something like:
    -- vim.cmd.hi 'Comment gui=none'
  end,
}
