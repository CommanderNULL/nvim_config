-- some basic appearance configs
vim.opt.number = true
vim.opt.relativenumber = true 
vim.opt.mouse = 'a'
vim.opt.hlsearch = false
vim.opt.wrap = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

vim.g.mapleader = ' '

-- highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('highlight_yank', {}),
  desc = 'Hightlight selection on yank',
  pattern = '*',
  callback = function()
    vim.highlight.on_yank { higroup = 'IncSearch', timeout = 500 }
  end,
})

-- KEYMAPS
-- reminder how keymaps work
-- vim.keymap.set('n', '<space>w', '<cmd>write<cr>', {desc = 'Save'})

vim.keymap.set({'n', 'x'}, 'gy', '"+y"')
vim.keymap.set({'n', 'x'}, 'gp', '"+p"')
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- LAZYVIM

local lazy = {}

function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim....')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  if vim.g.plugins_ready then
    return
  end

  -- You can "comment out" the line below after lazy.nvim is installed
  --lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)

  require('lazy').setup(plugins, lazy.opts)
  vim.g.plugins_ready = true
end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

lazy.setup({
  ---
  -- List of plugins
  ---
	{ 'rose-pine/neovim', name = 'rose-pine' },
	{ 'nvim-lualine/lualine.nvim', name = 'lualine'},
	{ 'lukas-reineke/indent-blankline.nvim', name = 'ibl'},
	{ 'nvim-treesitter/nvim-treesitter', name = 'nvim-treesitter'},
	{ 'kyazdani42/nvim-tree.lua', name = 'nvim-tree'},
	{ 'nvim-telescope/telescope.nvim', name = 'telescope'},
	{ 'lewis6991/gitsigns.nvim', name = 'gitsigns'},
	{ 'nvim-lua/plenary.nvim', name = 'plenary'},
	{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
	{'L3MON4D3/LuaSnip'},
	{'justinmk/vim-sneak', name = 'sneak'},
	{'numToStr/Comment.nvim', name = 'comment'},
	{'craftzdog/solarized-osaka.nvim', name = 'osaka'}
})

require('plugins.lualine')
require('plugins.ibl')
require('plugins.treesitter')
require('plugins.nvim-tree')
require('plugins.telescope')
require('plugins.lsp_zero')
require('plugins.comment')

-- apply the colorscheme
require('solarized-osaka').setup({
	transparent = false
})
vim.opt.termguicolors = true
vim.cmd.colorscheme('solarized-osaka')


--- user commands
vim.api.nvim_create_user_command('Jsonf', '%!jq .', {})
