return {

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

}
