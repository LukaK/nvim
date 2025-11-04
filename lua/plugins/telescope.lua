--
-- Plugin that helps with fuzzy searches
--

return {
  'nvim-telescope/telescope.nvim',
  event = 'VimEnter',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  opts = {
      defaults = {
        mappings = {
          i = {
            -- open file in a split screen
            ['<c-s>'] = 'select_vertical',
          },
          n = {
            -- close buffers with letter d
            ['d'] = 'delete_buffer',

            -- close telescope with q in normal mode
            ['q'] = 'close',
          },
        },
      },
      extensions = {}
  },
  keys = {
    {'<leader>sd', '<cmd>Telescope diagnostics<cr>', mode = 'n', desc = '[S]earch [D]iagnostics' },
    { '<leader>sh', '<cmd>Telescope help_tags<cr>',   desc = '[S]earch [H]elp' },
    { '<leader>sk', '<cmd>Telescope keymaps<cr>',     desc = '[S]earch [K]eymaps' },
    { '<leader>sf', '<cmd>Telescope find_files<cr>',  desc = '[S]earch [F]iles' },
    { '<leader>sw', '<cmd>Telescope grep_string<cr>', desc = '[S]earch current [W]ord' },
    { '<leader>sg', '<cmd>Telescope live_grep<cr>',   desc = '[S]earch by [G]rep' },
    { '<leader>sr', '<cmd>Telescope resume<cr>',      desc = '[S]earch [R]esume' },
    { '<leader>st', '<cmd>Telescope builtin<cr>',     desc = '[S]earch Select [T]elescope' },
    { '<leader>s.', '<cmd>Telescope oldfiles<cr>',    desc = '[S]earch Recent Files' },
    {'<leader>sb', '<cmd>Telescope git_branches<cr>', mode = 'n', desc = '[S]earch [B]ranch' },
    { '<leader><leader>', '<cmd>Telescope buffers<cr>', desc = '[ ] Find existing buffers' },
    {
      '<leader>s/',
      function() require('telescope.builtin').live_grep { grep_open_files = true, prompt_title = 'Live Grep in Open Files' } end,
      desc = '[S]earch [/] in Open Files'
    },
    {
      '<leader>sn',
      function() require('telescope.builtin').find_files { cwd = vim.fn.stdpath 'config' } end,
      desc = '[S]earch [N]eovim files'
    },
  },
  config = function(_, opts)
    require('telescope').setup(opts)
    local themes = require('telescope.themes')

    -- Inject extension config that needed `themes`
    opts.extensions['ui-select'] = themes.get_dropdown()

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

  end,
}
