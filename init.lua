local augroup = require("thedelchop.utils").augroup

local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options
local cmd = vim.cmd

g.python_host_prog = os.getenv("PYTHON2_PATH")
g.python3_host_prog = os.getenv("PYTHON_PATH")

opt.autoread = true
opt.background = "dark"
opt.backupdir = vim.fn.expand("~/.cache/nvim/bkup")
opt.completeopt = {'menuone', 'noselect'} -- Completion options (for deoplete)
opt.cursorline = false
opt.directory = vim.fn.expand("~/.cache/nvim/swp")
opt.expandtab = true -- Use spaces instead of tabs
opt.errorbells = false
opt.foldlevelstart = 99
opt.hidden = true -- Enable background buffers
opt.exrc = true
opt.inccommand = "nosplit"
opt.incsearch = true
opt.ignorecase = true -- Ignore case
opt.joinspaces = false -- No double spaces with join
opt.lazyredraw = true
opt.list = true -- Show some invisible characters
opt.number = true -- Show line numbers
opt.relativenumber = true -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.shiftround = true -- Round indent
opt.shiftwidth = 2 -- Size of an indent
opt.showmode = false
opt.sidescrolloff = 8 -- Columns of context
opt.smartcase = true -- Do not ignore case with capitals
opt.smartindent = true -- Insert indents automatically
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current
opt.tabstop = 2 -- Number of spaces tabs count for
opt.undofile = true
opt.undodir = vim.fn.expand("~/.cache/nvim/undo")
opt.visualbell = true
opt.wildmode = {'list', 'longest'} -- Command-line completion mode
opt.wrap = false -- Disable line wrap
opt.termguicolors = true
opt.listchars = {
  trail = '~',
  tab = ">-",
  nbsp ="␣"
}

require("thedelchop.plugins")

g.mapleader = ";"

g.matchup_surround_enabled = 1

g.ultest_use_pty = 1
g.ultest_virtual_text = 1
g.ultest_max_threads = 4
g.ultest_output_on_line = 0

g.splitjoin_split_mapping = ''
g.splitjoin_join_mapping = ''

cmd [[colorscheme dracula]]

require("thedelchop.highlights")

require("thedelchop.keymaps")

local showRecentFilesFinder = vim.api.nvim_eval("@%") == "" or vim.api.nvim_eval("filereadable(@%)") == 0

if showRecentFilesFinder then
    cmd("command! ShowRecentFiles lua require('telescope.builtin').oldfiles({})")

    vim.api.nvim_exec("autocmd VimEnter * ShowRecentFiles", false)
end

augroup('Markdown', function(autocmd)
  autocmd [[FileType markdown setlocal textwidth=110]]
  autocmd [[FileType markdown setlocal wrap]]
  autocmd [[FileType markdown setlocal spell]]
end)

-- Replace the following with the path to your installation
require("thedelchop.lsp")

require("thedelchop.local_rc").load()
