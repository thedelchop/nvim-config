return function()
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

  require('navigator').setup({
    lsp_signature_help = true,
    on_attach = function(_, _)
      vim.cmd [[imap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]
      vim.cmd [[smap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]

      vim.cmd [[imap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']]
      vim.cmd [[smap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']]
      vim.cmd [[imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']]
      vim.cmd [[smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']]
    end,
    treesitter_analysis = true,
    lsp = {
      disable_format_cap = {'sumneko_lua'},
      disply_diagnostic_qf = true,
      elixirls = {
        capabilities = capabilities
      },
      efm = {
        filetypes = {"elixir", "lua", "javascript", "javascriptreact", "typescript", "typescriptreact", "html", "yaml", "css", "markdown"},
        log_level = vim.lsp.protocol.MessageType.Log,
        message_level = vim.lsp.protocol.MessageType.Log,
        on_attach = function(client, bufnr)
          local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')

          if filetype == "elixir" then client.resolved_capabilities.document_formatting = false end
        end
      },
      servers = {'efm'}
    }
  })
end
