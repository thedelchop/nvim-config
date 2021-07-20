local nnoremap = require("thedelchop.utils").nnoremap
local inoremap = require("thedelchop.utils").inoremap
local vnoremap = require("thedelchop.utils").vnoremap
local xnoremap = require("thedelchop.utils").xnoremap

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
-- inoremap('<CR>', 'compe#confirm("<CR>")', {expr = true})
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
nnoremap('<Leader>sf', ":Telescope git_files<CR>")
nnoremap('<leader>sH', ':set hlsearch<CR>')
nnoremap('<leader>sh', ':Telescope help_tags<CR>')
nnoremap('<leader>sm', ':Telescope man_pages<CR>')
nnoremap('<leader>s<leader>', ':Telescope commands<CR>')
nnoremap('<leader>sr', ':Telescope registers<CR>')
nnoremap('<Leader>so', ":Telescope oldfiles<CR>")

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

