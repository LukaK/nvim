-- TODO: Remove commented options
-- TODO: Remove this, construct wildignore option value
-- local wildignore_value = vim.opt.wildignore + { '*.o', '*.obj', '*.dylib', '*.bin', '*.dll', '*.exe', '*/.git/*', '*/.svn/*', '*/__pycache__/*', '*/build/**' }
-- wildignore_value = wildignore_value + { '*.jpg', '*.png', '*.jpeg', '*.bmp', '*.gif', '*.tiff', '*.svg', '*.ico' }
-- wildignore_value = wildignore_value + { '*.pyc', '*.pkl' }
-- wildignore_value = wildignore_value + { '*.DS_Store' }
-- wildignore_value = wildignore_value + { '*.aux', '*.bbl', '*.blg', '*.brf', '*.fls', '*.fdb_latexmk', '*.synctex.gz', '*.xdv' }

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Configure how new splits should be opened, prefer right and below for new splits
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Decrease update time
vim.opt.updatetime = 250

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- ignore certain files and folders when globing
-- vim.opt.wildignore = wildignore_value

-- ignore file and dir name cases in cmd-completion
-- vim.opt.wildignorecase = true

-- general tab settings ( vim-sleut plugin manages this now )
-- number of visual spaces per TAB
-- vim.opt.tabstop = 4
-- number of spaces in tab when editing
-- vim.opt.softtabstop = 4
-- number of spaces to use for autoinden
-- vim.opt.shiftwidth = 4
-- expand tab to spaces so that tabs are space
-- vim.opt.expandtab = true

-- Make line numbers and relative line numbers default
vim.opt.number = true
vim.opt.relativenumber = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- File and script encoding settings for vim
vim.opt.fileencoding = 'utf-8'
vim.opt.fileencodings = { 'ucs-bom', 'utf-8', 'cp936', 'gb18030', 'big5', 'euc-jp', 'euc-kr', 'latin1' }

-- Break line at predefined characters
vim.opt.linebreak = true
-- Character to show before the lines that have been soft-wrapped
vim.opt.showbreak = '↪'

-- List all matches and complete till longest common string
-- vim.opt.wildmode = { 'list:longest' }

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Ask for confirmation when closing unsaved buffers or read-only files
vim.opt.confirm = true

-- Do not use visual and errorbells
vim.opt.visualbell = true
vim.opt.errorbells = false

-- the number of command and search history to keep
-- vim.opt.history = 500

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Set highlight on search, clear on pressing <Esc> in normal mode ( in keymaps )
vim.opt.hlsearch = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Save undo history, persist undo even after closing and reopening a file
vim.opt.undofile = true

-- Maximum number of items to show in popup menu
-- vim.opt.pumheight = 10

-- Pseudo transparency for completion menu
vim.opt.pumblend = 10

-- Pseudo transparency for floating window
vim.opt.winblend = 5

-- insert mode key word completion setting
-- vim.opt.complete = vim.opt.complete + 'kspell' - 'w' - 'b' - 'u' - 't'

-- Spell languages
vim.opt.spelllang = { 'en', 'hr' }

-- Show 9 spell suggestions at most
vim.opt.spellsuggest = vim.opt.spellsuggest + '9'

-- Align indent to next multiple value of shiftwidth. For its meaning,
vim.opt.shiftround = true

-- virtual edit is useful for visual block edit
-- vim.opt.virtualedit = 'block'

-- text after this column number is not highlighted
-- vim.opt.synmaxcol = 200
-- vim.opt.startofline = false

-- Enable true color support. Do not set this option if your terminal does not
-- support true colors! For a comprehensive list of terminals supporting true
-- colors, see https://github.com/termstandard/colors and https://gist.github.com/XVilka/8346728.
vim.opt.termguicolors = true

-- Signcolumn automatically opened
vim.opt.signcolumn = 'yes:2'

-- diff options
-- show diff in vertical position
-- show filler for deleted lines
-- turn off diff when one file window is closed
-- context for diff
vim.opt.diffopt = { 'vertical', 'filler', 'closeoff', 'context:3', 'internal', 'indent-heuristic', 'algorithm:histogram' }

-- Do no wrap
-- vim.opt.wrap = false

-- external program to use for grep command
if vim.fn.executable 'rg' then
  vim.opt.grepprg = 'rg --vimgrep --no-heading --smart-case'
  vim.opt.grepformat = '%f:%l:%c:%m'
end
