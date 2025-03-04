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
            ['d'] = require('telescope.actions').delete_buffer,

            -- close telescope with q in normal mode
            ['q'] = require('telescope.actions').close,
          },
        },
      },
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      }
  },
  keys = {
    {'<leader>sd', require('telescope.builtin').diagnostics, mode = 'n', desc = '[S]earch [D]iagnostics' },
    {'<leader>sh', require('telescope.builtin').help_tags, mode = 'n', desc = '[S]earch [H]elp' },
    {'<leader>sk', require('telescope.builtin').keymaps, mode = 'n', desc = '[S]earch [K]eymaps' },
    {'<leader>sf', require('telescope.builtin').find_files, mode = 'n', desc = '[S]earch [F]iles' },
    {'<leader>sw', require('telescope.builtin').grep_string, mode = 'n', desc = '[S]earch current [W]ord' },
    {'<leader>sg', require('telescope.builtin').live_grep, mode = 'n', desc = '[S]earch by [G]rep' },
    {'<leader>sr', require('telescope.builtin').resume, mode = 'n', desc = '[S]earch [R]esume' },
    {'<leader>st', require('telescope.builtin').builtin, mode = 'n', desc = '[S]earch Select [T]elescope' },
    {'<leader>s.', require('telescope.builtin').oldfiles, mode = 'n', desc = '[S]earch Recent Files ("." for repeat)' },
    {'<leader><leader>', require('telescope.builtin').buffers, mode = 'n', desc = '[ ] Find existing buffers' },
    {'<leader>s/', function() require('telescope.builtin').live_grep{grep_open_files=true, prompt_title='Live Grep in Open Files'} end, mode = 'n', desc = '[S]earch [/] in Open Files' },
    {'<leader>sn', function() require('telescope.builtin').find_files{cwd = vim.fn.stdpath 'config'} end, mode = 'n', desc = '[S]earch [N]eovim files' }
  },
  config = function(_, opts)
    require('telescope').setup(opts)

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

  end,
}
