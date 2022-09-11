--local colorscheme = ''
--if Scheme ~= 'tokyonight' then
  --colorscheme = 'auto'
--end

require('lualine').setup {
  options = {
    theme = 'auto',
    extensions = {
      'fugitive',
      'nvim-tree'
    }
  }
}
