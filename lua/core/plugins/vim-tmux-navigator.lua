--
-- Helps with navigation betwee vim and tmux
--
return {
  'christoomey/vim-tmux-navigator',
  lazy = false,
  init = function()
    -- disable automatic creation of mappings
    vim.g.tmux_navigator_no_mappings = 1
  end,
  config = function()
    vim.keymap.set('n', '<c-h>', '<cmd>TmuxNavigateLeft<cr>')
    vim.keymap.set('n', '<c-j>', '<cmd>TmuxNavigateDown<cr>')
    vim.keymap.set('n', '<c-k>', '<cmd>TmuxNavigateUp<cr>')
    vim.keymap.set('n', '<c-l>', '<cmd>TmuxNavigateRight<cr>')
  end,
}
