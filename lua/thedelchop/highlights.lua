-- Stole this from dracula.nvim, this way I can extend the color scheme for other plugins like ULTest
--
local colors = {
	bg = "#282A36",
	fg = "#F8F8F2",
	selection = "#44475A",
	comment = "#6272A4",
	red = "#FF5555",
	orange = "#FFB86C",
	yellow = "#F1FA8C",
	green = "#50fa7b",
	purple = "#BD93F9",
	cyan = "#8BE9FD",
	pink = "#FF79C6",
	bright_red = "#FF6E6E",
	bright_green = "#69FF94",
	bright_yellow = "#FFFFA5",
	bright_blue = "#D6ACFF",
	bright_magenta = "#FF92DF",
	bright_cyan = "#A4FFFF",
	bright_white = "#FFFFFF",
	menu = "#21222C",
	visual = "#3E4452",
	gutter_fg = "#4B5263",
	nontext = "#3B4048",
	white = "#ABB2BF",
	black = "#191A21"
}

vim.g.terminal_color_0 = colors.back
vim.g.terminal_color_1 = colors.red
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.yellow
vim.g.terminal_color_4 = colors.purple
vim.g.terminal_color_5 = colors.pink
vim.g.terminal_color_6 = colors.cyan
vim.g.terminal_color_7 = colors.white
vim.g.terminal_color_8 = colors.selection
vim.g.terminal_color_9 = colors.bright_red
vim.g.terminal_color_11 = colors.bright_yellow
vim.g.terminal_color_12 = colors.bright_blue
vim.g.terminal_color_13 = colors.bright_magenta
vim.g.terminal_color_14 = colors.bright_cyan
vim.g.terminal_color_15 = colors.bright_white
vim.g.terminal_color_background = colors.bg
vim.g.terminal_color_foreground = colors.fg

local highlight = function(group, fg, bg, attr, sp)
    fg = fg and "guifg=" .. fg or "guifg=NONE"
    bg = bg and "guibg=" .. bg or "guibg=NONE"
    attr = attr and "gui=" ..attr or "gui=NONE"
	sp = sp and "guisp=" .. sp or ""

    vim.api.nvim_command("highlight " .. group .. " ".. fg .. " " .. bg .. " ".. attr .. " " .. sp)
end

-- ULTest
highlight('UltestPass', colors.green, nil, nil, nil)
highlight('UltestFail', colors.red, nil, nil, nil)
highlight('UltestRunning', colors.yellow, nil, nil, nil)
highlight('UltestBorder', colors.red, nil, nil, nil)
highlight('UltestSummaryInfo', colors.cyan, nil, 'bold', nil)
highlight('UltestSummaryFile', colors.cyan, nil, 'bold', nil)
highlight('UltestSummaryNamespace', colors.cyan, nil, 'bold', nil)
