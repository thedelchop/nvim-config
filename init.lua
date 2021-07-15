local fn = vim.fn                                       -- to call Vim functions e.g. fn.bufnr()
local g = vim.g                                         -- a table to access global variables
local opt = vim.opt                                     -- to set options

local nnoremap = require("motch.utils").nnoremap

opt.autoread = true
opt.background = "dark"
opt.backupdir = vim.fn.expand("~/.cache/nvim/bkup")
opt.completeopt = {'menuone', 'noselect'}   -- Completion options (for deoplete)
opt.cursorline = true
opt.directory = vim.fn.expand("~/.cache/nvim/swp")
opt.expandtab = true                                    -- Use spaces instead of tabs
opt.errorbells = false
opt.foldlevelstart = 99
opt.hidden = true                                       -- Enable background buffers
opt.inccommand = "nosplit"
opt.incsearch = true
opt.ignorecase = true                                   -- Ignore case
opt.joinspaces = false                                  -- No double spaces with join
opt.lazyredraw = true
opt.list = true                                         -- Show some invisible characters
opt.number = true                                       -- Show line numbers
opt.relativenumber = true                               -- Relative line numbers
opt.scrolloff = 4                                       -- Lines of context
opt.shiftround = true                                   -- Round indent
opt.shiftwidth = 2                                      -- Size of an indent
opt.showmode = false
opt.sidescrolloff = 8                                   -- Columns of context
opt.smartcase = true                                    -- Do not ignore case with capitals
opt.smartindent = true                                  -- Insert indents automatically
opt.splitbelow = true                                   -- Put new windows below current
opt.splitright = true                                   -- Put new windows right of current
opt.tabstop = 2                                         -- Number of spaces tabs count for
opt.undofile = true
opt.undodir = vim.fn.expand("~/.cache/nvim/undo")
opt.visualbell = true
opt.wildmode = {'list', 'longest'}                      -- Command-line completion mode
opt.wrap = false                                        -- Disable line wrap
opt.termguicolors = true

