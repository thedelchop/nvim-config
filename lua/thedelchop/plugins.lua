return {

  'tjdevries/nlua.nvim', -- Lua Development for Neovim
  'norcalli/nvim.lua', -- nvim is an object which contains shortcut/magic methods that are very useful for mappings. use 'tjdevries/astronauta.nvim' -- Until I merge: https://github.com/neovim/neovim/pull/13823 you can use lua keymaps by installing this plugin.
  'nvim-lua/plenary.nvim', -- All the lua functions I don't want to write twice.
  'nvim-tree/nvim-web-devicons', -- Set of icons for NeoVim that nvim-tree and lspsaga use for icons
  {
    'Mofiqul/dracula.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      require("dracula").setup({})
      vim.cmd([[colorscheme dracula]])
    end,
  }, -- provides Dracula colorscheme
  {
    "ur4ltz/surround.nvim",
    config = function()
      require("surround").setup { mappings_style = "surround" }
    end
  },
  'tpope/vim-repeat', -- Repeat.vim remaps . in a way that plugins can tap into it.
  'AndrewRadev/splitjoin.vim', -- Switch between one-line and multi-line version of code objects
  'b3nj5m1n/kommentary', -- Neovim plugin to comment text in and out, written in lua. Supports commenting out the current line, a visual selection and a motion.
  'farmergreg/vim-lastplace', -- Return to the same location in a file when reopening/revisiting it
  'mfussenegger/nvim-dap',
  {
    "ahmedkhalf/project.nvim",
    config = function()
      require("project_nvim").setup {
        ignore_lsp = { "null-ls", "graphql" },
        patterns = { "package.json", "mix.exs", ".git", "Makefile" },
        silent_chdir = true
      }
    end
  },
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim",
      "marilari88/neotest-vitest",
      "jfpedroza/neotest-elixir",
    },
    config = function()
      require("neotest").setup({
        status = {
          enabled = true,
          virtual_text = false,
          signs = true,
        },
        adapters = {
          require('neotest-vitest'),
          require("neotest-elixir")({
            mix_task = { "test" }
          }),
        }
      })
    end
  },
  {
    "folke/neodev.nvim",
    config = function()
      require("neodev").setup({
        library = {
          plugins = { "neotest" },
          types = true
        },
      })
    end
  },
  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({
        disable_filetype = {
          "TelescopePrompt", "guihua", "guihua_rust", "clap_input"
        }
      })
    end
  },
  'windwp/nvim-ts-autotag', -- Auto close HTML tags

  'neovim/nvim-lspconfig', -- provides lsp servers for nvim lsp client

  'hrsh7th/cmp-nvim-lsp',
  'hrsh7th/cmp-buffer',
  'hrsh7th/cmp-path',
  'hrsh7th/cmp-cmdline',
  'hrsh7th/cmp-vsnip',

  'hrsh7th/vim-vsnip', -- Allow vim to use LSP snippets
  'hrsh7th/vim-vsnip-integ', -- Integrations with man of the common LSP/completion libs
  'rafamadriz/friendly-snippets', -- Snippets collection for a set of different programming languages for faster development.

  { 'hrsh7th/nvim-cmp', config = require("thedelchop.cmp") },

  'nvim-telescope/telescope-file-browser.nvim',

  'nvim-lua/popup.nvim',
  { -- provides FZF like searching inside projects
    'nvim-telescope/telescope.nvim',
    dependencies = {
      'nvim-lua/popup.nvim',
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
    },
    config = require("thedelchop.telescope")
  },

  {
    'nvim-tree/nvim-tree.lua', -- NERDTree like file-explorer written in Lua
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require 'nvim-tree'.setup({
        hijack_netrw = true,
        renderer = {
          root_folder_label = false
        },
        view = { width = 40, side = 'right' },
        filters = { custom = { '.git', 'node_modules', '.cache' } },
        git = { enable = true, ignore = true }
      })
    end
  },

  'ray-x/lsp_signature.nvim', -- Show function signature when you type

  { 'ray-x/guihua.lua', build = 'cd lua/fzy && make' },

  {
    'ray-x/navigator.lua',
    dependencies = {
      'ray-x/guihua.lua',
      'neovim/nvim-lspconfig'
    },
  },

  { 'rrethy/vim-hexokinase', build = 'make hexokinase' }, -- Render color vaules in the sidebar

  'sindrets/diffview.nvim',

  {
    'NeogitOrg/neogit',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'sindrets/diffview.nvim',
    },
    config = function()
      require('neogit').setup({
        integrations = {
          telescope = true,
          diffview = true,
        }
      })
    end
  },

  'tpope/vim-fugitive',

  {
    'lewis6991/gitsigns.nvim',
    dependencies = 'nvim-lua/plenary.nvim',
    config = require("thedelchop.gitsigns")
  },
  {
    'akinsho/bufferline.nvim',
    version = "v3.*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = require("thedelchop.bufferline"),
  },
  {
    'hoob3rt/lualine.nvim',
    config = function() -- A blazing fast and easy to configure neovim statusline written in pure lua.
      require('lualine').setup { options = { theme = 'dracula-nvim' } }
    end
  },
  {
    'nvim-treesitter/nvim-treesitter', -- The goal of nvim-treesitter is both to provide a simple and easy way to use the interface for tree-sitter in Neovim
    build = ':TSUpdate',
    config = require("thedelchop.treesitter")
  },

  'nvim-treesitter/nvim-treesitter-textobjects',

  { "folke/which-key.nvim", config = require("thedelchop.which_key") },

  'ygm2/rooter.nvim',

  { -- Easily browse, preview and search JSON files
    'gennaro-tedesco/nvim-jqx',
    config = function()
      local jqx_config = require('nvim-jqx.config')

      jqx_config.sort = false
      jqx_config.query_key = 'X'
      jqx_config.close_window_key = 'q'
    end
  },

  'chrisbra/csv.vim', -- This plugin is used for handling column separated data with Vim, the aim of this plugin is to ease handling these kinds of files

  'kazhala/close-buffers.nvim', -- This plugin allows you to quickly delete multiple buffers based on the conditions provided.

  'McAuleyPenney/tidy.nvim', -- A function and autocommand pair that removes all trailing whitespace and newlines at the end of a buffer on save

  { -- Show indententation levels of my code
    'lukas-reineke/indent-blankline.nvim',
    main = "ibl",
    config = function()
      require("ibl").setup()
    end
  },

  { 'jose-elias-alvarez/null-ls.nvim', dependencies = "nvim-lua/plenary.nvim" }
}
