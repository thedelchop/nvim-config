return function()
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
