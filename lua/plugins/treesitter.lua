return {

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
        auto_install = true,
        highlight = {
          enable = true,
          disable = "tex",
        },
        indent = {
          enable = true,
        },
        parser_install_dir = nil,
      }
    end,
  },


}
