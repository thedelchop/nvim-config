return function()
  require("nvim-treesitter.configs").setup {
    autotag = { enable = true },
    ensure_installed = {
      'bash', 'css', 'dockerfile', 'elixir', 'erlang', 'go', 'graphql', 'heex', 'html', 'javascript', 'jsdoc', 'json',
      'jsonc', 'lua', 'python', 'query', 'regex', 'ruby', 'scss', 'surface', 'toml', 'typescript', 'tsx', 'yaml',
      'vim'
    },
    highlight = { enable = true },
    indent = { enable = true }
  }
end
