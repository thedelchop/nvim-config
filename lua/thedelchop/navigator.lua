return function()
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp
    .protocol
    .make_client_capabilities())

  local servers = { "cssls", "dockerls", "elixirls", "graphql", "html", "jsonls", "yamlls" }

  require('navigator').setup({
    lsp_signature_help = false,
    on_attach = function()
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
      format_options = { async = false },
      disable_format_cap = { "elixirls", "cssls", "dockerls", "graphql", "html", "jsonls", "yamlls", "tsserver" },
      disply_diagnostic_qf = false,
      elixirls = { filetype = { "elixir", "heex" }, capabilities = capabilities },
      cssls = { capabilities = capabilities },
      dockerls = { capabilities = capabilities },
      graphql = { capabilities = capabilities },
      html = { capabilities = capabilities },
      jsonls = { capabilities = capabilities },
      yamlls = { capabilities = capabilities },
      tsserver = { capabilities = capabilities },
      servers = servers,
    }
  })
end
