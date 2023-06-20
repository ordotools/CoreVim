return {

  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
    end,
    config = function ()

      local wk = require("which-key")

      wk.register({

        f = {
          name = "  Search",
          f = {"<cmd>Telescope find_files<cr>", "Find File"},
          g = {"<cmd>Telescope live_grep<cr>", "Live Grep"},
          h = {"<cmd>Telescope help_tags<cr>", "Search Help Tags"},
          b = {"<cmd>Telescope buffers<cr>", "Search Buffers"},
          t = {"<cmd>TodoTelescope keywords=TODO,FIX<cr>", "Search TODOs"},
        },

        g = {
          name = "  Git",
          -- mode = "nv",
          d = {":diffget //3<cr>", "Diff"},
          -- a = {":G add .<cr>", "Add"},
          c = {":G commit -m ''<left>", "Commit", noremap=true},
          p = {":G push<cr>", "Push"},
          l = {":G pull<cr>", "Pull"},
          s = {":G<cr>", "Command"},

          i = {
            name = "  Gist",
            i = {"<cmd>GistCreate<cr>", "Gist from Selection", mode="v"},
            f = {"<cmd>GistCreateFromFile<cr>", "Gist from File", mode="n"},
            l = {"<cmd>GistsList<cr>", "Gist List", mode="n"},
          },

        },

        t = {"<cmd>TodoQuickFix<cr>", "TODO Quick Fix"},

        x = {
          name = "  LaTeX",
          b = {'c\textbf{<cr>"}<esc>', "Bold", noremap=false},
          i = {'c\textbf{<cr>"}<esc>', "Italic", noremap=false}
        },

        s = {":%s//g<left><left>", "Search & Replace in File", noremap=true},

      },{ -- opts

          prefix = "<leader>"

        })

    end,
  }

}
