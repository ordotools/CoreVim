return {

  {
    'nvim-telescope/telescope.nvim',
    -- branch = '0.1.1',
    version = false,
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- TERMINAL
  {
    'akinsho/toggleterm.nvim',
    config = function()
      require("toggleterm").setup{
          open_mapping = [[||]],
          hide_numbers = true,
          direction = "float",
      }
    end,
  },

  'gelguy/wilder.nvim',
  'windwp/nvim-ts-autotag',

  -- SHIFTS vs TABS
  'tpope/vim-sleuth',
  'Bekaboo/deadcolumn.nvim',

  -- SURROUNDS
  'tpope/vim-surround',
  'alvan/vim-closetag',
  'windwp/nvim-autopairs',

  -- COMMENTS
  'tpope/vim-commentary',
  {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {
      }
    end
  },

  -- OTHER
  -- 'mbbill/undotree',

}
