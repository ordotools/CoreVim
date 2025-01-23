return {

  -- CONSIDERING:
  -- -- SmitheshP/nvim-navic -- Code context

  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function ()
      require('rose-pine').setup({
        disable_italics = true,
        highlight_groups = {
          -- these are my custom italicized highlight groups
          Comment = { italic = true },
          Keyword = { italic = true },
        }
      })
    end
  },

  {
    "vague2k/vague.nvim",
    config = function()
      require("vague").setup({
        -- optional configuration here
      })
    end
  },


  {
    'nvim-treesitter/nvim-treesitter',
    lazy = true,
    event = "VeryLazy",
    version = nil,
    requires = {
      'nvim-treesitter/playground',
      'nvim-treesitter/nvim-treesitter-context',
    },
    priority = 1000,
    config = function ()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {"lua", "python", "html"},
        ignore_installed = {"latex"},
        auto_install = true,
        highlight = {
          enable = true,
          disable = {
            -- "latex"
          },
        },
        indent = {
          enable = true,
        },
        parser_install_dir = nil,
      }
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = false
    },
    lazy = true,
    event = "VeryLazy",
    config = function()
      require('lualine').setup {
        options = {
          theme = 'auto',
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          extensions = {
            'fugitive',
            'toggleterm'
          },
          refresh = {
            statusline = 250,
          },
          always_divide_middle = false,
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


  -- terminal
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require("toggleterm").setup{
        open_mapping = [[||]],
        hide_numbers = true,
        direction = "float",
      }
    end,
    lazy = true,
    event = "VeryLazy",
  },

  {
    'tpope/vim-sleuth',
    event = 'BufEnter',
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { },
  },

  -- {
  --   'alvan/vim-closetag',
  --   event = 'BufEnter',
  -- },
}
