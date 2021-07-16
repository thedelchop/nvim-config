local lspconfig = require("lspconfig")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local has_run = {}

local on_attach = function(client, bufnr)

  vim.cmd [[imap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]
  vim.cmd [[smap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]

  vim.cmd [[imap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']]
  vim.cmd [[smap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']]
  vim.cmd [[imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']]
  vim.cmd [[smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']]

  vim.cmd [[inoremap <silent><expr> <C-Space> compe#complete()]]
  vim.cmd [[inoremap <silent><expr> <CR> compe#confirm('<CR>')]]
  vim.cmd [[inoremap <silent><expr> <C-e> compe#close('<C-e>')]]
  vim.cmd [[inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })]]
  vim.cmd [[inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })]]

  vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")

 	if client.resolved_capabilities.document_formatting then
    vim.api.nvim_exec([[
      augroup LspAutocommands
          autocmd! * <buffer>
          autocmd BufWritePost <buffer> LspFormatting
      augroup END
      ]], true)
  end
end

local setup = function(name, opts)
  lspconfig[name].setup(
    vim.tbl_extend(
      "keep",
      {
        log_level = vim.lsp.protocol.MessageType.Log,
        message_level = vim.lsp.protocol.MessageType.Log,
        capabilities = capabilities,
        on_attach = on_attach
      },
      opts
    )
  )
end

vim.lsp.set_log_level(0)


local path_to_elixirls = vim.fn.expand("~/.local/share/elixir-ls/rel/language_server.sh")

setup(
  "elixirls",
  {
    settings = {
      elixirLS = {
        dialyzerEnabled = false,
        fetchDeps = false
      }
    },
    cmd = {path_to_elixirls}
  }
)

local eslint = {
    lintCommand = 'eslint_d -f unix --stdin --stdin-filename ${INPUT}',
    lintIgnoreExitCode = true,
    lintStdin = true,
    lintFormats = { '%f:%l:%c: %m' },
    formatCommand = 'eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}',
    formatStdin = true,
}

local stylua = { formatCommand = 'stylua -s -', formatStdin = true }

local format_config = {
    javascript = { eslint },
    javascriptreact = { eslint },
    json = { eslint },
    lua = { stylua },
    typescript = { eslint },
    typescriptreact = { eslint }
}

setup(
  "efm",
  {
    filetypes = {
      "elixir",
      "javascript",
      "javascriptreact",
      "json",
      "typescript",
      "typescriptreact",
      "lua"
    },
    settings = {
      languages = format_config
    }
  }
)

setup("tsserver", {
  on_attach = function(client)
    client.resolved_capabilities.document_formatting = false
    on_attach(client)
  end
})

setup("solargraph", {})
setup("vimls", {})

