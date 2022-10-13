--local colorscheme = ''
--if Scheme ~= 'tokyonight' then
  --colorscheme = 'auto'
--end

require('lualine').setup {
  options = {
    theme = Scheme,
    extensions = {
      'fugitive',
      'nvim-tree'
    }
  }
}
