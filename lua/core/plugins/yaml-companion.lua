return {
  'someone-stole-my-name/yaml-companion.nvim',
  requires = {
    { 'neovim/nvim-lspconfig' },
    { 'nvim-lua/plenary.nvim' },
    { 'nvim-telescope/telescope.nvim' },
  },
  config = function()
    require('telescope').load_extension 'yaml_schema'
    vim.keymap.set('n', '<leader>ss', require('yaml-companion').open_ui_select, { desc = '[S]earch [S]chema' })
  end,
}
