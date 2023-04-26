return {
  -- STARTUP
 -- 'lewis6991/impatient.nvim',

  -- THEMES
  {
      'rebelot/kanagawa.nvim',
      config = function()
        require('kanagawa').setup {
          compile = false,             -- enable compiling the colorscheme
          undercurl = true,            -- enable undercurls
          commentStyle = { italic = true },
          functionStyle = {},
          keywordStyle = { italic = true},
          statementStyle = { bold = true },
          typeStyle = {},
          transparent = true,          -- do not set background color
          dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
          terminalColors = true,       -- define vim.g.terminal_color_{0,17}
          colors = {
            theme = {
              all = {
                ui = {
                  bg_gutter = "none"
                }
              }
            }
          },
          theme = "wave",            -- Load "wave" theme when 'background' option is not set
          background = {               -- map the value of 'background' option to a theme
            dark = "dragon",           -- try "dragon" !
            light = "lotus"
        },
      }
    end,
  },

  -- SYNTAX HIGHLIGHTING
  'nvim-treesitter/nvim-treesitter',
  'nvim-treesitter/playground',
  'nvim-treesitter/nvim-treesitter-context',
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {
       respect_buf_cwd = true,
       update_cwd = true,
       update_focused_file = {
         enable = true,
         update_cwd = true
       },
       auto_reload_on_write = true,
       create_in_closed_folder = false,
       disable_netrw = false,
       hijack_cursor = true,
       hijack_netrw = true,
       hijack_unnamed_buffer_when_opening = false,
       -- ignore_buffer_on_setup = false,
       -- open_on_setup = true,
       -- open_on_setup_file = false,
       open_on_tab = false,
       sort_by = "name",
       reload_on_bufenter = true,
       view = {
         adaptive_size = false,
         width = 30,
         -- height = 30,
         hide_root_folder = false,
         side = "left",
         preserve_window_proportions = false,
         number = false,
         relativenumber = false,
         signcolumn = "yes",
         mappings = {
           custom_only = false,
           list = {
           },
         },
       },
      --  renderer = {
      --    add_trailing = false,
      --    group_empty = false,
      --    highlight_git = false,
      --    highlight_opened_files = "none",
      --    root_folder_modifier = ":~",
      --    indent_markers = {
      --      enable = true,
      --      icons = {
      --        corner = "└ ",
      --        edge = "│ ",
      --        --item = "│ ",
      --        none = "  ",
      --      },
      --    },
      --    icons = {
      --      webdev_colors = true,
      --      git_placement = "before",
      --      padding = " ",
      --      symlink_arrow = " ➛ ",
      --      show = {
      --        file = true,
      --        folder = true,
      --        folder_arrow = true,
      --        git = true,
      --      },
      --      glyphs = {
      --        default = "",
      --        symlink = "",
      --        folder = {
      --          arrow_closed = "",
      --          arrow_open = "",
      --          default = "",
      --          open = "",
      --          empty = "",
      --          empty_open = "",
      --          symlink = "",
      --          symlink_open = "",
      --        },
      --        git = {
      --          unstaged = "✗",
      --          staged = "✓",
      --          unmerged = "",
      --          renamed = "➜",
      --          untracked = "★",
      --          deleted = "",
      --          ignored = "◌",
      --        },
      --      },
      --    },
      --    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
      --  },
      --  hijack_directories = {
      --    enable = true,
      --    auto_open = true,
      --  },
      --  ignore_ft_on_setup = {},
      --  system_open = {
      --    cmd = "",
      --    args = {},
      --  },
      --  diagnostics = {
      --    enable = true,
      --    show_on_dirs = true,
      --    icons = {
      --      hint = "",
      --      info = "",
      --      warning = "",
      --      error = "",
      --    },
      --  },
      --  filters = {
      --    dotfiles = false,
      --    custom = {},
      --    exclude = {},
      --  },
      --  git = {
      --    enable = true,
      --    ignore = true,
      --    timeout = 400,
      --  },
      --  actions = {
      --    expand_all = {
      --      max_folder_discovery = 300,
      --    },
      --    open_file = {
      --      quit_on_open = true,
      --      resize_window = true,
      --      window_picker = {
      --        enable = true,
      --        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
      --        exclude = {
      --          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
      --          buftype = { "nofile", "terminal", "help" },
      --        },
      --      },
      --    },
      --    remove_file = {
      --      close_window = true,
      --    },
      --  },
      --  trash = {
      --    cmd = "trash",
      --    require_confirm = true,
      --  },
      --  live_filter = {
      --    prefix = "[FILTER]: ",
      --    always_show_folders = true,
      --  },

      }
    end,
  },

  {
    'nvim-telescope/telescope.nvim', branch = '0.1.1',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  -- STATUSLINE
  {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
      config = function()
          require('lualine').setup {
              options = {
                  theme = 'auto', -- kanagawa
                  section_separators = { left = '', right = '' },
                  component_separators = { left = '', right = '' },
                  extensions = {
                      'fugitive',
                      'nvim-tree',
                      'toggleterm'
                  }
              }
          }
      end,
  },
  {
      "SmiteshP/nvim-navic",
      requires = "neovim/nvim-lspconfig"
  },

  -- TERMINAL
  {
    'akinsho/toggleterm.nvim',
    -- tag = '*',
  },

  -- COMPLETION
  --
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    dependencies = {
      -- LSP Support
      {'neovim/nvim-lspconfig'},             -- Required
      {                                      -- Optional
      'williamboman/mason.nvim',
      build = function()
        pcall(vim.cmd, 'MasonUpdate')
      end,
    },
    {'williamboman/mason-lspconfig.nvim'}, -- Optional
    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  },
  config = function()
    local lsp = require('lsp-zero').preset({})

    lsp.on_attach(function(client, bufnr)
      lsp.default_keymaps({buffer = bufnr})
    end)

    -- (Optional) Configure lua language server for neovim
    require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

    lsp.setup()
    -- Make sure you setup `cmp` after lsp-zero

    local cmp = require('cmp')
    local cmp_action = require('lsp-zero').cmp_action()

    cmp.setup({
      mapping = {
        -- `Enter` key to confirm completion
        ['<CR>'] = cmp.mapping.confirm({select = false}),

        -- Ctrl+Space to trigger completion menu
        ['<C-Space>'] = cmp.mapping.complete(),

        -- Navigate between snippet placeholder
        ['<C-f>'] = cmp_action.luasnip_jump_forward(),
        ['<C-b>'] = cmp_action.luasnip_jump_backward(),
      }
    })
  end,
},
-- {
--   'VonHeikemen/lsp-zero.nvim',
--   requires = {
--     -- LSP Support
--     {'neovim/nvim-lspconfig'},
--     {'williamboman/mason.nvim'},
--     {'williamboman/mason-lspconfig.nvim'},

  --     -- Autocompletion
  --     {'hrsh7th/nvim-cmp'},
  --     {'hrsh7th/cmp-buffer'},
  --     {'hrsh7th/cmp-path'},
  --     {'saadparwaiz1/cmp_luasnip'},
  --     {'hrsh7th/cmp-nvim-lsp'},
  --     {'hrsh7th/cmp-nvim-lua'},

  --     -- Snippets
  --     {'L3MON4D3/LuaSnip'},
  --     {'rafamadriz/friendly-snippets'},
  --   }
  -- },
  'gelguy/wilder.nvim',
  'windwp/nvim-ts-autotag',

  -- GIT INTEGRATION
  'lewis6991/gitsigns.nvim',
  'tpope/vim-fugitive',
  'kdheepak/lazygit.nvim',

  -- SHIFTS vs TABS
  'tpope/vim-sleuth',
  'Bekaboo/deadcolumn.nvim', -- see the length of the current line with color

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
  'mbbill/undotree',

}
