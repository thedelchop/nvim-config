local nnoremap = require("thedelchop.utils").nnoremap
local inoremap = require("thedelchop.utils").inoremap
local vnoremap = require("thedelchop.utils").vnoremap
local xnoremap = require("thedelchop.utils").xnoremap
local augroup = require("thedelchop.utils").augroup

inoremap('jk', '<Esc>') -- Map escape to "jk"

xnoremap('>', '>gv')
xnoremap('<', '<gv')

nnoremap('<Leader>p', '<cmd>lua require("thedelchop.utils").togglepaste()<CR>')

nnoremap('<leader>bc', '<cmd>lua require("close_buffers").delete({type = "hidden"})<CR>')
nnoremap('<leader>bd', '<cmd>lua require("close_buffers").delete({type = "this"})<CR>')
nnoremap('<leader>be', '<cmd>lua require("close_buffers").delete({type = "nameless"})<CR>')
nnoremap('<leader>bl', "<cmd>lua require('telescope.builtin').buffers()<CR>")

nnoremap('<Leader>do', ":DiffviewOpen -uno<CR>")
nnoremap('<Leader>dO', ":DiffviewOpen -uno --selected-file{%}<CR>")
nnoremap('<Leader>dh', ":DiffviewFileHistory<CR>")
nnoremap('<Leader>dH', ":DiffviewFileHistory %<CR>")
nnoremap('<Leader>dc', ":DiffviewClose<CR>")
nnoremap('<Leader>dt', ":DiffviewToggleFiles<CR>")
nnoremap('<Leader>df', ":DiffviewFocusFiles<CR>")
nnoremap('<Leader>dr', ":DiffviewRefresh<CR>")

nnoremap('<Leader>ff', "<cmd>lua require('telescope.builtin').git_files()<CR>")
nnoremap('<Leader>fl', ':NvimTreeToggle<CR>')
nnoremap('<Leader>fo', ':NvimTreeFindFile<CR>')
nnoremap('<Leader>fr', "<cmd>lua require('telescope.builtin').oldfiles()<CR>")
nnoremap('<Leader>fs', ":w<CR>")

nnoremap('<leader>go', "<cmd>lua require('neogit').open({kind = 'vsplit'})<CR>")
nnoremap('<leader>gc', "<cmd>lua require('neogit').open({'commit', kind = 'split'})<CR>")

nnoremap('<leader>la', '<cmd>lua vim.lsp.buf.code_action()CR>')
nnoremap('<leader>ld', '<cmd>lua vim.lsp.buf.definition()<CR>')
nnoremap('<leader>lD', '<cmd>lua vim.lsp.buf.type_definition()<CR>')
nnoremap('<leader>le', "<cmd>lua vim.diagnostic.open_float()<CR>")
nnoremap('<leader>lE', '<cmd>lua vim.diagnostic.get(0, nil )<CR>')
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

nnoremap('<leader>tc', '<cmd>lua require("neotest").summary.clear_marked()<CR>')
nnoremap('<leader>tf', '<cmd>lua require("neotest").run.run(vim.fn.expand("%"))<CR>')
nnoremap('<leader>tn', '<cmd>lua require("neotest").run.run()<CR>')
nnoremap('<leader>to', '<cmd>lua require("neotest").output_panel.toggle()<CR>')
nnoremap('<leader>tO', '<cmd>lua require("neotest").output.open({enter = true, autoclose = true})<CR>')
nnoremap('<leader>ts', '<cmd>lua require("neotest").summary.toggle()<CR>')
nnoremap('<leader>tS', '<cmd>lua require("neotest").run.stop()<CR>')

nnoremap('<leader>xj', ':SplitjoinJoin<CR>')
nnoremap('<leader>xs', ':SplitjoinSplit<CR>')

nnoremap('<leader>w=', '<C-W>=')
nnoremap('<leader>wc', ':only<CR>')
nnoremap('<leader>wd', ':q<CR>')
nnoremap('<leader>wD', ':q!<CR>')
nnoremap('<leader>wm', ':only<CR>')
nnoremap('<leader>ws', ':split<CR>')
nnoremap('<leader>wv', ':vsplit<CR>')

nnoremap(']b', ':BufferLineCycleNext<CR>')
nnoremap('[b', ':BufferLineCyclePrev<CR>')

nnoremap(']t', '<cmd>lua require("neotest").jump.next({ status = "failed" })<CR>')
nnoremap('[t', '<cmd>lua require("neotest").jump.prev({ status = "failed" })<CR>')

nnoremap(']e', '<cmd>lua vim.diagnostic.goto_next()<CR>')
nnoremap('[e', '<cmd>lua vim.diagnostic.goto_prev()<CR>')

-- inoremap('<C-i>', '<cmd>lua vim.lsp.buf.signature_help()<CR>')

augroup("JsonSearch", function(autocmd)
  autocmd [[ FileType json nnoremap <buffer> <leader>ll :JqxList<CR> ]]
  autocmd [[FileType json nnoremap <buffer> <leader>ls :JqxQuery<CR>]]
end)
