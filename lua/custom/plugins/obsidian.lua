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
        },

        -- disable auto formatting of notes ( headers )
        disable_frontmatter = true,

        -- templates configuration
        templates = { folder = 'Templates' },

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
        vim.cmd 'g/^# [-a-z]*$/s/\\(\\w\\+\\)/\\u\\1/ge'
        vim.cmd 'g/^# [-a-zA-Z]*$/s/-/ /ge'
        vim.cmd 'nohlsearch'
      end

      vim.keymap.set('n', '<leader>ot', format_title, { desc = '[O]bsidian [T]itle' })
      vim.keymap.set('n', '<leader>oo', ':ObsidianOpen<cr>', { desc = '[O]bsidian [O]pen' })

      -- create new note
      vim.keymap.set('n', '<leader>on', function()
        vim.cmd 'ObsidianTemplate Main Note'
        format_title()
      end, { desc = '[O]bsidian [N]ote' })

      -- create literature template
      vim.keymap.set('n', '<leader>ol', function()
        vim.cmd 'ObsidianTemplate Literature Note'
        format_title()
      end, { desc = '[O]bsidian [L]iterature' })

      local telescope_builtin = require 'telescope.builtin'
      -- search main notes
      vim.keymap.set('n', '<leader>of', function()
        telescope_builtin.find_files { cwd = '~/Project_reference/SecondBrain/' }
      end, { desc = '[O]bsidian [F]iles' })

      -- live grep main notes
      vim.keymap.set('n', '<leader>og', function()
        telescope_builtin.live_grep { cwd = '~/Project_reference/SecondBrain/' }
      end, { desc = '[O]bsidian [G]rep' })
    end,
  },
}
