local g = vim.g -- a table to access global variables
local opt = vim.opt -- to set options
local cmd = vim.cmd

g.python_host_prog = os.getenv("PYTHON2_PATH")
g.python3_host_prog = os.getenv("PYTHON_PATH")

opt.autoread = true
opt.background = "dark"
opt.backupdir = vim.fn.expand("~/.cache/nvim/bkup")
opt.completeopt = {'menuone', 'noselect'} -- Completion options (for deoplete)
opt.cursorline = true
opt.directory = vim.fn.expand("~/.cache/nvim/swp")
opt.expandtab = true -- Use spaces instead of tabs
opt.errorbells = false
opt.foldlevelstart = 99
opt.hidden = true -- Enable background buffers
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

require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use 'tjdevries/nlua.nvim' -- Lua Development for Neovim
    use 'norcalli/nvim.lua' -- nvim is an object which contains shortcut/magic methods that are very useful for mappings.
    use 'tjdevries/astronauta.nvim' -- Until I merge: https://github.com/neovim/neovim/pull/13823 you can use lua keymaps by installing this plugin.

    use 'nvim-lua/plenary.nvim' -- All the lua functions I don't want to write twice.
    use 'kyazdani42/nvim-web-devicons' -- Set of icons for NeoVim that nvim-tree and lspsaga use for icons
    use 'nvim-lua/popup.nvim' -- An implementation of the Popup API from vim in Neovim. Hope to upstream when complete
    use 'mjlbach/neovim-ui' -- Provides common set of UI elements for NeoVim

    use 'Mofiqul/dracula.nvim' -- provides Dracula colorscheme

    use 'christoomey/vim-tmux-runner' -- A simple, vimscript only, command runner for sending commands from vim to tmux.
    use 'christoomey/vim-tmux-navigator' -- Navigate in and out of Vim and Tmux seamlessly

    use 'tpope/vim-surround' -- The plugin provides mappings to easily delete, change and add such surroundings in pairs.
    use 'tpope/vim-projectionist' -- Set of use utilities to define things like alternate files and jump locations for all projects
    use 'tpope/vim-rails' -- Vim plugin for editing Ruby on Rails applications.
    use 'tpope/vim-repeat' -- Repeat.vim remaps . in a way that plugins can tap into it.

    use 'AndrewRadev/splitjoin.vim' -- Switch between one-line and multi-line version of code objects
    use 'alvan/vim-closetag' -- Auto close HTML tags
    use 'b3nj5m1n/kommentary' -- Neovim plugin to comment text in and out, written in lua. Supports commenting out the current line, a visual selection and a motion.
    use 'matze/vim-move' -- Move text objects up/down indent/dedent using keyboard shorcuts
    use 'farmergreg/vim-lastplace' -- Return to the same location in a file when reopening/revisiting it
    use 'thedelchop/vim-bufonly' -- Provides BufOnly command to close all other buffers

    use 'vim-test/vim-test' -- A Vim wrapper for running tests on different granularities.
    use { -- The ultimate testing plugin for NeoVim
        'rcarriga/vim-ultest',
        requires = {"vim-test/vim-test"},
        run = ":UpdateRemotePlugins"
    }

    use 'kana/vim-textobj-user' -- Define custom text objects and provides a set of text objects to use
    use 'amiralies/vim-textobj-elixir' -- Provide custom textobjs for Elixir specific syntax

    use {'npxbr/glow.nvim', run = ":GlowInstall"} -- Glow is a markdown preview plugin using Glow library

    use 'neovim/nvim-lspconfig' -- provides lsp servers for nvim lsp client
    use { -- provide autocompletion
        'hrsh7th/nvim-compe',
        config = function()
            require("compe").setup {
                enabled = true,
                autocomplete = true,
                debug = false,
                min_length = 1,
                preselect = "enabled",
                throttle_time = 80,
                source_timeout = 200,
                incomplete_delay = 400,
                max_abbr_width = 100,
                max_kind_width = 100,
                max_menu_width = 100,
                documentation = {
                    border = {'', '', '', ' ', '', '', '', ' '}, -- the border option is the same as `|help nvim_open_win|`
                    winhighlight = "NormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder",
                    max_width = 360,
                    min_width = 60,
                    max_height = math.floor(vim.o.lines * 0.3),
                    min_height = 1
                },
                source = {
                    path = true,
                    buffer = true,
                    calc = false,
                    vsnip = true,
                    nvim_lsp = true,
                    nvim_lua = true,
                    spell = true,
                    tags = false,
                    treesitter = false
                }
            }
        end
    }
    use 'hrsh7th/vim-vsnip' -- Allow vim to use LSP snippets
    use 'hrsh7th/vim-vsnip-integ' -- Integrations with man of the common LSP/completion libs
    use 'rafamadriz/friendly-snippets' -- Snippets collection for a set of different programming languages for faster development.

    use 'famiu/bufdelete.nvim'

    use { -- provides FZF like searching inside projects
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}},
        config = function()
            require('telescope').setup {
                defaults = {
                    sorting_strategy = "ascending",
                    layout_strategy = "horizontal",
                    file_sorter = require('telescope.sorters').get_fzy_sorter,
                    file_ignore_patterns = {},
                    generic_sorter = require('telescope.sorters').get_fzy_sorter,
                    color_devicons = true,
                    use_less = true,
                    mappings = {i = {["jk"] = require('telescope.actions').close}, n = {["jk"] = require('telescope.actions').close}}
                },
                pickers = {
                    autocommands = {previewer = false},
                    git_files = {previewer = false, theme = "dropdown"},
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
                        sort_lastused = true,
                        mappings = {
                            i = {["<c-d>"] = require("telescope.actions").delete_buffer},
                            n = {["<c-d>"] = require("telescope.actions").delete_buffer}
                        }
                    },
                    git_branches = {layout_strategy = "horizontal", sort_lastused = true, mappings = {i = {}}},
                    git_bcommits = {layout_strategy = "horizontal"},
                    git_commits = {layout_strategy = "horizontal"},
                    current_buffer_fuzzy_find = {previewer = false, layout_strategy = "vertical"}
                }
            }
        end
    }
    use {
        'kyazdani42/nvim-tree.lua', -- NERDTree like file-explorer written in Lua
        requires = 'kyazdani42/nvim-web-devicons'
    }

    use {
        'glepnir/lspsaga.nvim',
        config = function() -- Looks cool, provides a UI for Vim LSP
            require('lspsaga').init_lsp_saga()
        end
    }

    use 'ray-x/lsp_signature.nvim' -- Show function signature when you type

    use {'rrethy/vim-hexokinase', run = 'make hexokinase'} -- Render color vaules in the sidebar

    use {
        'lewis6991/gitsigns.nvim',
        requires = { -- Super fast git decorations implemented purely in lua/teal.
            'nvim-lua/plenary.nvim'
        },
        config = function()
            require('gitsigns').setup({
                attach_to_untracked = false,
                current_line_blame = true,
                current_line_blame_position = 'eol',
                keymaps = {
                    noremap = true,

                    ['n ]h'] = {expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
                    ['n [h'] = {expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},

                    ['n <leader>gp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
                    ['n <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
                    ['n <leader>gR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
                    ['n <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
                    ['n <leader>gS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
                    ['n <leader>gu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
                    ['n <leader>gU'] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',

                    ['v <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
                    ['v <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',

                    ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
                    ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>'
                }
            })
        end
    }

    use {
        'akinsho/nvim-bufferline.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() -- Buffer line written in Lua, works with Dracula.nvim
            require("bufferline").setup {
                diagnostics = "nvim_lsp",
                mappings = true,
                tab_size = 36,
                max_name_length = 24,
                max_prefix_length = 21, -- prefix used when a buffer is de-duplicated
                diagnostics_indicator = function(count, level, _, _)
                    local icon = level:match("error") and " " or " "
                    return " " .. icon .. count
                end,
                offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "right"}}
            }
        end
    }

    use {
        'hoob3rt/lualine.nvim',
        config = function() -- A blazing fast and easy to configure neovim statusline written in pure lua.
            require('lualine').setup {options = {theme = 'dracula-nvim'}}
        end
    }

    use {
        'nvim-treesitter/nvim-treesitter', -- The goal of nvim-treesitter is both to provide a simple and easy way to use the interface for tree-sitter in Neovim
        run = ':TSUpdate',
        config = function()
            require("nvim-treesitter.configs").setup {
                ensure_installed = {
                    'bash', 'css', 'dockerfile', 'elixir', 'erlang', 'go', 'graphql', 'html', 'javascript', 'jsdoc', 'json', 'jsonc', 'lua', 'python',
                    'query', 'regex', 'ruby', 'scala', 'scss', 'toml', 'typescript', 'tsx', 'yaml'
                },
                highlight = {enable = true},
                indent = {enable = true}
            }
        end
    }

    use {
        "folke/which-key.nvim",
        config = function()
            local which_key = require("which-key")

            which_key.setup()

            which_key.register({
                ["<leader>"] = {
                    b = {
                        name = "Buffers",
                        l = {"List open buffers for search"},
                        c = {"Close all other buffers"},
                        d = {"Close buffer"},
                        s = {"Save file"}
                    },
                    f = {name = "Files", f = {"Find files"}, r = {"Recent files"}, l = {"List files"}, s = {"Save file"}},
                    g = {
                        name = "Git",
                        b = {"List branches for searching"},
                        c = {"List commits for current buffer for searching"},
                        C = {"List all commits for searching"},
                        p = {"Preview hunk"},
                        r = {"Reset hunk"},
                        R = {"Reset buffer"},
                        s = {"Stage hunk"},
                        S = {"Stage buffer"},
                        u = {"Unstage hunk"},
                        U = {"Unstage buffer"}
                    },
                    l = {
                        a = {"Show available code actions"},
                        d = {"Show definition preview"},
                        D = {"Show type definition"},
                        e = {"Show diagnostics for cursor"},
                        E = {"Show diagnostics for line"},
                        f = {"Search LSP document symbols"},
                        ["gd"] = {"Go to definition of symbol"},
                        h = {"Show hover documentation"},
                        i = {"Go to implementation"},
                        r = {"Rename symbol under cursor"},
                        s = {"Search document symbols"},
                        S = {"Search workspace symbols"}
                    },
                    q = {q = {"Quit vim"}, Q = {"Quit vim without save"}},
                    s = {
                        ["/"] = {"Fuzzy search current workspace"},
                        ["<leader>"] = {"Fuzzy search Vim commands"},
                        b = {"Fuzzy search current buffer"},
                        c = {"Remove search results highlighting"},
                        h = {"Fuzzy search help tags"},
                        H = {"Highlight search results"},
                        m = {"Fuzzy search man pages"},
                        r = {"Fuzzy search registers"}
                    },
                    t = {
                        name = "Tests",
                        n = {"Run nearest test"},
                        f = {"Run all tests for file"},
                        o = {"Show output for current test"},
                        c = {"Clear all test runs"},
                        S = {"Stop executing current test command"},
                        s = {"Show test summary"}
                    },
                    w = {
                        name = "Windows",
                        v = {"Open vertical window split"},
                        s = {"Open horizontal window split"},
                        d = {"Close current window"},
                        D = {"Force close of current window"},
                        c = {"Close all other windows"},
                        ["="] = {"Equalize window sizes"}
                    },
                    x = {name = "Text", j = {"Join text object"}, s = {"Split text object"}}
                },
                ["]"] = {b = {"Next buffer"}, h = {"Next hunk"}, e = {"Next diagnostic"}, t = {"Next test failure"}},
                ["["] = {b = {"Previous buffer"}, h = {"Previous hunk"}, e = {"Previous diagnostic"}, t = {"Previous test failure"}}
            })
        end
    }
end)

g.mapleader = ";"
g.completion_enable_snippet = "vim-vsnip"

g.nvim_tree_side = 'right'
g.nvim_tree_width = 40
g.nvim_tree_ignore = {'.git', 'node_modules', '.cache'}
g.nvim_tree_gitignore = 1
g.nvim_tree_auto_open = 0
g.nvim_tree_auto_close = 1

g.ultest_use_pty = 1
g.ultest_virtual_text = 1
g.ultest_max_threads = 4
g.ultest_output_on_line = 0

g.splitjoin_split_mapping = ''
g.splitjoin_join_mapping = ''

g.bufonly_delete_cmd = 'Bwipeout'

cmd [[ let g:test#javascript#lab#options = "--verbose --leaks --transform ./node_modules/lab-transform-typescript"]]
cmd [[ let g:test#javascript#lab#file_pattern = '\vtest/.*\.ts$' ]]

cmd [[colorscheme dracula]]

local nnoremap = require("motch.utils").nnoremap
local inoremap = require("motch.utils").inoremap
local vnoremap = require("motch.utils").vnoremap
local xnoremap = require("motch.utils").xnoremap

inoremap('jk', '<Esc>') -- Map escape to "jk"

xnoremap('>', '>gv')
xnoremap('<', '<gv')

nnoremap('<Leader>ff', ":Telescope git_files<CR>")
nnoremap('<Leader>fl', ':NvimTreeToggle<CR>')
nnoremap('<Leader>fr', ":Telescope oldfiles<CR>")
nnoremap('<Leader>fs', ":w<CR>")

nnoremap('<leader>bc', ':BufOnly<CR>')
nnoremap('<leader>bd', ':Bdelete<CR>')
nnoremap('<leader>bl', ':Telescope buffers<CR>')

nnoremap('<leader>w=', '<C-W>=')
nnoremap('<leader>wc', ':only<CR>')
nnoremap('<leader>wd', ':q<CR>')
nnoremap('<leader>wD', ':q!<CR>')
nnoremap('<leader>wm', ':only<CR>')
nnoremap('<leader>ws', ':split<CR>')
nnoremap('<leader>wv', ':vsplit<CR>')

nnoremap('<leader>gb', ':Telescope git_branches<CR>')
nnoremap('<leader>gc', ':Telescope git_bcommits<CR>')
nnoremap('<leader>gC', ':Telescope git_commits<CR>')

inoremap('<C-i>', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>')

inoremap('<C-Space>', 'compe#complete()', {expr = true})
inoremap('<CR>', 'compe#confirm("<CR>")', {expr = true})
inoremap('<C-d>', 'compe#scroll({ "delta": -4 }', {expr = true})
inoremap('<C-e>', 'compe#close("<C-e>")', {expr = true})
inoremap('<C-f>', 'compe#scroll({ "delta": +4 }', {expr = true})

nnoremap('<leader>la', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>')
nnoremap('<leader>ld', '<cmd>lua require("lspsaga.provider").preview_definition()<CR>')
nnoremap('<leader>lgd', '<cmd>lua vim.lsp.buf.definition()<CR>')
nnoremap('<leader>lD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
nnoremap('<leader>le', '<cmd>lua require("lspsaga.diagnostic").show_cursor_diagnostics()<CR>')
nnoremap('<leader>lE', '<cmd>lua require("lspsaga.diagnostic").show_line_diagnostics()<CR>')
nnoremap('<leader>lf', '<cmd>lua require("lspsaga.provider").lsp_finder()<CR>')
nnoremap('<leader>lh', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>')
nnoremap('<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>')
nnoremap('<leader>lr', '<cmd>lua require("lspsaga.rename").rename()<CR>')
nnoremap('<leader>ls', '<cmd>lua require("telescope.builtin").lsp_document_symbols{}<CR>')
nnoremap('<leader>lS', '<cmd>lua require("telescope.builtin").lsp_workspace_symbols{}<CR>')

nnoremap('<C-j>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(1)<CR>')
nnoremap('<C-k>', '<cmd>lua require("lspsaga.action").smart_scroll_with_saga(-1)<CR>')

vnoremap('<leader>la', ':<C-U>lua require("lspsaga.codeaction").range_code_action()<CR>')

nnoremap('<leader>qq', ':qa<CR>')
nnoremap('<leader>QQ', ':qall!<CR>')

nnoremap('<leader>s/', ":Telescope live_grep<CR>")
nnoremap('<leader>sb', ":Telescope current_buffer_fuzzy_find<CR>")
nnoremap('<leader>sc', ':nohlsearch<CR>')
nnoremap('<leader>sH', ':set hlsearch<CR>')
nnoremap('<leader>sh', ':Telescope help_tags<CR>')
nnoremap('<leader>sm', ':Telescope man_pages<CR>')
nnoremap('<leader>s<leader>', ':Telescope commands<CR>')
nnoremap('<leader>sr', ':Telescope registers<CR>')

nnoremap('<leader>tc', ':UltestClear<CR>')
nnoremap('<leader>tf', ':Ultest<CR>')
nnoremap('<leader>tn', ':UltestNearest<CR>')
nnoremap('<leader>to', ':UltestOutput<CR>')
nnoremap('<leader>ts', ':UltestSummary<CR>')
nnoremap('<leader>tS', ':UltestStop<CR>')

nnoremap('<leader>xj', ':SplitjoinJoin<CR>')
nnoremap('<leader>xs', ':SplitjoinSplit<CR>')

nnoremap(']b', ':BufferLineCycleNext<CR>')
nnoremap(']e', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>')
nnoremap(']t', '<Plug>(ultest-next-fail)')
nnoremap('[b', ':BufferLineCycleNext<CR>')
nnoremap('[e', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>')
nnoremap('[t', '<Plug>(ultest-prev-fail)')

local showRecentFilesFinder = vim.api.nvim_eval("@%") == "" or vim.api.nvim_eval("filereadable(@%)") == 0

if showRecentFilesFinder then
    cmd("command! ShowRecentFiles lua require('telescope.builtin').oldfiles({})")

    vim.api.nvim_exec("autocmd VimEnter * ShowRecentFiles", false)
end

-- Replace the following with the path to your installation
require("motch.lsp")
