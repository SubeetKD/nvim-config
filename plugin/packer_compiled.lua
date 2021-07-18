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
local package_path_str = "/home/subeet/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/subeet/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/subeet/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/subeet/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/subeet/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
  LuaSnip = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/subeet/.local/share/nvim/site/pack/packer/start/LuaSnip"
  },
  ["colorbuddy.vim"] = {
    loaded = true,
    path = "/home/subeet/.local/share/nvim/site/pack/packer/start/colorbuddy.vim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 subeet.colorscheme.evilline\frequire\0" },
    loaded = true,
    path = "/home/subeet/.local/share/nvim/site/pack/packer/start/galaxyline.nvim"
  },
  ["gruvbuddy.nvim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\14gruvbuddy\16colorscheme\15colorbuddy\frequire\0" },
    loaded = true,
    path = "/home/subeet/.local/share/nvim/site/pack/packer/start/gruvbuddy.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = true,
    path = "/home/subeet/.local/share/nvim/site/pack/packer/start/lsp-colors.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\nn\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\17handler_opts\1\0\1\vborder\vsingle\1\0\1\tbind\2\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/home/subeet/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    config = { "\27LJ\2\n�\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15symbol_map\1\0\20\fSnippet\b﬌\vFolder\b\fKeyword\b\15EnumMember\b\tEnum\b了\rConstant\b\nValue\b\vStruct\b\tUnit\b\rProperty\b\vModule\b\14Interface\bﰮ\nClass\b\rVariable\b\16Constructor\b\rFunction\b\vMethod\aƒ\tText\b\tFile\b\nColor\b\1\0\2\vpreset\rcodicons\14with_text\2\tinit\flspkind\frequire\0" },
    loaded = true,
    path = "/home/subeet/.local/share/nvim/site/pack/packer/start/lspkind-nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nt\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21disable_filetype\1\0\0\1\3\0\0\20TelescopePrompt\bvim\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/subeet/.local/share/nvim/site/pack/packer/start/nvim-autopairs"
  },
  ["nvim-compe"] = {
    config = { "\27LJ\2\n�\4\0\0\a\0\16\1\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0036\4\a\0009\4\b\0046\6\t\0009\6\n\0069\6\v\6\24\6\0\6B\4\2\2=\4\f\3=\3\r\0025\3\14\0=\3\15\2B\0\2\1K\0\1\0\vsource\1\0\t\nvsnip\1\vbuffer\2\fluasnip\2\14ultisnips\1\tpath\2\rnvim_lua\2\rnvim_lsp\2\tcalc\2\forgmode\2\18documentation\15max_height\nlines\6o\bvim\nfloor\tmath\vborder\1\0\4\17winhighlightHNormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder\15min_height\3\1\14min_width\3<\14max_width\3x\1\t\0\0\5\5\5\6 \5\5\5\6 \1\0\f\19max_menu_width\3d\19max_kind_width\3d\19max_abbr_width\3d\21incomplete_delay\3�\3\20resolve_timeout\3�\6\19source_timeout\3�\1\18throttle_time\3P\ndebug\1\14preselect\venable\15min_length\3\1\17autocomplete\2\fenabled\2\nsetup\ncompe\frequire�̙�\6����\3\0" },
    loaded = true,
    path = "/home/subeet/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/home/subeet/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-jdtls"] = {
    loaded = true,
    path = "/home/subeet/.local/share/nvim/site/pack/packer/start/nvim-jdtls"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/subeet/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/home/subeet/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/subeet/.local/share/nvim/site/pack/packer/start/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/subeet/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/subeet/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/subeet/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/subeet/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/subeet/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/subeet/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  ["vim-commentary"] = {
    loaded = true,
    path = "/home/subeet/.local/share/nvim/site/pack/packer/start/vim-commentary"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/subeet/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-surround"] = {
    loaded = true,
    path = "/home/subeet/.local/share/nvim/site/pack/packer/start/vim-surround"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\nn\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\17handler_opts\1\0\1\vborder\vsingle\1\0\1\tbind\2\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: nvim-compe
time([[Config for nvim-compe]], true)
try_loadstring("\27LJ\2\n�\4\0\0\a\0\16\1\0216\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\0036\4\a\0009\4\b\0046\6\t\0009\6\n\0069\6\v\6\24\6\0\6B\4\2\2=\4\f\3=\3\r\0025\3\14\0=\3\15\2B\0\2\1K\0\1\0\vsource\1\0\t\nvsnip\1\vbuffer\2\fluasnip\2\14ultisnips\1\tpath\2\rnvim_lua\2\rnvim_lsp\2\tcalc\2\forgmode\2\18documentation\15max_height\nlines\6o\bvim\nfloor\tmath\vborder\1\0\4\17winhighlightHNormalFloat:CompeDocumentation,FloatBorder:CompeDocumentationBorder\15min_height\3\1\14min_width\3<\14max_width\3x\1\t\0\0\5\5\5\6 \5\5\5\6 \1\0\f\19max_menu_width\3d\19max_kind_width\3d\19max_abbr_width\3d\21incomplete_delay\3�\3\20resolve_timeout\3�\6\19source_timeout\3�\1\18throttle_time\3P\ndebug\1\14preselect\venable\15min_length\3\1\17autocomplete\2\fenabled\2\nsetup\ncompe\frequire�̙�\6����\3\0", "config", "nvim-compe")
time([[Config for nvim-compe]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0 subeet.colorscheme.evilline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: gruvbuddy.nvim
time([[Config for gruvbuddy.nvim]], true)
try_loadstring("\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\14gruvbuddy\16colorscheme\15colorbuddy\frequire\0", "config", "gruvbuddy.nvim")
time([[Config for gruvbuddy.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\nt\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21disable_filetype\1\0\0\1\3\0\0\20TelescopePrompt\bvim\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: LuaSnip
time([[Config for LuaSnip]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "LuaSnip")
time([[Config for LuaSnip]], false)
-- Config for: lspkind-nvim
time([[Config for lspkind-nvim]], true)
try_loadstring("\27LJ\2\n�\2\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\15symbol_map\1\0\20\fSnippet\b﬌\vFolder\b\fKeyword\b\15EnumMember\b\tEnum\b了\rConstant\b\nValue\b\vStruct\b\tUnit\b\rProperty\b\vModule\b\14Interface\bﰮ\nClass\b\rVariable\b\16Constructor\b\rFunction\b\vMethod\aƒ\tText\b\tFile\b\nColor\b\1\0\2\vpreset\rcodicons\14with_text\2\tinit\flspkind\frequire\0", "config", "lspkind-nvim")
time([[Config for lspkind-nvim]], false)
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
