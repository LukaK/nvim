return {
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    lazy = true,
    ft = 'markdown',
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      workspaces = {
        {
          name = 'personal',
          path = '~/Project_reference/Obsidian-archive/KnowledgeBase/',
        },
      },
      mappings = {},
    },
    config = function()
      vim.opt.conceallevel = 2
    end,
  },
}