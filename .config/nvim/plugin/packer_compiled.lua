-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/bartek/.cache/nvim/packer_hererocks/2.1.1748459687/share/lua/5.1/?.lua;/Users/bartek/.cache/nvim/packer_hererocks/2.1.1748459687/share/lua/5.1/?/init.lua;/Users/bartek/.cache/nvim/packer_hererocks/2.1.1748459687/lib/luarocks/rocks-5.1/?.lua;/Users/bartek/.cache/nvim/packer_hererocks/2.1.1748459687/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/bartek/.cache/nvim/packer_hererocks/2.1.1748459687/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
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
  ["copilot.vim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/Users/bartek/.local/share/nvim/site/pack/packer/start/copilot.vim",
    url = "https://github.com/github/copilot.vim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n1\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\0À\1\0\1\tfull\2\15blame_line(\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\0À\6~\rdiffthis‘\v\1\0\a\0000\0c6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\2B\0\2\0016\0\20\0009\0\21\0009\0\1\0006\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4\26\0009\5\27\0005\6\28\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4\29\0009\5\30\0005\6\31\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4 \0009\5!\0B\1\4\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4\"\0009\5#\0B\1\4\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4$\0009\5%\0B\1\4\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4&\0009\5'\0B\1\4\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4(\0009\5)\0B\1\4\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4*\0003\5+\0B\1\4\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4,\0009\5-\0B\1\4\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4.\0003\5/\0B\1\4\0012\0\0€K\0\1\0\0\15<leader>hD\rdiffthis\15<leader>hd\0\15<leader>hb\17preview_hunk\15<leader>hp\20undo_stage_hunk\15<leader>hu\17stage_buffer\15<leader>hS\15reset_hunk\15<leader>hr\15stage_hunk\15<leader>hs\1\0\1\vsilent\2\14prev_hunk\a[c\1\0\1\vsilent\2\14next_hunk\a]c\6n\bset\vkeymap\bvim\vloaded\fpackage\28current_line_blame_opts\1\0\3\18virt_text_pos\beol\14virt_text\2\ndelay\3ô\3\17watch_gitdir\1\0\2\17follow_files\2\rinterval\3è\a\nsigns\1\0\f\23current_line_blame\2\24attach_to_untracked\2\14word_diff\2\vlinehl\2\17watch_gitdir\0\nnumhl\2\21status_formatter\0\nsigns\0\20update_debounce\3d\18sign_priority\3\6\15signcolumn\2\28current_line_blame_opts\0\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\20GitGutterChange\14topdelete\1\0\4\ttext\bâ€¾\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\20GitGutterDelete\vdelete\1\0\4\ttext\6_\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\20GitGutterDelete\vchange\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\20GitGutterChange\badd\1\0\5\14topdelete\0\vchange\0\badd\0\vdelete\0\17changedelete\0\1\0\4\ttext\6+\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\17GitGutterAdd\nsetup\rgitsigns\frequire\0" },
    loaded = true,
    path = "/Users/bartek/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nó\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\3B\1\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\3\vindent\0\14highlight\0\21ensure_installed\0\1\t\0\0\blua\bvim\vpython\tbash\tjava\tyaml\tjson\15dockerfile\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/Users/bartek/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/Users/bartek/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/bartek/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/bartek/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/bartek/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/Users/bartek/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n1\0\0\3\1\2\0\5-\0\0\0009\0\0\0005\2\1\0B\0\2\1K\0\1\0\0À\1\0\1\tfull\2\15blame_line(\0\0\3\1\2\0\5-\0\0\0009\0\0\0'\2\1\0B\0\2\1K\0\1\0\0À\6~\rdiffthis‘\v\1\0\a\0000\0c6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\2B\0\2\0016\0\20\0009\0\21\0009\0\1\0006\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4\26\0009\5\27\0005\6\28\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4\29\0009\5\30\0005\6\31\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4 \0009\5!\0B\1\4\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4\"\0009\5#\0B\1\4\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4$\0009\5%\0B\1\4\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4&\0009\5'\0B\1\4\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4(\0009\5)\0B\1\4\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4*\0003\5+\0B\1\4\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4,\0009\5-\0B\1\4\0016\1\22\0009\1\23\0019\1\24\1'\3\25\0'\4.\0003\5/\0B\1\4\0012\0\0€K\0\1\0\0\15<leader>hD\rdiffthis\15<leader>hd\0\15<leader>hb\17preview_hunk\15<leader>hp\20undo_stage_hunk\15<leader>hu\17stage_buffer\15<leader>hS\15reset_hunk\15<leader>hr\15stage_hunk\15<leader>hs\1\0\1\vsilent\2\14prev_hunk\a[c\1\0\1\vsilent\2\14next_hunk\a]c\6n\bset\vkeymap\bvim\vloaded\fpackage\28current_line_blame_opts\1\0\3\18virt_text_pos\beol\14virt_text\2\ndelay\3ô\3\17watch_gitdir\1\0\2\17follow_files\2\rinterval\3è\a\nsigns\1\0\f\23current_line_blame\2\24attach_to_untracked\2\14word_diff\2\vlinehl\2\17watch_gitdir\0\nnumhl\2\21status_formatter\0\nsigns\0\20update_debounce\3d\18sign_priority\3\6\15signcolumn\2\28current_line_blame_opts\0\17changedelete\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\20GitGutterChange\14topdelete\1\0\4\ttext\bâ€¾\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\20GitGutterDelete\vdelete\1\0\4\ttext\6_\nnumhl\21GitSignsDeleteNr\vlinehl\21GitSignsDeleteLn\ahl\20GitGutterDelete\vchange\1\0\4\ttext\6~\nnumhl\21GitSignsChangeNr\vlinehl\21GitSignsChangeLn\ahl\20GitGutterChange\badd\1\0\5\14topdelete\0\vchange\0\badd\0\vdelete\0\17changedelete\0\1\0\4\ttext\6+\nnumhl\18GitSignsAddNr\vlinehl\18GitSignsAddLn\ahl\17GitGutterAdd\nsetup\rgitsigns\frequire\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nó\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\3B\1\2\1K\0\1\0\vindent\1\0\1\venable\2\14highlight\1\0\1\venable\2\21ensure_installed\1\0\3\vindent\0\14highlight\0\21ensure_installed\0\1\t\0\0\blua\bvim\vpython\tbash\tjava\tyaml\tjson\15dockerfile\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: copilot.vim
time([[Config for copilot.vim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "copilot.vim")
time([[Config for copilot.vim]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nO\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\fdefault\2\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
