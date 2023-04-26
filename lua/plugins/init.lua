return {
  -- STARTUP
  {
    'goolord/alpha-nvim',
    config = function()
      local status_ok, alpha = pcall(require, "alpha")
      if not status_ok then
        return
      end

      local path_ok, path = pcall(require, "plenary.path")
      if not path_ok then
        return
      end

      local dashboard = require("alpha.themes.dashboard")
      local nvim_web_devicons = require "nvim-web-devicons"
      local cdir = vim.fn.getcwd()

      local function get_extension(fn)
        local match = fn:match("^.+(%..+)$")
        local ext = ""
        if match ~= nil then
          ext = match:sub(2)
        end
        return ext
      end

      local function footer()
        local total_plugins = require("lazy").stats().count
        local plugin_time = require("lazy").stats().startuptime
        local date = os.date("%d-%m-%y")
        local time = os.date("%h:%m:%s")
        return "[CoreVim loaded  " .. total_plugins .. " plugins in " .. plugin_time .. " ms.]" -- [ " .. date .. "] [ " .. time .. "]"
      end

      local function icon(fn)
        local nwd = require("nvim-web-devicons")
        local ext = get_extension(fn)
        return nwd.get_icon(fn, ext, { default = true })
      end

      local function file_button(fn, sc, short_fn)
        short_fn = short_fn or fn
        local ico_txt
        local fb_hl = {}

        local ico, hl = icon(fn)
        local hl_option_type = type(nvim_web_devicons.highlight)
        if hl_option_type == "boolean" then
          if hl and nvim_web_devicons.highlight then
            table.insert(fb_hl, { hl, 0, 1 })
          end
        end
        if hl_option_type == "string" then
          table.insert(fb_hl, { nvim_web_devicons.highlight, 0, 1 })
        end
        ico_txt = ico .. "  "

        local file_button_el = dashboard.button(sc, ico_txt .. short_fn, "<cmd>e " .. fn .. " <cr>")
        local fn_start = short_fn:match(".*/")
        if fn_start ~= nil then
          table.insert(fb_hl, { "type", #ico_txt - 2, #fn_start + #ico_txt - 2 })
        end
        file_button_el.opts.hl = fb_hl
        return file_button_el
      end

      local default_mru_ignore = { "gitcommit" }

      local mru_opts = {
        ignore = function(path, ext)
          return (string.find(path, "commit_editmsg")) or (vim.tbl_contains(default_mru_ignore, ext))
        end,
      }

      -- @param start number
      -- @param cwd string optional
      -- @param items_number number optional number of items to generate, default = 10
      local function mru(start, cwd, items_number, opts)
        opts = opts or mru_opts
        items_number = items_number or 9

        local oldfiles = {}
        for _, v in pairs(vim.v.oldfiles) do
          if #oldfiles == items_number then
            break
          end
          local cwd_cond
          if not cwd then
            cwd_cond = true
          else
            cwd_cond = vim.startswith(v, cwd)
          end
          local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
          if (vim.fn.filereadable(v) == 1) and cwd_cond and not ignore then
            oldfiles[#oldfiles + 1] = v
          end
        end

        local special_shortcuts = {}
        local target_width = 35

        local tbl = {}
        for i, fn in ipairs(oldfiles) do
          local short_fn
          if cwd then
            short_fn = vim.fn.fnamemodify(fn, ":.")
          else
            short_fn = vim.fn.fnamemodify(fn, ":~")
          end

          if(#short_fn > target_width) then
            short_fn = path.new(short_fn):shorten(1, {-2, -1})
            if(#short_fn > target_width) then
              short_fn = path.new(short_fn):shorten(1, {-1})
            end
          end

          local shortcut = ""
          if i <= #special_shortcuts then shortcut = special_shortcuts[i]
          else
            shortcut = tostring(i + start - 1 - #special_shortcuts)
          end

          local file_button_el = file_button(fn, " " .. shortcut, short_fn)
          tbl[i] = file_button_el
        end
        return {
          type = "group",
          val = tbl,
          opts = {},
        }
      end

      local logo = {
       [[███╗ ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
       [[████╗██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
       [[██╔████║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
       [[██║╚███║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
       [[██║ ╚██║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
       [[╚═╝  ╚═╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
      }

      local section_header = {
        type = "text",
        val = logo,
        opts = {
          hl = "operator",
          shrink_margin = false,
          position = "center",
        }
      }

      local section_mru = {
        type = "group",
        val = {
          {
            type = "text",
            val = "recent files",
            opts = {
              hl = "constant",
              shrink_margin = false,
              position = "center",
            },
          },
          { type = "padding", val = 1 },
          {
            type = "group",
            val = function()
              return { mru(1, cdir, 9) }
            end,
            opts = { shrink_margin = false },
          },
        }
      }

      local buttons = {
        type = "group",
        val = {
          { type = "text", val = "quick links", opts = { hl = "constant", position = "center" } },
          { type = "padding", val = 1 },
          dashboard.button("e", "  new file", ":ene <bar> startinsert <cr>"),
          dashboard.button("o", "ﭯ  recently opened files", ":telescope oldfiles<cr>"),
          dashboard.button("f", "  find file", ":lua require('telescope.builtin').find_files()<cr>"),
          --dashboard.button("p", "  find project", ":telescope repo list<cr>"),
          dashboard.button("r", "  find word", ":lua require('telescope.builtin').live_grep()<cr>"),
          --dashboard.button("g", "  find modified file", ":lua require('config.plugins.telescope').my_git_status()<cr>"),
          dashboard.button("m", "  show mark", ":telescope marks"),
          --dashboard.button("t", "  show todo", ":todotelescope<cr>"),
          dashboard.button("s", "  corevim plugins", ":e ~/.config/nvim/lua/plugins.lua<cr>"),
          -- dashboard.button("u", "  sync plugins", ":packersync<cr>"),
          --dashboard.button("l", "  lazy", ":lazy<cr>"),
          dashboard.button("u", "  sync plugins", ":Lazy sync<cr>"),
          dashboard.button("h", "  neovim check health", ":checkhealth<cr>"),
          dashboard.button("q", "  quit", "<cmd>qa<cr>")
        },
        position = "center",
      }

      local section_footer = {
        type = "group",
        val = {
          { type = "text", val = footer(), opts = { hl = "constant", position = "center" } },
        }
      }

      local opts = {
        layout = {
          { type = "padding", val = 2 },
          section_header,
          { type = "padding", val = 2 },
          section_mru,
          { type = "padding", val = 2 },
          buttons,
          { type = "padding", val = 2 },
          section_footer,
        },
        opts = {
          margin = 5,
        },
      }

      alpha.setup(opts)
    end,
},
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
