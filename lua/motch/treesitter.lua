require("nvim-treesitter.configs").setup {
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.typescript.used_by = "typescriptreact"
