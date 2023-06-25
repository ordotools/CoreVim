return {
  {
    'nvim-telescope/telescope.nvim',
    -- branch = '0.1.1',
    version = false,
    lazy = true,
    event = "VeryLazy",
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      require('telescope').setup{
        -- local actions = require("telescope.actions")
        -- defaults = {
        --   mappings = {
        --     i {
        --       ["<esc>"] = actions.close,
        --     },
        --   },

        -- },
        pickers = {
          find_files = {
            theme = "dropdown",
          }
        },
        extensions = {

        },
      }
    end
  },
}
