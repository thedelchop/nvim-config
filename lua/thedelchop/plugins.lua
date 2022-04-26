vim.fn.setenv("MACOSX_DEPLOYMENT_TARGET", "10.15")

require('packer.luarocks').install_commands()
require('packer.luarocks').setup_paths()

return require('packer').startup(function()
    use_rocks 'luafilesystem'

    use 'wbthomason/packer.nvim'

    use 'tjdevries/nlua.nvim' -- Lua Development for Neovim
    use 'norcalli/nvim.lua' -- nvim is an object which contains shortcut/magic methods that are very useful for mappings. use 'tjdevries/astronauta.nvim' -- Until I merge: https://github.com/neovim/neovim/pull/13823 you can use lua keymaps by installing this plugin.

    use 'nvim-lua/plenary.nvim' -- All the lua functions I don't want to write twice.
    use 'kyazdani42/nvim-web-devicons' -- Set of icons for NeoVim that nvim-tree and lspsaga use for icons
    use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim. Hope to upstream when complete
    use 'mjlbach/neovim-ui' -- Provides common set of UI elements for NeoVim

    use 'Mofiqul/dracula.nvim' -- provides Dracula colorscheme

    use 'christoomey/vim-tmux-runner' -- A simple, vimscript only, command runner for sending commands from vim to tmux.
    use 'christoomey/vim-tmux-navigator' -- Navigate in and out of Vim and Tmux seamlessly

    use {
        "ur4ltz/surround.nvim",
        config = function()
            require"surround".setup {mappings_style = "surround"}
        end
    }

    use 'tpope/vim-projectionist' -- Set of use utilities to define things like alternate files and jump locations for all projects
    use 'tpope/vim-rails' -- Vim plugin for editing Ruby on Rails applications.
    use 'tpope/vim-repeat' -- Repeat.vim remaps . in a way that plugins can tap into it.

    use 'AndrewRadev/splitjoin.vim' -- Switch between one-line and multi-line version of code objects
    use 'b3nj5m1n/kommentary' -- Neovim plugin to comment text in and out, written in lua. Supports commenting out the current line, a visual selection and a motion.
    use 'matze/vim-move' -- Move text objects up/down indent/dedent using keyboard shorcuts
    use 'farmergreg/vim-lastplace' -- Return to the same location in a file when reopening/revisiting it

    use 'vim-test/vim-test' -- A Vim wrapper for running tests on different granularities.
    use { -- The ultimate testing plugin for NeoVim
        'rcarriga/vim-ultest',
        requires = {"vim-test/vim-test"},
        run = ":UpdateRemotePlugins"
    }

    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup({
                disable_filetype = {
                    "TelescopePrompt", "guihua", "guihua_rust", "clap_input"
                }
            })
        end
    }
    use 'windwp/nvim-ts-autotag' -- Auto close HTML tags

    use 'kana/vim-textobj-user' -- Define custom text objects and provides a set of text objects to use
    use 'amiralies/vim-textobj-elixir' -- Provide custom textobjs for Elixir specific syntax

    use {'npxbr/glow.nvim', run = ":GlowInstall"} -- Glow is a markdown preview plugin using Glow library

    use 'neovim/nvim-lspconfig' -- provides lsp servers for nvim lsp client

    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/cmp-vsnip'

    use {'hrsh7th/nvim-cmp', config = require("thedelchop.cmp")}

    use 'hrsh7th/vim-vsnip' -- Allow vim to use LSP snippets
    use 'hrsh7th/vim-vsnip-integ' -- Integrations with man of the common LSP/completion libs
    use 'rafamadriz/friendly-snippets' -- Snippets collection for a set of different programming languages for faster development.

    use 'nvim-telescope/telescope-file-browser.nvim'

    use { -- provides FZF like searching inside projects
        'nvim-telescope/telescope.nvim',
        requires = {
            {'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'},
            {'nvim-telescope/telescope-file-browser.nvim'}
        },
        config = require("thedelchop.telescope")
    }
    use {
        'kyazdani42/nvim-tree.lua', -- NERDTree like file-explorer written in Lua
        requires = 'kyazdani42/nvim-web-devicons',
        config = function()
            require'nvim-tree'.setup({
                hijack_netrw = false,
                auto_close = true,
                hide_root_folder = true,
                view = {width = 40, side = 'right'},
                filters = {custom = {'.git', 'node_modules', '.cache'}},
                git = {enable = true, ignore = true}
            })
        end

    }

    use 'ray-x/lsp_signature.nvim' -- Show function signature when you type

    use {
        'ray-x/navigator.lua',
        requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'},
        config = require("thedelchop.navigator")
    }

    use {'rrethy/vim-hexokinase', run = 'make hexokinase'} -- Render color vaules in the sidebar

    use 'sindrets/diffview.nvim'

    use {
        'TimUntersberger/neogit',
        requires = {'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim'},
        config = function()
            require('neogit').setup({integrations = {diffview = true}})
        end
    }

    use {
        'lewis6991/gitsigns.nvim',
        requires = { -- Super fast git decorations implemented purely in lua/teal.
            'nvim-lua/plenary.nvim'
        },
        config = require("thedelchop.gitsigns")
    }

    use {
        'akinsho/nvim-bufferline.lua', -- Buffer line written in Lua, works with Dracula.nvim
        requires = 'kyazdani42/nvim-web-devicons',
        config = require("thedelchop.bufferline")
    }

    use {
        'hoob3rt/lualine.nvim',
        config = function() -- A blazing fast and easy to configure neovim statusline written in pure lua.
            require('lualine').setup {options = {theme = 'dracula-nvim'}}
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter', -- The goal of nvim-treesitter is both to provide a simple and easy way to use the interface for tree-sitter in Neovim
        requires = 'windwp/nvim-ts-autotag',
        run = ':TSUpdate',
        config = require("thedelchop.treesitter")
    }

    use 'nvim-treesitter/nvim-treesitter-refactor'
    use 'nvim-treesitter/nvim-treesitter-textobjects'

    use {"folke/which-key.nvim", config = require("thedelchop.which_key")}

    use 'ygm2/rooter.nvim'

    use { -- Easily browse, preview and search JSON files
        'gennaro-tedesco/nvim-jqx',
        config = function()
            local jqx_config = require('nvim-jqx.config')

            jqx_config.sort = false
            jqx_config.query_key = 'X'
            jqx_config.close_window_key = 'q'
        end
    }

    use 'chrisbra/csv.vim' -- This plugin is used for handling column separated data with Vim, the aim of this plugin is to ease handling these kinds of files

    use 'kazhala/close-buffers.nvim' -- This plugin allows you to quickly delete multiple buffers based on the conditions provided.

    use 'McAuleyPenney/tidy.nvim' -- A function and autocommand pair that removes all trailing whitespace and newlines at the end of a buffer on save

    use { -- Show indententation levels of my code
        'lukas-reineke/indent-blankline.nvim',
        config = function()
            require("indent_blankline").setup {
                show_end_of_line = true,
                space_char_blankline = " "
            }
        end
    }

    use {
        'lukas-reineke/lsp-format.nvim',
        config = function() require("lsp-format").setup({}) end
    }

    use {
        'jose-elias-alvarez/null-ls.nvim',
        requires = {"nvim-lua/plenary.nvim"},
        config = function()
            local builtins = require('null-ls').builtins

            require("null-ls").setup({
                diagnostics_format = "[#{c}](#{s}) #{m}",
                on_attach = function(client, _)
                    require"lsp-format".on_attach(client)
                end,
                sources = {
                    builtins.diagnostics.credo.with({
                        args = {
                            "credo", "suggest", "--format", "flycheck",
                            "--read-from-stdin", "$FILENAME"
                        }
                    }), builtins.diagnostics.eslint_d,
                    builtins.diagnostics.gitlint,
                    builtins.diagnostics.markdownlint, builtins.diagnostics.tsc,

                    builtins.formatting.eslint_d,
                    builtins.formatting.lua_format,
                    builtins.formatting.markdownlint, builtins.formatting.mix,
                    builtins.formatting.prettierd
                }
            })
        end

    }

  
end)
