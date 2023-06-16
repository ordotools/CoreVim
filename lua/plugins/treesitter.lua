return {

  {
    'nvim-treesitter/nvim-treesitter',
    lazy = false,
    version = nil,
    priority = 1000,
    config = function ()
      require('nvim-treesitter.configs').setup {
        ensure_installed = {"lua", "python", "html"},
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
