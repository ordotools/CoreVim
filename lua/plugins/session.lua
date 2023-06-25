return {

  {
    'rmagatti/auto-session',
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = {
          "~/",
          "~/Projects",
          "~/Downloads",
          "~/.config/nvim/*", -- FIX: this is not working
          "/",
      },
        post_cwd_changed_hook = function()
          require("lualine").refresh()
        end,
      }
    end,
  },

}
