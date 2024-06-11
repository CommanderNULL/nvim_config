vim.opt.showmode = false

require('lualine').setup({
  options = {
    theme = 'onedark',
		path = 1,
    icons_enabled = true,
		show_filename_only = false,
    component_separators = '|',
    section_separators = '',
    disabled_filetypes = {
      statusline = {'NvimTree'}
    }
  },
})