require('packer').startup(function()
  use 'wbthomason/packer.nvim'

  use 'tjdevries/nlua.nvim'                                -- Lua Development for Neovim
  use 'norcalli/nvim.lua'                                  -- nvim is an object which contains shortcut/magic methods that are very useful for mappings.
  use 'tjdevries/astronauta.nvim'                          -- Until I merge: https://github.com/neovim/neovim/pull/13823 you can use lua keymaps by installing this plugin.

  use 'nvim-lua/plenary.nvim'                              -- All the lua functions I don't want to write twice.
  use 'kyazdani42/nvim-web-devicons'                       -- Set of icons for NeoVim that nvim-tree and lspsaga use for icons
  use 'nvim-lua/popup.nvim'                                -- An implementation of the Popup API from vim in Neovim. Hope to upstream when complete
  use 'mjlbach/neovim-ui'                                  -- Provides common set of UI elements for NeoVim

  use 'Mofiqul/dracula.nvim'                               -- provides Dracula colorscheme

  use 'christoomey/vim-tmux-runner'                        -- A simple, vimscript only, command runner for sending commands from vim to tmux.
  use 'christoomey/vim-tmux-navigator'                     -- Navigate in and out of Vim and Tmux seamlessly

  use 'tpope/vim-surround'                                 -- The plugin provides mappings to easily delete, change and add such surroundings in pairs.
  use 'tpope/vim-projectionist'                            -- Set of use utilities to define things like alternate files and jump locations for all projects
  use 'tpope/vim-rails'                                    -- Vim plugin for editing Ruby on Rails applications.
  use 'tpope/vim-repeat'                                   -- Repeat.vim remaps . in a way that plugins can tap into it.

  use 'AndrewRadev/splitjoin.vim'                          -- Switch between one-line and multi-line version of code objects
  use 'alvan/vim-closetag'                                 -- Auto close HTML tags
  use 'b3nj5m1n/kommentary'                                -- Neovim plugin to comment text in and out, written in lua. Supports commenting out the current line, a visual selection and a motion.
  use 'matze/vim-move'                                     -- Move text objects up/down indent/dedent using keyboard shorcuts
  use 'farmergreg/vim-lastplace'                           -- Return to the same location in a file when reopening/revisiting it
  use 'vim-scripts/BufOnly.vim'                            -- Provides BufOnly command to close all other buffers

  use 'vim-test/vim-test'                                  -- A Vim wrapper for running tests on different granularities.
  use {                                                    -- The ultimate testing plugin for NeoVim
    'rcarriga/vim-ultest',
    requires = {"vim-test/vim-test"},
    run = ":UpdateRemotePlugins" 
  }

  use 'kana/vim-textobj-user'                              -- Define custom text objects and provides a set of text objects to use
  use 'amiralies/vim-textobj-elixir'                       -- Provide custom textobjs for Elixir specific syntax

  use {'npxbr/glow.nvim', run = ":GlowInstall"}            -- Glow is a markdown preview plugin using Glow library

  use 'neovim/nvim-lspconfig'                              -- provides lsp servers for nvim lsp client
  use 'hrsh7th/nvim-compe'                                 -- provide autocompletion
  use 'hrsh7th/vim-vsnip'                                  -- Allow vim to use LSP snippets
  use 'hrsh7th/vim-vsnip-integ'                            -- Integrations with man of the common LSP/completion libs
  use 'rafamadriz/friendly-snippets'                       -- Snippets collection for a set of different programming languages for faster development.

  use {                                                    -- provides FZF like searching inside projects
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'}
    },
    config = function()
      require('telescope').setup {
        defaults = {
          sorting_strategy = "ascending",
          layout_strategy = "horizontal",
          file_sorter =  require('telescope.sorters').get_fzy_sorter,
          file_ignore_patterns = {},
          generic_sorter =  require('telescope.sorters').get_fzy_sorter,
          color_devicons = true,
          use_less = true,
          mappings = {
            i = {
              ["jk"] = require('telescope.actions').close
            }
          }
        },
        pickers = {
          git_files = {
            previewer = false,
            theme = "dropdown"
          },
          oldfiles = {
            previewer = false,
            theme = "dropdown",
            include_current_session = true,
            cwd_only = true,
            file_ignore_patterns = {'.git/', 'tmp/'},
            prompt_title = 'Recently opened files'
          },
          buffers = {
            previewer = false,
            theme = "dropdown",
            ignore_current_buffer = true,
            only_cwd = true,
            sort_lastused = true
          },
          git_branches = {
            layout_strategy = "horizontal",
            sort_lastused = true

          },
          git_bcommits = {
            layout_strategy = "horizontal"

          },
          git_commits = {
            layout_strategy = "horizontal"
          },
          current_buffer_fuzzy_find = {
            previewer = false,
            layout_strategy = "vertical"
          }
        }
      }
    end
  }
  use { 'kyazdani42/nvim-tree.lua',                           -- NERDTree like file-explorer written in Lua
    requires = 'kyazdani42/nvim-web-devicons'
  }

  use 'voldikss/vim-floaterm'                              -- Use (neo)vim terminal in the floating/popup window.
  use {'glepnir/lspsaga.nvim', config = function()         -- Looks cool, provides a UI for Vim LSP
    require('lspsaga').init_lsp_saga()
  end}
  -- use 'ray-x/lsp_signature.nvim'                        -- Show function signature when you type

  use {'rrethy/vim-hexokinase', run = 'make hexokinase' }  -- Render color vaules in the sidebar

  use 'APZelos/blamer.nvim'                                -- Provide blame info in virtual text like VSCode
  use 'junegunn/gv.vim'                                    -- A git commit browser.
  use {'lewis6991/gitsigns.nvim',
    requires = {             -- Super fast git decorations implemented purely in lua/teal.
      'nvim-lua/plenary.nvim'
    },
    config = function()
      require('gitsigns').setup()
    end          
  }                            

  use {'akinsho/nvim-bufferline.lua',
    requires = 'kyazdani42/nvim-web-devicons',
    config = function()      -- Buffer line written in Lua, works with Dracula.nvim
      require("bufferline").setup{
        diagnostics = "nvim_lsp",
        mappings = true,
        tab_size = 36,
        max_name_length = 24,
        max_prefix_length = 21, -- prefix used when a buffer is de-duplicated
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
          local icon = level:match("error") and " " or " "
          return " " .. icon .. count
        end,
        offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "right"}}
      }
    end
  }                          

  use {'hoob3rt/lualine.nvim', config = function()             -- A blazing fast and easy to configure neovim statusline written in pure lua.
      require('lualine').setup{
       options = { 
             theme = 'dracula-nvim'
      }
    }
  end
  }

  use { 'nvim-treesitter/nvim-treesitter',                -- The goal of nvim-treesitter is both to provide a simple and easy way to use the interface for tree-sitter in Neovim
    run = ':TSUpdate',
    config = function() 
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          'bash',
          'css',
          'dockerfile',
          'elixir',
          'erlang',
          'go',
          'graphql',
          'html',
          'javascript',
          'jsdoc',
          'json',
          'jsonc',
          'lua',
          'python',
          'query',
          'regex',
          'ruby',
          'scala',
          'scss',
          'toml',
          'typescript',
          'tsx',
          'yaml',
        },
        highlight = {
          enable = true
        },
        indent = {
          enable = true
        }
      }
    end
  }
