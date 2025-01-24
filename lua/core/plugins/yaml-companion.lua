--
-- Kubernetes schemas autodetect and ui for selecting schemas explicitly
--

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

    -- add schema information instead of section location
    require('mini.statusline').section_location = function()
      local schema = require('yaml-companion').get_buf_schema(0)
      if schema.result[1].name == 'none' then
        return ''
      end
      return schema.result[1].name
    end
  end,
}
