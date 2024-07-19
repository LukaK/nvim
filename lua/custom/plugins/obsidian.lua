return {
  {
    'epwalsh/obsidian.nvim',
    version = '*', -- recommended, use latest release instead of latest commit
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    config = function()
      -- setup the plugin
      require('obsidian').setup {
        workspaces = {
          {
            name = 'personal',
            path = '~/Project_reference/SecondBrain',
          },
          {
            name = 'documentation',
            path = '~/Project_reference/Documentation/',
          },
        },

        -- disable auto formatting of notes ( headers )
        disable_frontmatter = true,

        -- templates configuration
        templates = { folder = '0 Meta Folder/Templates' },

        -- default location for new notes
        new_notes_location = 'notes_subdir',
        notes_subdir = 'Fleeting Notes',

        mappings = {
          -- follow links
          ['gf'] = {
            action = function()
              return require('obsidian').util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
          },
        },
      }

      -- formatting title in notes, helper function
      local function format_title()
        vim.cmd 'g/^# [-a-zA-Z1-9]*$/s/\\(\\w\\+\\)/\\u\\1/ge'
        vim.cmd 'g/^# [-a-zA-Z1-9]*$/s/-/ /ge'
        vim.cmd 'nohlsearch'
      end

      local function format__alias()
        vim.cmd 'g/^alias: .*$/s/-/ /ge'
        vim.cmd 'g/^alias: .*$/s/\\(\\w\\+\\)/\\u\\1/ge'
        vim.cmd 's/^Alias:/alias:/e'
        vim.cmd 'nohlsearch'
      end

      local function format_literature_title()
        vim.cmd 'g/^# [-_a-zA-Z1-9]*$/s/[-a-zA-Z1-9]*_//e'
        vim.cmd 'g/^# [-_a-zA-Z1-9]*$/s/\\(\\w\\+\\)/\\u\\1/ge'
        vim.cmd 'g/^# [-_a-zA-Z1-9]*$/s/-/ /ge'
        vim.cmd 'nohlsearch'
      end

      local function format_literature_meta_title()
        vim.cmd 'g/^title: .*$/s/[-a-zA-Z1-9]*_//e'
        vim.cmd 'g/^title: .*$/s/-/ /ge'
        vim.cmd 'g/^title: .*$/s/\\(\\w\\+\\)/\\u\\1/ge'
        vim.cmd 's/^Title:/title:/e'
        vim.cmd 'nohlsearch'
      end

      local function format_literature_meta_author()
        vim.cmd 'g/^author: .*$/s/_[-a-zA-Z1-9]*$//e'
        vim.cmd 'g/^author: .*$/s/-/ /ge'
        vim.cmd 'g/^author: .*$/s/\\(\\w\\+\\)/\\u\\1/ge'
        vim.cmd 's/^Author:/author:/e'
        vim.cmd 'nohlsearch'
      end

      local function format_literature_meta_alias()
        vim.cmd 'g/^alias: .*$/s/[-a-zA-Z1-9]*_//e'
        vim.cmd 'g/^alias: .*$/s/-/ /ge'
        vim.cmd 'g/^alias: .*$/s/\\(\\w\\+\\)/\\u\\1/ge'
        vim.cmd 's/^Alias:/alias:/e'
        vim.cmd 'nohlsearch'
      end

      vim.keymap.set('n', '<leader>oo', ':ObsidianOpen<cr>', { desc = '[O]bsidian [O]pen' })
      vim.keymap.set('n', '<leader>oc', ':ObsidianNew <cr><cr>', { desc = '[O]bsidian [C]reate' })

      -- create new note
      vim.keymap.set('n', '<leader>on', function()
        vim.cmd 'vsplit'
        vim.cmd 'ObsidianNew'
        vim.cmd 'g/^#/d'
        vim.cmd 'ObsidianTemplate Main Note'
        format_title()
        format__alias()
      end, { desc = '[O]bsidian [N]ote' })

      -- create literature template
      vim.keymap.set('n', '<leader>ol', function()
        vim.cmd 'ObsidianNew'
        vim.cmd 'g/^#/d'
        vim.cmd 'ObsidianTemplate Literature Note'
        format_literature_title()
        format_literature_meta_title()
        format_literature_meta_author()
        format_literature_meta_alias()
      end, { desc = '[O]bsidian [L]iterature' })

      vim.keymap.set('n', '<leader>oi', function()
        vim.cmd 'ObsidianNew'
        vim.cmd 'g/^#/d'
        vim.cmd 'ObsidianTemplate Index'
        format_title()
      end, { desc = '[O]bsidian [I]ndex' })

      local telescope_builtin = require 'telescope.builtin'
      -- search main notes
      vim.keymap.set('n', '<leader>of', function()
        telescope_builtin.find_files { cwd = '~/Project_reference/SecondBrain/Main Notes' }
      end, { desc = '[O]bsidian [F]iles' })

      -- live grep main notes
      vim.keymap.set('n', '<leader>og', function()
        telescope_builtin.live_grep { cwd = '~/Project_reference/SecondBrain/Main Notes' }
      end, { desc = '[O]bsidian [G]rep' })
    end,
  },
}