end)

g.mapleader = ";"
g.completion_enable_snippet = "vim-vsnip"

g.nvim_tree_side = 'right'
g.nvim_tree_width = 40 
g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
g.nvim_tree_gitignore = 1
g.nvim_tree_auto_open = 1
g.nvim_tree_auto_close = 1

g.ultest_use_pty = 1
g.ultest_virtual_text = 1
g.ultest_max_threads = 4
g.ultest_output_on_line = 0

vim.cmd [[colorscheme dracula]]

local function map(mode, lhs, rhs, opts)
  local options = {noremap = true}
  if opts then options = vim.tbl_extend('force', options, opts) end
  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('i', 'jk', '<Esc>')                                 -- Map escape to "jk"

nnoremap('<Leader>fl', ':NvimTreeToggle<CR>')
nnoremap('<Leader>ff', ":Telescope git_files<CR>")
nnoremap('<Leader>fF', ":Telescope oldfiles<CR>")
nnoremap('<Leader>fs', ":w<CR>")

nnoremap('<leader>bn', ':BufferLineCycleNext<CR>')
nnoremap('<leader>bp', ':BufferLineCyclePrev<CR>')
nnoremap('<leader>bd', ':bd<CR>')
nnoremap('<leader>bc', ':BufOnly<CR>')
nnoremap('<leader>bf', ':Telescope buffers<CR>')

nnoremap('<leader>wv', ':vsplit<CR>')
nnoremap('<leader>ws', ':split<CR>')
nnoremap('<leader>wd', ':q<CR>')
nnoremap('<leader>wD', ':q!<CR>')
nnoremap('<leader>wc', ':only<CR>')

nnoremap('<leader>rf', ':Telescope registers<CR>')

nnoremap('<leader>gb', ':Telescope git_branches<CR>')
nnoremap('<leader>gc', ':Telescope git_bcommits<CR>')
nnoremap('<leader>gC', ':Telescope git_commits<CR>')
nnoremap('<leader>gs', ':Telescope git_status<CR>')

nnoremap('<leader>lr', ':Telescope lsp_references<CR>')
nnoremap('<leader>li', ':Telescope lsp_implementations<CR>')
nnoremap('<leader>ld', ':Telescope lsp_definitions<CR>')
nnoremap('<leader>ls', ':Telescope lsp_document_symbols<CR>')
nnoremap('<leader>lS', ':Telescope lsp_workspace_symbols<CR>')
nnoremap('<leader>la', ':Telescope lsp_code_actions<CR>')

nnoremap('<leader>hf', ':Telescope help_tags<CR>')
nnoremap('<leader><leader>', ':Telescope commands<CR>')
nnoremap('<leader>mf', ':Telescope man_pages<CR>')

nnoremap('<leader>qq', ':qa<CR>')
nnoremap('<leader>QQ', ':qall!<CR>')

nnoremap('<leader>s/', ":Telescope live_grep<CR>")
nnoremap('<leader>sb', ":Telescope current_buffer_fuzzy_find<CR>")
nnoremap('<leader>sc', ':nohlsearch<CR>')

nnoremap('<leader>tf', ':Ultest<CR>')
nnoremap('<leader>tn', ':UltestNearest<CR>')
nnoremap('<leader>ts', ':UltestSummary<CR>')
nnoremap('<leader>to', ':UltestOutput<CR>')
nnoremap('<leader>tc', ':UltestClear<CR>')
nnoremap('<leader>tS', ':UltestStop<CR>')

opt.foldmethod = "manual"

-- Replace the following with the path to your installation
local LSP = require("motch.lsp")

local path_to_elixirls = vim.fn.expand("~/.local/share/elixir-ls/rel/language_server.sh")

LSP.setup(
  "elixirls",
  {
    settings = {
      elixirLS = {
        dialyzerEnabled = false,
        fetchDeps = false
      }
    },
    cmd = {path_to_elixirls}
  }
)
LSP.setup(
  "efm",
  {
    filetypes = {
      "elixir",
      "javascript",
      "lua",
      "bash",
      "zsh",
      "sh"
    }
  }
)
LSP.setup("solargraph", {})
LSP.setup("tsserver", {})
LSP.setup("vimls", {})

