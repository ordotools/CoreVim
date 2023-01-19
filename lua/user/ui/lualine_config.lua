require('lualine').setup {
  option = {

    theme = 'auto', -- kanagawa

    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },

    --tabline = {},

    winbar = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },

    extensions = {
      'fugitive',
      'nvim-tree',
      'toggleterm'
    }
  }
}
