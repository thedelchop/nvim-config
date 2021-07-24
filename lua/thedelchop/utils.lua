D = {}

if pcall(require, 'plenary') then
    RELOAD = require('plenary.reload').reload_module

    R = function(name)
        RELOAD(name)
        return require(name)
    end
end

D.augroup = function(name, callback)
    vim.cmd("augroup " .. name)
    vim.cmd("autocmd!")
    callback(function(cmd)
        vim.cmd("autocmd " .. cmd)
    end)
    vim.cmd("augroup END")
end

local scopes = {o = vim.o, b = vim.bo, w = vim.wo, g = vim.g}

local set_opt = function(scope, key, value)
    scopes[scope][key] = value
    if scope ~= "o" and scope ~= "g" then scopes["o"][key] = value end
end

D.opt = {
    o = function(key, value)
        set_opt("o", key, value)
    end,
    b = function(key, value)
        set_opt("b", key, value)
    end,
    w = function(key, value)
        set_opt("w", key, value)
    end,
    g = function(key, value)
        set_opt("g", key, value)
    end
}

D.nnoremap = function(from, to, opts)
    opts = vim.tbl_extend("force", {noremap = true, silent = true}, opts or {})
    vim.api.nvim_set_keymap("n", from, to, opts)
end

D.imap = function(from, to, opts)
    vim.api.nvim_set_keymap("i", from, to, opts or {})
end

D.inoremap = function(from, to, opts)
    opts = vim.tbl_extend("force", {noremap = true, silent = true}, opts or {})
    vim.api.nvim_set_keymap("i", from, to, opts)
end

D.vnoremap = function(from, to, opts)
    opts = vim.tbl_extend("force", {noremap = true, silent = true}, opts or {})
    vim.api.nvim_set_keymap("v", from, to, opts)
end

D.xnoremap = function(from, to, opts)
    opts = vim.tbl_extend("force", {noremap = true, silent = true}, opts or {})
    vim.api.nvim_set_keymap("x", from, to, opts)
end

D.tnoremap = function(from, to, opts)
    opts = vim.tbl_extend("force", {noremap = true, silent = true}, opts or {})
    vim.api.nvim_set_keymap("t", from, to, opts)
end

D.smap = function(from, to, opts)
    vim.api.nvim_set_keymap("s", from, to, opts or {})
end

return D
