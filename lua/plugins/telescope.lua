return {
  {
    'nvim-telescope/telescope.nvim',
    -- branch = '0.1.1',
    version = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      require('telescope').setup{
        pickers = {
          find_files = {
            theme = "dropdown",
          }
        },
      }
    end
  },
}
