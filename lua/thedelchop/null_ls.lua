local null_ls = require("null-ls")

local builtins = null_ls.builtins

null_ls.setup({
  debug = false,
  diagnostics_format = "[#{c}](#{s}) #{m}",
  log = { enable = true, level = "warn", use_console = "false" },
  sources = {
    builtins.diagnostics.credo,
    builtins.diagnostics.eslint_d,
    builtins.formatting.eslint_d,
    builtins.formatting.mix,
    builtins.formatting.prettierd,
    builtins.formatting.surface.with({ extra_filetypes = { "eelixir" } })
  },
})
