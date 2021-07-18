-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/thedelchop/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/thedelchop/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/thedelchop/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/thedelchop/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/thedelchop/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["bufdelete.nvim"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/bufdelete.nvim"
  },
  ["dracula.nvim"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/dracula.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/friendly-snippets"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\nŠ\b\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\0035\4\a\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\fkeymaps\tn [h\1\2\1\0@&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'\texpr\2\tn ]h\1\2\1\0@&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'\texpr\2\1\0\f\17n <leader>gu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\17n <leader>gs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\17v <leader>grT<cmd>lua require\"gitsigns\".reset_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\17n <leader>gR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\17v <leader>gsT<cmd>lua require\"gitsigns\".stage_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\17n <leader>gr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\to ih2:<C-U>lua require\"gitsigns\".select_hunk()<CR>\17n <leader>gp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\tx ih2:<C-U>lua require\"gitsigns\".select_hunk()<CR>\17n <leader>gU8<cmd>lua require\"gitsigns\".reset_buffer_index()<CR>\fnoremap\2\17n <leader>gS2<cmd>lua require\"gitsigns\".stage_buffer()<CR>\1\0\3\23current_line_blame\2\24attach_to_untracked\1 current_line_blame_position\beol\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/gitsigns.nvim"
  },
  ["glow.nvim"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/glow.nvim"
  },
  ["gv.vim"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/gv.vim"
  },
  kommentary = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nb\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\17dracula-nvim\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/lualine.nvim"
  },
  ["neovim-ui"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/neovim-ui"
  },
  ["nlua.nvim"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/nlua.nvim"
  },
  ["nvim-bufferline.lua"] = {
    config = { "\27LJ\2\nW\0\4\b\0\5\0\14\18\6\1\0009\4\0\1'\a\1\0B\4\3\2\15\0\4\0X\5\2€'\4\2\0X\5\1€'\4\3\0'\5\4\0\18\6\4\0\18\a\0\0&\5\a\5L\5\2\0\6 \tï± \tïœ \nerror\nmatchÿ\1\1\0\5\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0003\3\4\0=\3\5\0024\3\3\0005\4\6\0>\4\1\3=\3\a\2B\0\2\1K\0\1\0\foffsets\1\0\3\ttext\18File Explorer\rfiletype\rNvimTree\15text_align\nright\26diagnostics_indicator\0\1\0\5\16diagnostics\rnvim_lsp\rmappings\2\22max_prefix_length\3\21\20max_name_length\3\24\rtab_size\3$\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n³\4\0\0\a\0\16\1\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0036\4\a\0009\4\b\0046\6\t\0009\6\n\0069\6\v\6\24\6\0\6B\4\2\2=\4\f\3=\3\r\0025\3\14\0=\3\15\2B\0\2\1K\0\1\0\vsource\1\0\t\nspell\2\vbuffer\2\ttags\1\rnvim_lsp\2\15treesitter\1\rnvim_lua\2\tpath\2\nvsnip\2\tcalc\1\18documentation\15max_height\nlines\6o\bvim\nfloor\tmath\vborder\1\0\4\15min_height\3\1\14min_width\3<\14max_width\3è\2\17winhighlightHNormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder\1\t\0\0\5\5\5\6 \5\5\5\6 \1\0\v\19source_timeout\3È\1\19max_menu_width\3d\19max_kind_width\3d\19max_abbr_width\3d\21incomplete_delay\3\3\ndebug\1\18throttle_time\3P\14preselect\fenabled\15min_length\3\1\17autocomplete\2\fenabled\2\nsetup\ncompe\frequireçÌ™³\6³æÌþ\3\0" },
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n®\2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\24\0\0\tbash\bcss\15dockerfile\velixir\verlang\ago\fgraphql\thtml\15javascript\njsdoc\tjson\njsonc\blua\vpython\nquery\nregex\truby\nscala\tscss\ttoml\15typescript\btsx\tyaml\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["nvim.lua"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/nvim.lua"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["splitjoin.vim"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/splitjoin.vim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nÁ\b\0\0\n\0-\0M6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\18\0005\3\3\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4=\4\6\0034\4\0\0=\4\a\0036\4\0\0'\6\4\0B\4\2\0029\4\5\4=\4\b\0035\4\r\0005\5\v\0006\6\0\0'\b\t\0B\6\2\0029\6\n\6=\6\f\5=\5\14\0045\5\15\0006\6\0\0'\b\t\0B\6\2\0029\6\n\6=\6\f\5=\5\16\4=\4\17\3=\3\19\0025\3\21\0005\4\20\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0005\5\26\0=\5\a\4=\4\27\0035\4\28\0005\5 \0005\6\30\0006\a\0\0'\t\t\0B\a\2\0029\a\29\a=\a\31\6=\6\14\0055\6!\0006\a\0\0'\t\t\0B\a\2\0029\a\29\a=\a\31\6=\6\16\5=\5\17\4=\4\"\0035\4#\0005\5$\0004\6\0\0=\6\14\5=\5\17\4=\4%\0035\4&\0=\4'\0035\4(\0=\4)\0035\4*\0=\4+\3=\3,\2B\0\2\1K\0\1\0\fpickers\30current_buffer_fuzzy_find\1\0\2\14previewer\1\20layout_strategy\rvertical\16git_commits\1\0\1\20layout_strategy\15horizontal\17git_bcommits\1\0\1\20layout_strategy\15horizontal\17git_branches\1\0\0\1\0\2\18sort_lastused\2\20layout_strategy\15horizontal\fbuffers\1\0\0\1\0\0\n<c-d>\1\0\0\18delete_buffer\1\0\5\18sort_lastused\2\ronly_cwd\2\26ignore_current_buffer\2\ntheme\rdropdown\14previewer\1\roldfiles\1\3\0\0\n.git/\ttmp/\1\0\5\rcwd_only\2\28include_current_session\2\ntheme\rdropdown\17prompt_title\26Recently opened files\14previewer\1\14git_files\1\0\2\14previewer\1\ntheme\rdropdown\17autocommands\1\0\0\1\0\1\14previewer\1\rdefaults\1\0\0\rmappings\6n\1\0\0\6i\1\0\0\ajk\1\0\0\nclose\22telescope.actions\19generic_sorter\25file_ignore_patterns\16file_sorter\19get_fzy_sorter\22telescope.sorters\1\0\4\ruse_less\2\20layout_strategy\15horizontal\19color_devicons\2\21sorting_strategy\14ascending\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-bufonly"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/vim-bufonly"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-hexokinase"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/vim-hexokinase"
  },
  ["vim-lastplace"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/vim-lastplace"
  },
  ["vim-move"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/vim-move"
  },
  ["vim-projectionist"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/vim-projectionist"
  },
  ["vim-rails"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/vim-rails"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/vim-surround"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-textobj-elixir"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/vim-textobj-elixir"
  },
  ["vim-textobj-user"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/vim-textobj-user"
  },
  ["vim-tmux-navigator"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/vim-tmux-navigator"
  },
  ["vim-tmux-runner"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/vim-tmux-runner"
  },
  ["vim-ultest"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/vim-ultest"
  },
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n¯\19\0\0\a\0v\0¡\0016\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0019\1\3\0005\3i\0005\4\r\0005\5\4\0005\6\5\0=\6\6\0055\6\a\0=\6\b\0055\6\t\0=\6\n\0055\6\v\0=\6\f\5=\5\14\0045\5\15\0005\6\16\0=\6\17\0055\6\18\0=\6\19\0055\6\20\0=\6\6\0055\6\21\0=\6\f\5=\5\17\0045\5\22\0005\6\23\0=\6\14\0055\6\24\0=\6\b\0055\6\25\0=\6\26\0055\6\27\0=\6\f\5=\5\17\0045\5\29\0005\6\28\0=\6\30\0055\6\31\0=\6\19\0055\6 \0=\6!\0055\6\"\0=\6\f\0055\6#\0=\6$\0055\6%\0=\6&\0055\6'\0=\6(\5=\5)\0045\5+\0005\6*\0=\6,\0055\6-\0=\6\n\0055\6.\0=\6/\0055\0060\0=\0061\0055\0062\0=\0063\0055\0064\0=\6\17\0055\0065\0=\0066\0055\0067\0=\0068\0055\0069\0=\6:\0055\6;\0=\6\19\0055\6<\0=\6\f\0055\6=\0=\6$\5=\5\6\0045\5?\0005\6>\0=\6@\0055\6A\0=\6B\5=\5@\0045\5D\0005\6C\0=\6E\0055\6F\0=\6G\0055\6H\0=\6\14\0055\6I\0=\6\b\0055\6J\0=\0068\0055\6K\0=\6L\0055\6M\0=\6N\0055\6O\0=\6\19\5=\5\f\0045\5P\0005\6Q\0=\6R\0055\6S\0=\6\17\0055\6T\0=\6U\0055\6V\0=\6\b\0055\6W\0=\6$\0055\6X\0=\6\f\5=\5Y\0045\5Z\0005\6[\0=\6\\\0055\6]\0=\6\f\0055\6^\0=\6\n\0055\6_\0=\6/\0055\6`\0=\6\b\0055\6a\0=\6b\5=\5c\0045\5d\0005\6e\0=\6f\0055\6g\0=\6\f\5=\5h\4=\4G\0035\4k\0005\5j\0=\5\14\0045\5l\0=\0058\0045\5m\0=\0051\0045\5n\0=\5Y\4=\4o\0035\4q\0005\5p\0=\5\14\0045\5r\0=\0058\0045\5s\0=\0051\0045\5t\0=\5Y\4=\4u\3B\1\2\1K\0\1\0\6[\1\2\0\0\26Previous test failure\1\2\0\0\24Previous diagnostic\1\2\0\0\18Previous hunk\1\0\0\1\2\0\0\20Previous buffer\6]\1\2\0\0\22Next test failure\1\2\0\0\20Next diagnostic\1\2\0\0\14Next hunk\1\0\0\1\2\0\0\16Next buffer\1\0\0\6x\1\2\0\0\22Split text object\6j\1\2\0\0\21Join text object\1\0\1\tname\tText\6w\6=\1\2\0\0\26Equalize window sizes\1\2\0\0\28Close all other windows\1\2\0\0\"Force close of current window\1\2\0\0\25Close current window\1\2\0\0!Open horizontal window split\6v\1\2\0\0\31Open vertical window split\1\0\1\tname\fWindows\6t\1\2\0\0\22Show test summary\1\2\0\0(Stop executing current test command\1\2\0\0\24Clear all test runs\6o\1\2\0\0!Show output for current test\1\2\0\0\27Run all tests for file\6n\1\2\0\0\21Run nearest test\1\0\1\tname\nTests\1\2\0\0\27Fuzzy search registers\6m\1\2\0\0\27Fuzzy search man pages\6H\1\2\0\0\29Highlight search results\1\2\0\0\27Fuzzy search help tags\1\2\0\0'Remove search results highlighting\1\2\0\0 Fuzzy search current buffer\r<leader>\1\2\0\0\30Fuzzy search Vim commands\6/\1\0\0\1\2\0\0#Fuzzy search current workspace\6Q\1\2\0\0\26Quit vim without save\6q\1\0\0\1\2\0\0\rQuit vim\1\2\0\0\29Search workspace symbols\1\2\0\0\28Search document symbols\1\2\0\0\31Rename symbol under cursor\6i\1\2\0\0\25Go to implementation\6h\1\2\0\0\29Show hover documentation\agd\1\2\0\0\31Go to definition of symbol\1\2\0\0 Search LSP document symbols\6E\1\2\0\0\30Show diagnostics for line\6e\1\2\0\0 Show diagnostics for cursor\6D\1\2\0\0\25Show type definition\1\2\0\0\28Show definition preview\6a\1\0\0\1\2\0\0 Show available code actions\6g\6U\1\2\0\0\19Unstage buffer\6u\1\2\0\0\17Unstage hunk\6S\1\2\0\0\17Stage buffer\1\2\0\0\15Stage hunk\6R\1\2\0\0\17Reset buffer\1\2\0\0\15Reset hunk\6p\1\0\0\1\2\0\0\17Preview hunk\1\2\0\0 Show interactive Git status\6C\1\2\0\0#List all commits for searching\1\2\0\0002List commits for current buffer for searching\1\2\0\0 List branches for searching\1\0\1\tname\bGit\1\2\0\0\14Save file\1\2\0\0\15List files\6r\1\2\0\0\17Recent files\6f\1\2\0\0\15Find files\1\0\1\tname\nFiles\6b\1\0\0\6s\1\2\0\0\14Save file\6d\1\2\0\0\17Close buffer\6c\1\2\0\0\28Close all other buffers\6l\1\2\0\0!List open buffers for search\1\0\1\tname\fBuffers\rregister\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\nŠ\b\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\0035\4\a\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\fkeymaps\tn [h\1\2\1\0@&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'\texpr\2\tn ]h\1\2\1\0@&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'\texpr\2\1\0\f\17n <leader>gu5<cmd>lua require\"gitsigns\".undo_stage_hunk()<CR>\17n <leader>gs0<cmd>lua require\"gitsigns\".stage_hunk()<CR>\17v <leader>grT<cmd>lua require\"gitsigns\".reset_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\17n <leader>gR2<cmd>lua require\"gitsigns\".reset_buffer()<CR>\17v <leader>gsT<cmd>lua require\"gitsigns\".stage_hunk({vim.fn.line(\".\"), vim.fn.line(\"v\")})<CR>\17n <leader>gr0<cmd>lua require\"gitsigns\".reset_hunk()<CR>\to ih2:<C-U>lua require\"gitsigns\".select_hunk()<CR>\17n <leader>gp2<cmd>lua require\"gitsigns\".preview_hunk()<CR>\tx ih2:<C-U>lua require\"gitsigns\".select_hunk()<CR>\17n <leader>gU8<cmd>lua require\"gitsigns\".reset_buffer_index()<CR>\fnoremap\2\17n <leader>gS2<cmd>lua require\"gitsigns\".stage_buffer()<CR>\1\0\3\23current_line_blame\2\24attach_to_untracked\1 current_line_blame_position\beol\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n®\2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\24\0\0\tbash\bcss\15dockerfile\velixir\verlang\ago\fgraphql\thtml\15javascript\njsdoc\tjson\njsonc\blua\vpython\nquery\nregex\truby\nscala\tscss\ttoml\15typescript\btsx\tyaml\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n¯\19\0\0\a\0v\0¡\0016\0\0\0'\2\1\0B\0\2\0029\1\2\0B\1\1\0019\1\3\0005\3i\0005\4\r\0005\5\4\0005\6\5\0=\6\6\0055\6\a\0=\6\b\0055\6\t\0=\6\n\0055\6\v\0=\6\f\5=\5\14\0045\5\15\0005\6\16\0=\6\17\0055\6\18\0=\6\19\0055\6\20\0=\6\6\0055\6\21\0=\6\f\5=\5\17\0045\5\22\0005\6\23\0=\6\14\0055\6\24\0=\6\b\0055\6\25\0=\6\26\0055\6\27\0=\6\f\5=\5\17\0045\5\29\0005\6\28\0=\6\30\0055\6\31\0=\6\19\0055\6 \0=\6!\0055\6\"\0=\6\f\0055\6#\0=\6$\0055\6%\0=\6&\0055\6'\0=\6(\5=\5)\0045\5+\0005\6*\0=\6,\0055\6-\0=\6\n\0055\6.\0=\6/\0055\0060\0=\0061\0055\0062\0=\0063\0055\0064\0=\6\17\0055\0065\0=\0066\0055\0067\0=\0068\0055\0069\0=\6:\0055\6;\0=\6\19\0055\6<\0=\6\f\0055\6=\0=\6$\5=\5\6\0045\5?\0005\6>\0=\6@\0055\6A\0=\6B\5=\5@\0045\5D\0005\6C\0=\6E\0055\6F\0=\6G\0055\6H\0=\6\14\0055\6I\0=\6\b\0055\6J\0=\0068\0055\6K\0=\6L\0055\6M\0=\6N\0055\6O\0=\6\19\5=\5\f\0045\5P\0005\6Q\0=\6R\0055\6S\0=\6\17\0055\6T\0=\6U\0055\6V\0=\6\b\0055\6W\0=\6$\0055\6X\0=\6\f\5=\5Y\0045\5Z\0005\6[\0=\6\\\0055\6]\0=\6\f\0055\6^\0=\6\n\0055\6_\0=\6/\0055\6`\0=\6\b\0055\6a\0=\6b\5=\5c\0045\5d\0005\6e\0=\6f\0055\6g\0=\6\f\5=\5h\4=\4G\0035\4k\0005\5j\0=\5\14\0045\5l\0=\0058\0045\5m\0=\0051\0045\5n\0=\5Y\4=\4o\0035\4q\0005\5p\0=\5\14\0045\5r\0=\0058\0045\5s\0=\0051\0045\5t\0=\5Y\4=\4u\3B\1\2\1K\0\1\0\6[\1\2\0\0\26Previous test failure\1\2\0\0\24Previous diagnostic\1\2\0\0\18Previous hunk\1\0\0\1\2\0\0\20Previous buffer\6]\1\2\0\0\22Next test failure\1\2\0\0\20Next diagnostic\1\2\0\0\14Next hunk\1\0\0\1\2\0\0\16Next buffer\1\0\0\6x\1\2\0\0\22Split text object\6j\1\2\0\0\21Join text object\1\0\1\tname\tText\6w\6=\1\2\0\0\26Equalize window sizes\1\2\0\0\28Close all other windows\1\2\0\0\"Force close of current window\1\2\0\0\25Close current window\1\2\0\0!Open horizontal window split\6v\1\2\0\0\31Open vertical window split\1\0\1\tname\fWindows\6t\1\2\0\0\22Show test summary\1\2\0\0(Stop executing current test command\1\2\0\0\24Clear all test runs\6o\1\2\0\0!Show output for current test\1\2\0\0\27Run all tests for file\6n\1\2\0\0\21Run nearest test\1\0\1\tname\nTests\1\2\0\0\27Fuzzy search registers\6m\1\2\0\0\27Fuzzy search man pages\6H\1\2\0\0\29Highlight search results\1\2\0\0\27Fuzzy search help tags\1\2\0\0'Remove search results highlighting\1\2\0\0 Fuzzy search current buffer\r<leader>\1\2\0\0\30Fuzzy search Vim commands\6/\1\0\0\1\2\0\0#Fuzzy search current workspace\6Q\1\2\0\0\26Quit vim without save\6q\1\0\0\1\2\0\0\rQuit vim\1\2\0\0\29Search workspace symbols\1\2\0\0\28Search document symbols\1\2\0\0\31Rename symbol under cursor\6i\1\2\0\0\25Go to implementation\6h\1\2\0\0\29Show hover documentation\agd\1\2\0\0\31Go to definition of symbol\1\2\0\0 Search LSP document symbols\6E\1\2\0\0\30Show diagnostics for line\6e\1\2\0\0 Show diagnostics for cursor\6D\1\2\0\0\25Show type definition\1\2\0\0\28Show definition preview\6a\1\0\0\1\2\0\0 Show available code actions\6g\6U\1\2\0\0\19Unstage buffer\6u\1\2\0\0\17Unstage hunk\6S\1\2\0\0\17Stage buffer\1\2\0\0\15Stage hunk\6R\1\2\0\0\17Reset buffer\1\2\0\0\15Reset hunk\6p\1\0\0\1\2\0\0\17Preview hunk\1\2\0\0 Show interactive Git status\6C\1\2\0\0#List all commits for searching\1\2\0\0002List commits for current buffer for searching\1\2\0\0 List branches for searching\1\0\1\tname\bGit\1\2\0\0\14Save file\1\2\0\0\15List files\6r\1\2\0\0\17Recent files\6f\1\2\0\0\15Find files\1\0\1\tname\nFiles\6b\1\0\0\6s\1\2\0\0\14Save file\6d\1\2\0\0\17Close buffer\6c\1\2\0\0\28Close all other buffers\6l\1\2\0\0!List open buffers for search\1\0\1\tname\fBuffers\rregister\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nb\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\17dracula-nvim\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\2\n³\4\0\0\a\0\16\1\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0036\4\a\0009\4\b\0046\6\t\0009\6\n\0069\6\v\6\24\6\0\6B\4\2\2=\4\f\3=\3\r\0025\3\14\0=\3\15\2B\0\2\1K\0\1\0\vsource\1\0\t\nspell\2\vbuffer\2\ttags\1\rnvim_lsp\2\15treesitter\1\rnvim_lua\2\tpath\2\nvsnip\2\tcalc\1\18documentation\15max_height\nlines\6o\bvim\nfloor\tmath\vborder\1\0\4\15min_height\3\1\14min_width\3<\14max_width\3è\2\17winhighlightHNormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder\1\t\0\0\5\5\5\6 \5\5\5\6 \1\0\v\19source_timeout\3È\1\19max_menu_width\3d\19max_kind_width\3d\19max_abbr_width\3d\21incomplete_delay\3\3\ndebug\1\18throttle_time\3P\14preselect\fenabled\15min_length\3\1\17autocomplete\2\fenabled\2\nsetup\ncompe\frequireçÌ™³\6³æÌþ\3\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\nW\0\4\b\0\5\0\14\18\6\1\0009\4\0\1'\a\1\0B\4\3\2\15\0\4\0X\5\2€'\4\2\0X\5\1€'\4\3\0'\5\4\0\18\6\4\0\18\a\0\0&\5\a\5L\5\2\0\6 \tï± \tïœ \nerror\nmatchÿ\1\1\0\5\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0003\3\4\0=\3\5\0024\3\3\0005\4\6\0>\4\1\3=\3\a\2B\0\2\1K\0\1\0\foffsets\1\0\3\ttext\18File Explorer\rfiletype\rNvimTree\15text_align\nright\26diagnostics_indicator\0\1\0\5\16diagnostics\rnvim_lsp\rmappings\2\22max_prefix_length\3\21\20max_name_length\3\24\rtab_size\3$\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\nÁ\b\0\0\n\0-\0M6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\18\0005\3\3\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4=\4\6\0034\4\0\0=\4\a\0036\4\0\0'\6\4\0B\4\2\0029\4\5\4=\4\b\0035\4\r\0005\5\v\0006\6\0\0'\b\t\0B\6\2\0029\6\n\6=\6\f\5=\5\14\0045\5\15\0006\6\0\0'\b\t\0B\6\2\0029\6\n\6=\6\f\5=\5\16\4=\4\17\3=\3\19\0025\3\21\0005\4\20\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0005\5\26\0=\5\a\4=\4\27\0035\4\28\0005\5 \0005\6\30\0006\a\0\0'\t\t\0B\a\2\0029\a\29\a=\a\31\6=\6\14\0055\6!\0006\a\0\0'\t\t\0B\a\2\0029\a\29\a=\a\31\6=\6\16\5=\5\17\4=\4\"\0035\4#\0005\5$\0004\6\0\0=\6\14\5=\5\17\4=\4%\0035\4&\0=\4'\0035\4(\0=\4)\0035\4*\0=\4+\3=\3,\2B\0\2\1K\0\1\0\fpickers\30current_buffer_fuzzy_find\1\0\2\14previewer\1\20layout_strategy\rvertical\16git_commits\1\0\1\20layout_strategy\15horizontal\17git_bcommits\1\0\1\20layout_strategy\15horizontal\17git_branches\1\0\0\1\0\2\18sort_lastused\2\20layout_strategy\15horizontal\fbuffers\1\0\0\1\0\0\n<c-d>\1\0\0\18delete_buffer\1\0\5\18sort_lastused\2\ronly_cwd\2\26ignore_current_buffer\2\ntheme\rdropdown\14previewer\1\roldfiles\1\3\0\0\n.git/\ttmp/\1\0\5\rcwd_only\2\28include_current_session\2\ntheme\rdropdown\17prompt_title\26Recently opened files\14previewer\1\14git_files\1\0\2\14previewer\1\ntheme\rdropdown\17autocommands\1\0\0\1\0\1\14previewer\1\rdefaults\1\0\0\rmappings\6n\1\0\0\6i\1\0\0\ajk\1\0\0\nclose\22telescope.actions\19generic_sorter\25file_ignore_patterns\16file_sorter\19get_fzy_sorter\22telescope.sorters\1\0\4\ruse_less\2\20layout_strategy\15horizontal\19color_devicons\2\21sorting_strategy\14ascending\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
