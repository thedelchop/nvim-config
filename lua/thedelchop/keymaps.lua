local nnoremap = require("thedelchop.utils").nnoremap
local inoremap = require("thedelchop.utils").inoremap
local vnoremap = require("thedelchop.utils").vnoremap
local xnoremap = require("thedelchop.utils").xnoremap
local augroup = require("thedelchop.utils").augroup

inoremap('jk', '<Esc>') -- Map escape to "jk"

xnoremap('>', '>gv')
xnoremap('<', '<gv')

nnoremap('<Leader>p', '<cmd>lua require("thedelchop.utils").togglepaste()<CR>')

nnoremap('<Leader>ff', "<cmd>lua require('telescope.builtin').git_files()<CR>")
nnoremap('<Leader>fl', ':NvimTreeToggle<CR>')
nnoremap('<Leader>fo', ':NvimTreeFindFile<CR>')
nnoremap('<Leader>fr', "<cmd>lua require('telescope.builtin').oldfiles()<CR>")
nnoremap('<Leader>fs', ":w<CR>")

nnoremap('<leader>bc', '<cmd>lua require("close_buffers").delete({type = "hidden"})<CR>')
nnoremap('<leader>bd', '<cmd>lua require("close_buffers").delete({type = "this"})<CR>')
nnoremap('<leader>be', '<cmd>lua require("close_buffers").delete({type = "nameless"})<CR>')
nnoremap('<leader>bl', "<cmd>lua require('telescope.builtin').buffers()<CR>")

nnoremap('<leader>w=', '<C-W>=')
nnoremap('<leader>wc', ':only<CR>')
nnoremap('<leader>wd', ':q<CR>')
nnoremap('<leader>wD', ':q!<CR>')
nnoremap('<leader>wm', ':only<CR>')
nnoremap('<leader>ws', ':split<CR>')
nnoremap('<leader>wv', ':vsplit<CR>')

nnoremap('<leader>gb', "<cmd>lua require('telescope.builtin').git_branches()<CR>")
nnoremap('<leader>gc', "<cmd>lua require('telescope.builtin').git_bcommits()<CR>")
nnoremap('<leader>gC', "<cmd>lua require('telescope.builtin').git_commits()<CR>")

inoremap('<C-i>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')

inoremap('<C-d>', 'compe#scroll({ "delta": -4 }', {expr = true})
inoremap('<C-e>', 'compe#close("<C-e>")', {expr = true})
inoremap('<C-f>', 'compe#scroll({ "delta": +4 }', {expr = true})

nnoremap('<leader>la', '<cmd>lua vim.lsp.buf.code_action()CR>')
nnoremap('<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>')
nnoremap('<leader>lD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
nnoremap('<leader>le', '<cmd>lua vim.lsp.diagnostic.show_position_diagnostics()<CR>')
nnoremap('<leader>lE', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>')
nnoremap('<leader>lf', '<cmd>lua vim.lsp.buf.formatting()<CR>')
nnoremap('<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>')
nnoremap('<leader>ll', '<cmd>lua vim.lsp.codelens.display()<CR>')
nnoremap('<leader>li', '<cmd>lua vim.lsp.buf.implementation()<CR>')
nnoremap('<leader>lr', '<cmd>lua vim.lsp.buf.references()<CR>')
nnoremap('<leader>lR', '<cmd>lua vim.lsp.buf.rename()<CR>')
nnoremap('<leader>ls', ':LspStart<CR>')
nnoremap('<leader>lS', '<cmd>lua require("telescope.builtin").lsp_workspace_symbols{}<CR>')
nnoremap('<leader>lx', ':LspStop<CR>')

vnoremap('<leader>la', ':<C-U>lua vim.lsp.buf.range_code_action()<CR>')
vnoremap('<leader>lf', ':<C-U>lua vim.lsp.buf.range_formatting()<CR>')

nnoremap('<leader>qq', ':qa<CR>')
nnoremap('<leader>QQ', ':qall!<CR>')

nnoremap('<leader>s/', "<cmd>lua require('telescope.builtin').live_grep()<CR>")
nnoremap('<leader>sb', "<cmd>lua require('telescope.builtin').current_buffer_fuzzy_find()<CR>")
nnoremap('<leader>sc', ':nohlsearch<CR>')
nnoremap('<leader>sC', ':nohlsearch<CR>')
nnoremap('<Leader>sf', "<cmd>lua require('telescope.builtin').git_files()<CR>")
nnoremap('<leader>sh', "<cmd>lua require('telescope.builtin').help_tags()<CR>")
nnoremap('<leader>sm', "<cmd>lua require('telescope.builtin').man_pages()<CR>")
nnoremap('<leader>s<leader>', "<cmd>lua require('telescope.builtin').commands()<CR>")
nnoremap('<leader>sr', "<cmd>lua require('telescope.builtin').resume()<CR>")

nnoremap('<leader>tc', ':UltestClear<CR>')
nnoremap('<leader>tf', ':Ultest<CR>')
nnoremap('<leader>tn', ':UltestNearest<CR>')
nnoremap('<leader>to', ':UltestOutput<CR>')
nnoremap('<leader>ts', ':UltestSummary<CR>')
nnoremap('<leader>tS', ':UltestStop<CR>')

nnoremap('<leader>xj', ':SplitjoinJoin<CR>')
nnoremap('<leader>xs', ':SplitjoinSplit<CR>')

nnoremap(']b', ':BufferLineCycleNext<CR>')
nnoremap('[b', ':BufferLineCyclePrev<CR>')

nnoremap(']t', '<Plug>(ultest-next-fail)')
nnoremap('[t', '<Plug>(ultest-prev-fail)')

nnoremap(']e', '<cmd>lua vim.diagnostic.goto_next()<CR>')
nnoremap('[e', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

augroup("JsonSearch", function(autocmd)
  autocmd [[ FileType json nnoremap <buffer> <leader>ll :JqxList<CR> ]]
  autocmd [[FileType json nnoremap <buffer> <leader>ls :JqxQuery<CR>]]
end)
