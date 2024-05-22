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
    dependencies = {
      'godlygeek/tabular',
    },
    ft = 'markdown',
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
    end,
  },
  {
    'iamcco/markdown-preview.nvim',
    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },
    ft = { 'markdown' },
    build = function()
      vim.fn['mkdp#util#install']()
    end,
  },
}
