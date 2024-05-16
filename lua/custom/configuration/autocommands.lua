-- more accurate syntax highlighting
-- vim.api.nvim_create_autocmd("BufEnter", { nested = true, callback = function() vim.api.nvim_command("syntax sync fromstart") end })

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Relative number toggle on focus
vim.api.nvim_create_autocmd({ 'BufEnter', 'FocusGained', 'InsertLeave', 'WinEnter' }, {
  desc = 'Toggle off relative numbers',
  group = vim.api.nvim_create_augroup('relative-number-toggle', { clear = true }),
  --  nested = true,
  callback = function()
    if vim.wo.number then
      vim.wo.relativenumber = true
    end
  end,
})
vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost', 'InsertEnter', 'WinLeave' }, {
  desc = 'Toggle on relative numbers',
  group = vim.api.nvim_create_augroup('relative-number-toggle', { clear = false }),
  --  nested = true,
  callback = function()
    if vim.wo.number then
      vim.wo.relativenumber = false
    end
  end,
})

-- Do not use smart case in command line mode, extracted from https://vi.stackexchange.com/a/16511/15292.
vim.api.nvim_create_autocmd('CmdLineEnter', {
  --  nested = true,
  desc = 'Toggle off smart case',
  group = vim.api.nvim_create_augroup('smart-case-toggle', { clear = true }),
  callback = function()
    vim.api.nvim_set_option('smartcase', false)
  end,
})
vim.api.nvim_create_autocmd('CmdLineLeave', {
  --  nested = true,
  desc = 'Toggle on smart case',
  group = vim.api.nvim_create_augroup('smart-case-toggle', { clear = false }),
  callback = function()
    vim.api.nvim_set_option('smartcase', true)
  end,
})

-- Terminal settings
vim.api.nvim_create_autocmd('TermOpen', {
  --  nested = true,
  desc = 'Set terminal options, nonumbers and start in insert mode',
  group = vim.api.nvim_create_augroup('set-terminal-options', { clear = true }),
  callback = function()
    vim.wo.relativenumber = false
    vim.wo.number = false
    vim.api.nvim_command 'startinsert'
  end,
})

-- Display a message when the current file is not in utf-8 format.
vim.api.nvim_create_autocmd('BufRead', {
  --  nested = true,
  desc = 'Display message if file is not utf-8 encoded',
  group = vim.api.nvim_create_augroup('notify-on-file-encoding', { clear = true }),
  callback = function()
    if vim.api.nvim_buf_get_option(0, 'fileencoding') ~= 'utf-8' then
      vim.notify('File not in UTF-8 format!', 'warn', { title = 'nvim-config' })
    end
  end,
})

-- Automatically reload the file if it is changed outside of Nvim, see
-- https://unix.stackexchange.com/a/383044/221410. It seems that `checktime`
-- Command does not work in command line. We need to check if we are in command
-- line before executing this command. See also https://vi.stackexchange.com/a/20397/15292.
vim.api.nvim_create_autocmd('FileChangedShellPost', {
  nested = true,
  callback = function()
    vim.notify('File changed on disk. Buffer reloaded!', 'warn', { title = 'nvim-config' })
  end,
})
vim.api.nvim_create_autocmd({ 'FocusGained', 'CursorHold' }, {
  nested = true,
  callback = function()
    if vim.api.nvim_exec('call getcmdwintype()', true) == '' then
      vim.api.nvim_command 'checktime'
    end
  end,
})

-- TODO: Rewrite this command
-- Resume edit position
vim.cmd [[
  function s:resume_edit_pos() abort
    if line("'\"") > 1 && line("'\"") <= line("$") && &ft !~# 'commit'
      let l:args = v:argv  " command line arguments
      for l:cur_arg in l:args
        " Check if a go-to-line command is given.
        let idx = match(l:cur_arg, '\v^\+(\d){1,}$')
        if idx != -1
          return
        endif
      endfor

      execute "normal! g`\"zvzz"
    endif
  endfunction

  augroup resume_edit_position
    autocmd!
    autocmd BufReadPost * call s:resume_edit_pos()
  augroup END
]]

-- TODO: See if you want to enable this
-- automatically sync packer packages when saving plugins.lua
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   augroup end
-- ]])
