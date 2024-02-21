return {

  {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = false
    },
    lazy = true,
    event = "VeryLazy",
    -- event = "BufEnter",
    config = function()
      require('lualine').setup {
        options = {
          theme = 'auto',
          -- section_separators = { left = '', right = '' },
          -- component_separators = { left = '', right = '' },
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          extensions = {
            'fugitive',
            'nvim-tree',
            'toggleterm'
          },
          refresh = {
            statusline = 250,
          },
          always_divide_middle = false, -- not sure what this does
        },
        sections = {
            lualine_a = {'mode'},
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
          },
          inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {'filename'},
            lualine_x = {'location'},
            lualine_y = {},
            lualine_z = {}
          },
      }
    end,
  },

}
