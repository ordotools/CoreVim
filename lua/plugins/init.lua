return {
  {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v2.x',
      dependencies = {
        -- LSP Support
        {'neovim/nvim-lspconfig'},             -- Required
        {                                      -- Optional
          'williamboman/mason.nvim',
          build = function()
            pcall(vim.cmd, 'MasonUpdate')
          end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
      }
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

  -- {
  --   'windwp/nvim-ts-autotag',
  --   event = 'BufEnter',
  -- },

  {
    'tpope/vim-sleuth',
    event = 'BufEnter',
  },

  {
    'alvan/vim-closetag',
    event = 'BufEnter',
  },

}
