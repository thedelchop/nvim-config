return function()
    require("nvim-treesitter.configs").setup {
        ensure_installed = {
            'bash', 'css', 'dockerfile', 'elixir', 'erlang', 'go', 'graphql', 'html', 'javascript', 'jsdoc', 'json', 'jsonc', 'lua', 'python',
            'query', 'regex', 'ruby', 'scala', 'scss', 'toml', 'typescript', 'tsx', 'yaml'
        },
        highlight = {enable = true},
        indent = {enable = true}
    }
end
