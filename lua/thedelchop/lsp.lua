local lspconfig = require("lspconfig")
local augroup = require("thedelchop.utils").augroup

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local on_attach = function(client, _)

    vim.cmd [[imap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]
    vim.cmd [[smap <expr> <C-l> vsnip#available(1) ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>']]

    vim.cmd [[imap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']]
    vim.cmd [[smap <expr> <Tab> vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<Tab>']]
    vim.cmd [[imap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']]
    vim.cmd [[smap <expr> <S-Tab> vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<S-Tab>']]

    vim.cmd [[inoremap <silent><expr> <C-Space> compe#complete()]]
    -- vim.cmd [[inoremap <silent><expr> <CR> compe#confirm('<CR>')]]
    vim.cmd [[inoremap <silent><expr> <C-e> compe#close('<C-e>')]]
    vim.cmd [[inoremap <silent><expr> <C-f> compe#scroll({ 'delta': +4 })]]
    vim.cmd [[inoremap <silent><expr> <C-d> compe#scroll({ 'delta': -4 })]]

    vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting_sync(nil, 1000)")

    require"lsp_signature".on_attach({
        bind = true,
        fix_pos = true,
        use_lspsaga = false,
        handler_opts = {
            border = "shadow" -- double, single, shadow, none
        }
    })

    if client.resolved_capabilities.document_formatting then
      augroup('LspAutocommands', function(autocmd)
        autocmd [[ BufWritePre <buffer> LspFormatting ]]
      end)
    end
end

local setup = function(name, opts)
    lspconfig[name].setup(vim.tbl_extend("keep", {
        log_level = vim.lsp.protocol.MessageType.Log,
        message_level = vim.lsp.protocol.MessageType.Log,
        capabilities = capabilities,
        on_attach = on_attach
    }, opts))
end

vim.lsp.set_log_level(0)

local path_to_elixirls = vim.fn.expand("~/.local/share/elixir-ls/language_server.sh")
local path_to_lua_ls = vim.fn.expand("~/.local/share/lua-language-server")
local path_to_lua_ls_binary = path_to_lua_ls .. "/bin/macOS/lua-language-server"
local path_to_lua_ls_main = path_to_lua_ls .. "/main.lua"

setup("sumneko_lua", {
    cmd = {path_to_lua_ls_binary, "-E", path_to_lua_ls_main},
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = 'LuaJIT',
                -- Setup your lua path
                path = vim.split(package.path, ';')
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = {'vim', 'use'}
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
            }
        }
    }
})

setup("elixirls", {settings = {elixirLS = {dialyzerEnabled = false, fetchDeps = false}}, cmd = {path_to_elixirls}})

lspconfig.tsserver.setup({
    log_level = vim.lsp.protocol.MessageType.Log,
    message_level = vim.lsp.protocol.MessageType.Log,
    capabilities = capabilities,
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
        on_attach(client)
    end
})

local eslint = {
    lintCommand = "eslint_d -f unix --stdin --stdin-filename ${INPUT}",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %m"},
    lintIgnoreExitCode = true,
    formatCommand = "eslint_d --fix-to-stdout --stdin --stdin-filename=${INPUT}",
    formatStdin = true,
    rootMarkers = {".eslintrc", ".eslintrc.js", ".eslintrc.json", "package.json"}
}

local credo = {
    lintCommand = "mix credo suggest --format=flycheck --read-from-stdin ${INPUT}",
    lintStdin = true,
    lintFormats = {"%f:%l:%c: %t: %m", "%f:%l: %t: %m"},
    rootMarkers = {"mix.lock", "mix.exs"}
}

lspconfig.efm.setup({
    filetypes = {"elixir", "lua", "javascript", "javascriptreact", "typescript", "typescriptreact"},
    log_level = vim.lsp.protocol.MessageType.Log,
    message_level = vim.lsp.protocol.MessageType.Log,
    capabilities = capabilities,
    settings = {
        languages = {
            elixir = {credo},
            javascript = {eslint},
            javascriptreact = {eslint},
            ["javascript.jsx"] = {eslint},
            typescript = {eslint},
            ["typescript.tsx"] = {eslint},
            typescriptreact = {eslint}
        }
    },
    on_attach = function(client, bufnr)
        local filetype = vim.api.nvim_buf_get_option(bufnr, 'filetype')

        if filetype == "elixir" then client.resolved_capabilities.document_formatting = false end
        client.resolved_capabilities.goto_definition = false

        on_attach(client)
    end
})

setup("solargraph", {})
setup("vimls", {})

