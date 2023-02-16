require('lualine').setup {
  options = {

    theme = 'auto', -- kanagawa

    --section_separators = { left = '', right = '' },
    --component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },

    --tabline = {},

    extensions = {
      'fugitive',
      'nvim-tree',
      'toggleterm'
    }
  }
}
