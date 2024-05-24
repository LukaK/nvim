-- Add indentation guides even on blank lines
return {
  'lukas-reineke/indent-blankline.nvim',
  -- TODO: Remove version from the plugin when they fix the issue
  tag = 'v3.5.4',
  opts = {
    indent = {
      char = '│',
      tab_char = '│',
    },
    scope = { show_start = false, show_end = false },
    exclude = {
      filetypes = {
        'help',
        'alpha',
        'dashboard',
        'neo-tree',
        'Trouble',
        'trouble',
        'lazy',
        'mason',
        'notify',
        'toggleterm',
        'lazyterm',
      },
    },
  },
  main = 'ibl',
}
