return function()
    require('telescope').setup {
        defaults = {
            sorting_strategy = "ascending",
            layout_strategy = "horizontal",
            file_sorter = require('telescope.sorters').get_fzy_sorter,
            file_ignore_patterns = {},
            generic_sorter = require('telescope.sorters').get_fzy_sorter,
            color_devicons = true,
            use_less = true,
            mappings = {i = {["jk"] = require('telescope.actions').close}, n = {["jk"] = require('telescope.actions').close}}
        },
        pickers = {
            autocommands = {previewer = false},
            git_files = {previewer = false, theme = "dropdown"},
            oldfiles = {
                previewer = false,
                theme = "dropdown",
                include_current_session = true,
                cwd_only = true,
                file_ignore_patterns = {'.git/', 'tmp/'},
                prompt_title = 'Recently opened files'
            },
            buffers = {
                previewer = false,
                theme = "dropdown",
                ignore_current_buffer = true,
                only_cwd = true,
                sort_lastused = true,
                mappings = {
                    i = {["<c-d>"] = require("telescope.actions").delete_buffer},
                    n = {["<c-d>"] = require("telescope.actions").delete_buffer}
                }
            },
            git_branches = {
                previewer = false,
                theme = "dropdown",
                sort_lastused = true,
                file_ignore_patterns = {'origin/'},
                layout_config = {
                  width = 94
                }
            },
            git_bcommits = {layout_strategy = "horizontal"},
            git_commits = {layout_strategy = "horizontal"},
            current_buffer_fuzzy_find = {previewer = false, layout_strategy = "vertical"}
        }
    }
end
