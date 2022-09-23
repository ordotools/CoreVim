--local colorscheme = ''
--if Scheme ~= 'tokyonight' then
  --colorscheme = 'auto'
--end

require('lualine').setup {
  options = {
    theme = 'kanagawa',
    extensions = {
      'fugitive',
      'nvim-tree'
    }
  }
}
