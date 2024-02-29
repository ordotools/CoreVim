return {

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
    'rebelot/kanagawa.nvim',
    lazy = true,
    config = function()
      require('kanagawa').setup {
        compile = false,             -- enable compiling the colorscheme
        undercurl = true,            -- enable undercurls
        commentStyle = { italic = true },
        functionStyle = {},
        keywordStyle = { italic = true},
        statementStyle = { bold = true },
        typeStyle = {},
        transparent = true,          -- do not set background color
        dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
        terminalColors = true,       -- define vim.g.terminal_color_{0,17}
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none"
              }
            }
          }
        },
        theme = "wave",            -- Load "wave" theme when 'background' option is not set
        background = {               -- map the value of 'background' option to a theme
          dark = "dragon",           -- try "dragon" !
          light = "lotus"
        },
      }
    end,
  },

  {
    'sainnhe/gruvbox-material',
    lazy = true,
  },

  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },

  {
    'catppuccin/nvim',
    lazy = true,
    name = 'catppuccin'
  },

  {
    'savq/melange-nvim',
    lazy = true,
  },

  {
    'ramojus/mellifluous.nvim',
    lazy = true,
    config = function()
      require'mellifluous'.setup({ --[[...]] }) -- optional, see configuration section.
      -- vim.cmd('colorscheme mellifluous')
    end,
  },
  -- {
  --   'svermeulen/text-to-colorscheme.nvim'
  -- },

}
