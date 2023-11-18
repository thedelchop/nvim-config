return function()
  require('gitsigns').setup({
    attach_to_untracked = false,
    current_line_blame = true,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol',
      delay = 500
    },
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      map('n', ']h', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, { expr = true })

      map('n', '[h', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, { expr = true })


      map('n', '<leader>gp', gs.preview_hunk)
      map('n', '<leader>gr', gs.reset_hunk)
      map('n', '<leader>gR', gs.reset_buffer)
      map('n', '<leader>gs', gs.stage_hunk)
      map('n', '<leader>gS', gs.stage_buffer)
      map('n', '<leader>gu', gs.undo_stage_hunk)

      map('v', '<leader>gr', function() gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") }) end)
      map('v', '<leader>gs', function() gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") }) end)
      map('o', 'ih', gs.select_hunk)
      map('x', 'ih', gs.select_hunk)
    end
  })
end
