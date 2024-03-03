return {

  -- CONSIDERING:
  -- -- SmitheshP/nvim-navic -- Code context

  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function ()
      require('rose-pine').setup({
        disable_italics = true,
        highlight_groups = {
          -- these are my custom italicized highlight groups
          Comment = { italic = true },
          Keyword = { italic = true },
        }
      })
    end
  },


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
          -- disable = "tex", -- we might have to disable this for vimtex
        },
        indent = {
          enable = true,
        },
        parser_install_dir = nil,
      }
    end,
  },

  {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = false
    },
    lazy = true,
    event = "VeryLazy",
    config = function()
      require('lualine').setup {
        options = {
          theme = 'auto',
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' },
          extensions = {
            'fugitive',
            'nvim-tree',
            'toggleterm'
          },
          refresh = {
            statusline = 250,
          },
          always_divide_middle = false,
        },
        sections = {
          lualine_a = {'mode'},
          lualine_b = {'branch', 'diff', 'diagnostics'},
          lualine_c = {'filename'},
          lualine_x = {'encoding', 'fileformat', 'filetype'},
          lualine_y = {'progress'},
          lualine_z = {'location'}
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {'filename'},
          lualine_x = {'location'},
          lualine_y = {},
          lualine_z = {}
        },
      }
    end,
  },


  -- terminal
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

  {
    'tpope/vim-sleuth',
    event = 'BufEnter',
  },

  {
    'alvan/vim-closetag',
    event = 'BufEnter',
  },

  -- startup
  {
    "goolord/alpha-nvim",
    event = "VimEnter",
    opts = function()
      local dashboard = require("alpha.themes.dashboard")
      local logo = [[
      ███╗ ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗  
      ████╗██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║  
      ██╔████║█████╗  ██║   ██║██║   ██║██║██╔████╔██║  
      ██║╚███║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║  
      ██║ ╚██║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║  
      ╚═╝  ╚═╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝  
      ]]
      dashboard.section.header.val = vim.split(logo, "\n")
      dashboard.section.buttons.val = {
        dashboard.button("f", " " .. " Find file", ":Telescope find_files <CR>"),
        dashboard.button("n", " " .. " New file", ":ene <BAR> startinsert <CR>"),
        dashboard.button("r", " " .. " Recent files", ":Telescope oldfiles <CR>"),
        dashboard.button("g", " " .. " Find text", ":Telescope live_grep <CR>"),
        dashboard.button("c", " " .. " Config", ":e $MYVIMRC <CR>"),
        dashboard.button("s", "勒" .. " Restore Session", [[:lua require("persistence").load() <cr>]]),
        dashboard.button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
        dashboard.button("q", " " .. " Quit", ":qa<CR>"),
      }
      for _, button in ipairs(dashboard.section.buttons.val) do
        button.opts.hl = "AlphaButtons"
        button.opts.hl_shortcut = "AlphaShortcut"
      end
      dashboard.section.footer.opts.hl = "Type"
      dashboard.section.header.opts.hl = "AlphaHeader"
      dashboard.section.buttons.opts.hl = "AlphaButtons"
      dashboard.opts.layout[1].val = 8
      return dashboard
    end,
    config = function(_, dashboard)
      -- close Lazy and re-open when the dashboard is ready
      if vim.o.filetype == "lazy" then
        vim.cmd.close()
        vim.api.nvim_create_autocmd("User", {
          pattern = "AlphaReady",
          callback = function()
            require("lazy").show()
          end,
        })
      end

      require("alpha").setup(dashboard.opts)

      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          dashboard.section.footer.val = "⚡ Neovim loaded " .. stats.count .. " plugins in " .. ms .. "ms"
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },

}
