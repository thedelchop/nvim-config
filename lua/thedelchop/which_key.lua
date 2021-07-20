return function()
    local which_key = require("which-key")

    which_key.setup()

    which_key.register({
        ["<leader>"] = {
            b = {name = "Buffers", l = {"List open buffers for search"}, c = {"Close all other buffers"}, d = {"Close buffer"}, s = {"Save file"}},
            f = {name = "Files", f = {"Find files"}, l = {"List files"}, r = {"Recent files"},  s = {"Save file"}},
            g = {
                name = "Git",
                b = {"List branches for searching"},
                c = {"List commits for current buffer for searching"},
                C = {"List all commits for searching"},
                p = {"Preview hunk"},
                r = {"Reset hunk"},
                R = {"Reset buffer"},
                s = {"Stage hunk"},
                S = {"Stage buffer"},
                u = {"Unstage hunk"},
                U = {"Unstage buffer"}
            },
            l = {
                name = "Language Server",
                a = {"Show available code actions"},
                d = {"Show definition preview"},
                D = {"Show type definition"},
                e = {"Show diagnostics for cursor"},
                E = {"Show diagnostics for line"},
                f = {"Search LSP document symbols"},
                ["gd"] = {"Go to definition of symbol"},
                h = {"Show hover documentation"},
                i = {"Go to implementation"},
                r = {"Rename symbol under cursor"},
                s = {"Search document symbols"},
                S = {"Search workspace symbols"}
            },
            q = {q = {"Quit vim"}, Q = {"Quit vim without save"}},
            s = {
                name = "Search",
                ["/"] = {"Fuzzy search current workspace"},
                ["<leader>"] = {"Fuzzy search Vim commands"},
                b = {"Fuzzy search current buffer"},
                c = {"Remove search results highlighting"},
                f = {"Find files"},
                h = {"Fuzzy search help tags"},
                H = {"Highlight search results"},
                m = {"Fuzzy search man pages"},
                o = {"Recent files"},
                r = {"Fuzzy search registers"}
            },
            t = {
                name = "Tests",
                n = {"Run nearest test"},
                f = {"Run all tests for file"},
                o = {"Show output for current test"},
                c = {"Clear all test runs"},
                S = {"Stop executing current test command"},
                s = {"Show test summary"}
            },
            w = {
                name = "Windows",
                v = {"Open vertical window split"},
                s = {"Open horizontal window split"},
                d = {"Close current window"},
                D = {"Force close of current window"},
                c = {"Close all other windows"},
                ["="] = {"Equalize window sizes"}
            },
            x = {name = "Text", j = {"Join text object"}, s = {"Split text object"}}
        },
        ["]"] = { name = "Navigation", b = {"Next buffer"}, h = {"Next hunk"}, e = {"Next diagnostic"}, t = {"Next test failure"}},
        ["["] = { name = "Navigation", b = {"Previous buffer"}, h = {"Previous hunk"}, e = {"Previous diagnostic"}, t = {"Previous test failure"}}
    })
end
