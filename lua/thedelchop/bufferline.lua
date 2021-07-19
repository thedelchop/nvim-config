return function()
    require("bufferline").setup {
        diagnostics = "nvim_lsp",
        mappings = true,
        tab_size = 36,
        max_name_length = 24,
        max_prefix_length = 21, -- prefix used when a buffer is de-duplicated
        diagnostics_indicator = function(count, level, _, _)
            local icon = level:match("error") and " " or " "
            return " " .. icon .. count
        end,
        offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "right"}}
    }
end
