return {

  {
    'tpope/vim-fugitive',
    keys = {
      { "<leader>ga", ":G add .<cr>", desc = "Add" },
    },
  },

  {
    "Rawnly/gist.nvim",
    cmd = { "GistCreate", "GistCreateFromFile", "GistsList" },
    config = function ()
      require("gist").setup({
        private = false, -- All gists will be private, you won't be prompted again
        clipboard = "+", -- The registry to use for copying the Gist URL
        list = {
          mappings = {
            next_file = "<C-n>",
            prev_file = "<C-p>"
          }
        }
      })
    end,
    requires = {
      "samjwill/nvim-unception",
      init = function() vim.g.unception_block_while_host_edits = true end
    },
  },

  -- 'kdheepak/lazygit.nvim',

  {
    'lewis6991/gitsigns.nvim',
    config = function ()
      require('gitsigns').setup {
        signs = {
          add          = { text = '│' },
          change       = { text = '│' },
          delete       = { text = '_' },
          topdelete    = { text = '‾' },
          changedelete = { text = '~' },
          untracked    = { text = '┆' },
        },
        signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
        numhl      = false,  -- Toggle with `:Gitsigns toggle_numhl`
        linehl     = false,  -- Toggle with `:Gitsigns toggle_linehl`
        word_diff  = false,  -- Toggle with `:Gitsigns toggle_word_diff`
        watch_gitdir = {
          interval = 1000,
          follow_files = true
        },
        attach_to_untracked = true,
        current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
        current_line_blame_opts = { virt_text = true,
          virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
          delay = 1000,
          ignore_whitespace = false,
        },
        current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
        sign_priority = 6,
        update_debounce = 100,
        status_formatter = nil, -- Use default
        max_file_length = 40000, -- Disable if file is longer than this (in lines)
        preview_config = {
          -- Options passed to nvim_open_win
          border = 'single',
          style = 'minimal',
          relative = 'cursor',
          row = 0,
          col = 1
        },
        yadm = {
          enable = false
        },
      }
    end,
    lazy = false,
  }
}
