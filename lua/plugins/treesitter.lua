return {

  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    priority = 1000,
    config = function ()
      require('nvim-treesitter.configs').setup {
        ensure_isntalled = {"lua", "python", "html"},
        auto_install = true,
        highlight = {
          enable = true,
        },
      }
    end,
  },

  'nvim-treesitter/playground',

  'nvim-treesitter/nvim-treesitter-context',

}
