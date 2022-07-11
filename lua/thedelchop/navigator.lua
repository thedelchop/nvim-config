return function()
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp
    .protocol
    .make_client_capabilities())

  local servers = { "cssls", "dockerls", "elixirls", "graphql", "html", "jsonls", "yamlls" }

  require('navigator').setup({
    lsp_signature_help = true,
    on_attach = function(client, _)

     -- require "lsp-format".on_attach(client)

      vim.cmd [[imap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]
      vim.cmd [[smap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]

      vim.cmd [[imap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']]
      vim.cmd [[smap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']]
      vim.cmd [[imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']]
      vim.cmd [[smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']]
    end,
    treesitter_analysis = true,
    lsp = {
      format_on_save = true,
      disable_format_cap = { "elixirls", "cssls", "dockerls", "graphql", "html", "jsonls", "yamlls" },
      disply_diagnostic_qf = true,
      disable_lsp = { 'sumneko_lua' },
      elixirls = { capabilities = capabilities },
      cssls = { capabilities = capabilities },
      dockerls = { capabilities = capabilities },
      graphql = { capabilities = capabilities },
      html = { capabilities = capabilities },
      jsonls = { capabilities = capabilities },
      yamlls = { capabilities = capabilities },
      servers = servers,
    }
  })
end
