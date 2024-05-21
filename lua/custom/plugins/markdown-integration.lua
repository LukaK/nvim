return {
  -- {
  --   'denstiny/styledoc.nvim',
  --   dependencies = {
  --     'nvim-treesitter/nvim-treesitter',
  --     'vhyrro/luarocks.nvim',
  --     '3rd/image.nvim',
  --   },
  --   opts = true,
  --   ft = 'markdown',
  -- },
  {
    'plasticboy/vim-markdown',
    ft = 'markdown',
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
    end,
  },
}
