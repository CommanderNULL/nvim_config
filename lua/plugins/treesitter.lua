require('nvim-treesitter.configs').setup({
  highlight = {
    enable = true,
  },
  ensure_installed = {
		'go',
		'gomod',
    'json',
		'bash',
		'dockerfile',
		'terraform',
		'sql',
    'lua',
  },
})
