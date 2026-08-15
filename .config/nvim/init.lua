-- Bootstrap packer.nvim
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


-- Plugin setup
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  -- Treesitter
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      local ts = require'nvim-treesitter.configs'
      ts.setup {
        ensure_installed = { "lua", "vim", "python", "bash", "java", "yaml", "json", "dockerfile" },
        highlight = { enable = true },
        indent = { enable = true },
      }
    end
  }

  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    requires = { 'nvim-lua/plenary.nvim' }, 
  }

  if packer_bootstrap then
    require('packer').sync()
  end

use {
  "github/copilot.vim",
  config = function()
  end
}

use {
  'nvim-tree/nvim-web-devicons',
  config = function()
    require('nvim-web-devicons').setup {
      default = true,
    }
  end
}


use {
  'lewis6991/gitsigns.nvim',
  requires = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('gitsigns').setup {
      signs = {
        add          = {hl = 'GitGutterAdd', text = '+', numhl='GitSignsAddNr', linehl='GitSignsAddLn'},
        change       = {hl = 'GitGutterChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitGutterDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitGutterDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitGutterChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
      },
      signcolumn = true, 
      numhl      = true,
      linehl     = true,
      word_diff  = true,
      watch_gitdir = {
        interval = 1000,
        follow_files = true
      },
      attach_to_untracked = true,
      current_line_blame = true,
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol',
        delay = 500,
      },
      sign_priority = 6,
      update_debounce = 100,
      status_formatter = nil,
    }

	-- Keymaps
    local gs = package.loaded.gitsigns
    vim.keymap.set('n', ']c', gs.next_hunk, {silent=true})
    vim.keymap.set('n', '[c', gs.prev_hunk, {silent=true})
    vim.keymap.set('n', '<leader>hs', gs.stage_hunk)
    vim.keymap.set('n', '<leader>hr', gs.reset_hunk)
    vim.keymap.set('n', '<leader>hS', gs.stage_buffer)
    vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk)
    vim.keymap.set('n', '<leader>hp', gs.preview_hunk)
    vim.keymap.set('n', '<leader>hb', function() gs.blame_line{full=true} end)
    vim.keymap.set('n', '<leader>hd', gs.diffthis)
    vim.keymap.set('n', '<leader>hD', function() gs.diffthis('~') end)
  end
}

use 'folke/tokyonight.nvim'

end)

-- Leader key
vim.g.mapleader = " "

-- Telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
vim.keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Telescope recent files' })
vim.keymap.set('n', '<leader>fc', builtin.commands, { desc = 'Telescope commands' })
vim.keymap.set('n', '<leader>fs', builtin.grep_string, { desc = 'Telescope grep string under cursor' })

-- Optional: Create simple "E" command for Explore
vim.api.nvim_create_user_command("E", "Explore", {})
vim.cmd("source ~/.vimrc")

-- netrw: directory tree style
vim.g.netrw_liststyle = 3
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
vim.g.netrw_browse_split = 3

-- Toggle file tree sidebar: Space+e (single tree, not a tab)
vim.keymap.set("n", "<leader>e", ":Lexplore<CR>", { noremap = true, silent = true })

-- Tab switching: Tab / Shift+Tab
vim.keymap.set("n", "<Tab>", ":tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>", { noremap = true, silent = true })

-- Close current tab: Ctrl+c (open file tree if last tab)
vim.keymap.set("n", "<C-c>", function()
  if vim.fn.tabpagenr('$') > 1 then
    vim.cmd("tabclose")
    return
  end
  if vim.bo.filetype == "netrw" then
    return
  end
  if vim.bo.modified then
    vim.api.nvim_echo({{"Ctrl+C: save the file first", "WarningMsg"}}, true, {})
    return
  end
  vim.cmd("bwipeout!")
  local tree_open = false
  for _, win in ipairs(vim.api.nvim_list_wins()) do
    if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == "netrw" then
      tree_open = true
      break
    end
  end
  if not tree_open then
    vim.cmd("Lexplore")
  end
end, { noremap = true, silent = true })

-- Quit nvim completely: Ctrl+d
vim.keymap.set("n", "<C-d>", ":qa<CR>", { noremap = true, silent = true })

-- Tab management keymaps
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>")
vim.keymap.set("n", "<leader>to", ":tabonly<CR>")
vim.keymap.set("n", "<leader>tl", ":tabnext<CR>")
vim.keymap.set("n", "<leader>th", ":tabprevious<CR>")
vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")

vim.cmd[[colorscheme tokyonight]]
