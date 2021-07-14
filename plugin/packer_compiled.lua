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
  ["BufOnly.vim"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/BufOnly.vim"
  },
  ["astronauta.nvim"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/astronauta.nvim"
  },
  ["blamer.nvim"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/blamer.nvim"
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
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
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
    config = { "\27LJ\2\nW\0\4\b\0\5\0\14\18\6\1\0009\4\0\1'\a\1\0B\4\3\2\15\0\4\0X\5\2�'\4\2\0X\5\1�'\4\3\0'\5\4\0\18\6\4\0\18\a\0\0&\5\a\5L\5\2\0\6 \t \t \nerror\nmatch�\1\1\0\5\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0003\3\4\0=\3\5\0024\3\3\0005\4\6\0>\4\1\3=\3\a\2B\0\2\1K\0\1\0\foffsets\1\0\3\ttext\18File Explorer\rfiletype\rNvimTree\15text_align\nright\26diagnostics_indicator\0\1\0\5\rtab_size\3$\rmappings\2\16diagnostics\rnvim_lsp\22max_prefix_length\3\21\20max_name_length\3\24\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/nvim-bufferline.lua"
  },
  ["nvim-compe"] = {
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
    config = { "\27LJ\2\n�\2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\24\0\0\tbash\bcss\15dockerfile\velixir\verlang\ago\fgraphql\thtml\15javascript\njsdoc\tjson\njsonc\blua\vpython\nquery\nregex\truby\nscala\tscss\ttoml\15typescript\btsx\tyaml\nsetup\28nvim-treesitter.configs\frequire\0" },
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
    config = { "\27LJ\2\n�\5\0\0\a\0\28\0%6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4=\4\6\0034\4\0\0=\4\a\0036\4\0\0'\6\4\0B\4\2\0029\4\b\4=\4\t\3=\3\v\0025\3\23\0005\4\f\0005\5\r\0=\5\14\0045\5\16\0005\6\15\0=\6\17\0055\6\18\0=\6\19\0055\6\20\0=\6\21\5=\5\22\4=\4\24\0035\4\25\0=\4\26\3=\3\27\2B\0\2\1K\0\1\0\fpickers\fbuffers\1\0\2\ntheme\rdropdown\14previewer\1\14git_files\1\0\0\16borderchars\fpreview\1\t\0\0\b▀\b▐\b▄\b▌\b▛\b▜\b▟\b▙\fresults\1\t\0\0\b▀\b▐\b▄\b▌\b▛\b▜\b▟\b▙\vprompt\1\0\0\1\t\0\0\b▀\b▐\b▄\b▌\b▛\b▜\b▟\b▙\18layout_config\1\0\1\nwidth\4����\t����\3\1\0\6\14show_line\1\17prompt_title\5\18preview_title\5\14previewer\1\18results_title\5\rwinblend\3\20\rdefaults\1\0\0\19generic_sorter\29get_generic_fuzzy_sorter\25file_ignore_patterns\16file_sorter\19get_fuzzy_file\22telescope.sorters\1\0\4\21sorting_strategy\14ascending\19color_devicons\2\ruse_less\2\20layout_strategy\15horizontal\nsetup\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-closetag"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/vim-closetag"
  },
  ["vim-floaterm"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/vim-floaterm"
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
  ["vim-vsnip"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/vim-vsnip"
  },
  ["vim-vsnip-integ"] = {
    loaded = true,
    path = "/Users/thedelchop/.local/share/nvim/site/pack/packer/start/vim-vsnip-integ"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-bufferline.lua
time([[Config for nvim-bufferline.lua]], true)
try_loadstring("\27LJ\2\nW\0\4\b\0\5\0\14\18\6\1\0009\4\0\1'\a\1\0B\4\3\2\15\0\4\0X\5\2�'\4\2\0X\5\1�'\4\3\0'\5\4\0\18\6\4\0\18\a\0\0&\5\a\5L\5\2\0\6 \t \t \nerror\nmatch�\1\1\0\5\0\b\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0003\3\4\0=\3\5\0024\3\3\0005\4\6\0>\4\1\3=\3\a\2B\0\2\1K\0\1\0\foffsets\1\0\3\ttext\18File Explorer\rfiletype\rNvimTree\15text_align\nright\26diagnostics_indicator\0\1\0\5\rtab_size\3$\rmappings\2\16diagnostics\rnvim_lsp\22max_prefix_length\3\21\20max_name_length\3\24\nsetup\15bufferline\frequire\0", "config", "nvim-bufferline.lua")
time([[Config for nvim-bufferline.lua]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nb\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\foptions\1\0\0\1\0\1\ntheme\17dracula-nvim\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n�\2\0\0\4\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\2B\0\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\0\1\24\0\0\tbash\bcss\15dockerfile\velixir\verlang\ago\fgraphql\thtml\15javascript\njsdoc\tjson\njsonc\blua\vpython\nquery\nregex\truby\nscala\tscss\ttoml\15typescript\btsx\tyaml\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n�\5\0\0\a\0\28\0%6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\n\0005\3\3\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4=\4\6\0034\4\0\0=\4\a\0036\4\0\0'\6\4\0B\4\2\0029\4\b\4=\4\t\3=\3\v\0025\3\23\0005\4\f\0005\5\r\0=\5\14\0045\5\16\0005\6\15\0=\6\17\0055\6\18\0=\6\19\0055\6\20\0=\6\21\5=\5\22\4=\4\24\0035\4\25\0=\4\26\3=\3\27\2B\0\2\1K\0\1\0\fpickers\fbuffers\1\0\2\ntheme\rdropdown\14previewer\1\14git_files\1\0\0\16borderchars\fpreview\1\t\0\0\b▀\b▐\b▄\b▌\b▛\b▜\b▟\b▙\fresults\1\t\0\0\b▀\b▐\b▄\b▌\b▛\b▜\b▟\b▙\vprompt\1\0\0\1\t\0\0\b▀\b▐\b▄\b▌\b▛\b▜\b▟\b▙\18layout_config\1\0\1\nwidth\4����\t����\3\1\0\6\14show_line\1\17prompt_title\5\18preview_title\5\14previewer\1\18results_title\5\rwinblend\3\20\rdefaults\1\0\0\19generic_sorter\29get_generic_fuzzy_sorter\25file_ignore_patterns\16file_sorter\19get_fuzzy_file\22telescope.sorters\1\0\4\21sorting_strategy\14ascending\19color_devicons\2\ruse_less\2\20layout_strategy\15horizontal\nsetup\14telescope\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
