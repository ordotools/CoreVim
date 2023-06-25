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
          lualine_a = {
            {
              'branch',
              icon = ''
            }
          },
          lualine_b = {
            {
              'diagnostics',
              symbols = {
                error = '✘ ',
                warn = '▲ ',
                hint = '⚑ ',
                info = '» '
              },
              update_in_insert = true,
              always_visible = false,
            },
          },
          lualine_c = {
            {
              'filename',
              separator = {right = '',},
              symbols = {
                modified = '+',
                readonly = '-',
                unnamed = '',
                newfile = '[New]',
              }
            },
            {
              require('auto-session.lib').current_session_name,
              -- separator = {right = '', left = ''},
              -- separator = {right = '', left = ''},
              separator = {right = '', left = '>'},
              -- color = "lualine_filename_normal"
            },
          },
          lualine_x = {
            'filetype'
          },
          lualine_y = {
            {
              'diff',
              always_visible = true,
            }
          },
          lualine_z = {'mode'}
        },
      }
    end,
  },

}
  -- {
  --   'freddiehaddad/feline.nvim',
  --   dependencies = { "lewis6991/gitsigns.nvim", "folke/noice.nvim" },
  --         -- require('feline').setup()
  --     -- require('feline').winbar.setup()
  --     -- require('feline').statuscolumn.setup()
  --   end,
  -- }

