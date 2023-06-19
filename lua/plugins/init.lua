return {

  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    lazy = true,
    event = "VeryLazy",
    dependencies = {                         -- LSP Support:
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
        'williamboman/mason.nvim',
        run = "MasonUpdate",
        config = function ()
          require("mason").setup({
            pip = {
              upgrade_pip = true,
            },
            ui = {
              icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
              }
            }
          })
        end,
      },
      {'williamboman/mason-lspconfig.nvim'}, -- Optional
      {'hrsh7th/nvim-cmp'},                  -- Required
      {'hrsh7th/cmp-nvim-lsp'},              -- Required
      {'L3MON4D3/LuaSnip'},                  -- Required
      {'hrsh7th/cmp-buffer'},
      {'hrsh7th/cmp-path'},
      {'hrsh7th/cmp-cmdline'},
    },
    config = function ()
      require('lsp')
    end
  },

  {
    "nvim-tree/nvim-web-devicons",
    lazy=true,
  },

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
    'windwp/nvim-ts-autotag',
    event = 'BufEnter',
  },

  {
    'tpope/vim-sleuth',
    event = 'BufEnter',
  },

  {
    'tpope/vim-surround',
    event = 'BufEnter',
  },

  {
    'alvan/vim-closetag',
    event = 'BufEnter',
  },

  {
    'windwp/nvim-autopairs',
    config = function ()
      require("nvim-autopairs").setup {
        ignored_next_char = "[%w%.]"
      }
    end,
    lazy = true,
    event = "VeryLazy",
  },

  {
    'tpope/vim-commentary',
    event = 'BufEnter',
  },

}
