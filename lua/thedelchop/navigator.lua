return function()
  local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp
    .protocol
    .make_client_capabilities())

  local servers = { "cssls", "dockerls", "elixirls", "graphql", "html", "jsonls", "yamlls" }

  require('navigator').setup({
    lsp_signature_help = true,
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
      format_options = { async = true },
      disable_format_cap = { "elixirls", "cssls", "dockerls", "graphql", "html", "jsonls", "yamlls", "tsserver" },
      disply_diagnostic_qf = false,
      elixirls = { capabilities = capabilities },
      cssls = { capabilities = capabilities },
      dockerls = { capabilities = capabilities },
      graphql = { capabilities = capabilities },
      html = { capabilities = capabilities },
      jsonls = { capabilities = capabilities },
      yamlls = { capabilities = capabilities },
      tsserver = { capabilities = capabilities },
      sumneko_lua = {
        settings = {
          Lua = {
            runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = "LuaJIT",
              -- Setup your lua path
              path = vim.split(package.path, ";")
            },
            diagnostics = {
              enable = true,
              -- Get the language server to recognize the `vim` global
              globals = { "vim", "describe", "it", "before_each", "after_each", "teardown", "pending", "use", "use_rocks" }
            },
          }
        }
      },
      servers = servers,
    }
  })
end
