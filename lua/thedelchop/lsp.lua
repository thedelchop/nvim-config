local lspconfig = require("lspconfig")

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

    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_exec([[
      augroup LspAutocommands
          autocmd! * <buffer>
          autocmd BufWritePre <buffer> LspFormatting
      augroup END
      ]], true)
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

local path_to_elixirls = vim.fn.expand("~/.local/share/elixir-ls/rel/language_server.sh")
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

lspconfig.efm.setup({
    filetypes = {"elixir", "lua", "javascript", "javascriptreact", "typescript", "typescriptreact"},
    log_level = vim.lsp.protocol.MessageType.Log,
    message_level = vim.lsp.protocol.MessageType.Log,
    capabilities = capabilities,
    on_attach = function(client)
        if client.name == "elixir" then client.resolved_capabilities.document_formatting = false end
        client.resolved_capabilities.goto_definition = false
        on_attach(client)
    end
})

setup("solargraph", {})
setup("vimls", {})
