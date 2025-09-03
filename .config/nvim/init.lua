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
        highlight = { enable = true },
        indent = { enable = true },
      }

      -- Ensure parsers are installed
      local parsers = { "lua", "vim", "python", "bash", "java", "yaml", "json", "dockerfile" }
      for _, parser in ipairs(parsers) do
        if not require("nvim-treesitter.parsers").has_parser(parser) then
          require("nvim-treesitter.install").install(parser)
        end
      end
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


-- Tab management keymaps
vim.keymap.set("n", "<leader>tn", ":tabnew<CR>")
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>")
vim.keymap.set("n", "<leader>to", ":tabonly<CR>")
vim.keymap.set("n", "<leader>tl", ":tabnext<CR>")
vim.keymap.set("n", "<leader>th", ":tabprevious<CR>")
vim.keymap.set("n", "<leader>1", "1gt")
vim.keymap.set("n", "<leader>2", "2gt")
vim.keymap.set("n", "<leader>3", "3gt")

vim.keymap.set("n", "<Tab>", ":tabnext<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>", { noremap = true, silent = true })

-- Open a new tab with file explorer
vim.keymap.set("n", "<leader>tn", ":tabnew | Explore<CR>", { noremap = true, silent = true })

