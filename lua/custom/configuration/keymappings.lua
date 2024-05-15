-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Disable arrow keys in normal mode
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
-- Use CTRL+<hjkl> to switch between windows
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Use ; to go to command mode
vim.keymap.set('n', ';', ':', { desc = 'Go to command mode' })
vim.keymap.set('x', ';', ':', { desc = 'Go to command mode' })

-- Continuous visual shifting (does not exit Visual mode), `gv` means
-- to reselect previous visual area, see https://superuser.com/q/310417/736190
vim.keymap.set('x', '>', '>gv', { desc = 'Increase indentation in visual mode consecutively' })
vim.keymap.set('x', '<', '<gv', { desc = 'Decrease indentation in visual mode consecutively' })

-- Search in selected region
vim.keymap.set('x', '/', [[:<C-U>call feedkeys('/\%>'.(line("'<")-1).'l\%<'.(line("'>")+1)."l")<CR>]], { desc = 'Search in selected region' })

-- Use Esc to quit builtin terminal
vim.keymap.set('t', '<ESC>', '<C-\\><C-n>', { desc = 'Quit builtin terminal' })

-- Toggle spell checking (autosave does not play well with z=, so we disable it
-- when we are doing spell checking)
vim.keymap.set('n', '<F3>', ':<C-U> set spell!<CR>', { desc = 'Enable spell checking' })
vim.keymap.set('i', '<F3>', ':<C-U> set spell!<CR>', { desc = 'Enable spell checking' })

-- Close a buffer and switching to another buffer, do not close the
-- window, see https://stackoverflow.com/q/4465095/6064933
-- vim.keymap.set("n", "\\d", ":<C-U>bprevious <bar> bdelete #<CR>", { desc = 'Close a buffer and switch' })

-- TODO: Add reloading of neovim configuration automatically
