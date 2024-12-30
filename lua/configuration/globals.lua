-- Set python3 path to pyenv environment if present
local function file_exists(name)
  local f = io.open(name, 'r')
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

local python3_path = '/usr/bin/python'
local python3_pyenv_path = vim.env['PYENV_ROOT'] .. '/versions/py3nvim/bin/python'

if file_exists(python3_pyenv_path) then
  vim.g.python3_host_prog = python3_pyenv_path
else
  vim.g.python3_host_prog = python3_path
end

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- do not use builtin matchit.vim and matchparen.vim since we use vim-matchup plugin
vim.g.loaded_matchit = 1
vim.g.loaded_matchparen = 1

-- use English as main language
vim.g.language = 'en_US.utf-8'

-- vim tmux navigator
vim.g.tmux_navigator_no_mappings = 1
