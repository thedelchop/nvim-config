local null_ls = require("null-ls")

local builtins = null_ls.builtins

local lsp_formatting = function(client, bufnr)
  vim.lsp.buf.format({
    bufnr = bufnr,
    name = client.name
  })
end

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

local on_attach = function(client, bufnr)
  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        lsp_formatting(client, bufnr)
      end,
    })
  end
end

null_ls.setup({
  debug = true,
  diagnostics_format = "[#{c}](#{s}) #{m}",
  log_level = "debug",
  on_attach = on_attach,
  sources = {
    builtins.diagnostics.credo,
    builtins.diagnostics.eslint_d,
    builtins.formatting.eslint_d,
    builtins.formatting.prettier.with({
      filetypes = { "graphql", "json", "yaml", "markdown" }
    }),
    builtins.code_actions.eslint_d,
    builtins.formatting.mix.with({ extra_filetypes = { "heex" } }),
    builtins.formatting.surface.with({ extra_filetypes = { "eelixir" } }),
    builtins.formatting.sqlfluff.with({
      extra_args = { "--dialect", "mysql" }, -- change to your dialect
    }),
  },
})
