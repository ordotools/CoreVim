--VimTeX
vim.g.vimtex_view_method = 'skim'

--Nightfly
--vim.g.nightflyCursorColor = 1
--vim.g.nightflyItalics = 1
--vim.g.nightflyTransparent = 0
--vim.g.nightflyUnderlineMatchParen = 1
--vim.g.nightflyWinSeparator = 2
--vim.opt.fillchars = { horiz = '━', horizup = '┻', horizdown = '┳', vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋', }

--OneDarkPro
--vim.o.background = "dark" -- to load onedark
--require("onedarkpro").load()

--Treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  sync_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {"latex"},
    additional_vim_regex_highlighting = false,
  },
  indent = {
      enable = true,
  }
}
--vim.opt.foldmethod = "expr"
--vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Feline
require('feline').setup({
	components = require('catppuccin.core.integrations.feline'),
})

-- Bufferline
require('bufferline').setup{
    options = {
        separator_style = 'thick',
        indicator_icon = '▎',
        buffer_close_icon = '',
        modified_icon = '●',
        close_icon = '',
        left_trunc_marker = '',
        right_trunc_marker = '',
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        show_close_icon = false,
    }
}

-- nvimTree
vim.cmd([[
nnoremap <leader>n :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>q :NvimTreeFindFile<CR>
]])

require'nvim-tree'.setup {
  auto_reload_on_write = true,
  create_in_closed_folder = false,
  disable_netrw = false,
  hijack_cursor = true,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = true,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  reload_on_bufenter = true,
  respect_buf_cwd = false,
  view = {
    adaptive_size = false,
    width = 30,
    height = 30,
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
  renderer = {
    add_trailing = false,
    group_empty = false,
    highlight_git = false,
    highlight_opened_files = "none",
    root_folder_modifier = ":~",
    indent_markers = {
      enable = true,
      icons = {
        corner = "└ ",
        edge = "│ ",
        --item = "│ ",
        none = "  ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_cwd = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = true,
    show_on_dirs = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {},
    exclude = {},
  },
  git = {
    enable = true,
    ignore = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
    },
    open_file = {
      quit_on_open = true,
      resize_window = true,
      window_picker = {
        enable = true,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = "trash",
    require_confirm = true,
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      diagnostics = false,
      git = false,
      profile = false,
      --watcher = false,
    },
  },
}

vim.cmd([[
highlight NvimTreeFolderIcon guibg=blue
]])

--Catppuccin
local catppuccin = require("catppuccin")

catppuccin.setup {
    transparent_background = false,
    integration = {
        gitsigns = true,
        nvimtree = {
            enabled = true,
            show_root = true,         -- makes the root folder not transparent
            transparent_panel = true, -- make the panel transparent
          },
          native_lsp = {
            enabled = true,
            virtual_text = {
                errors = "italic",
                hints = "italic",
                warnings = "italic",
                information = "italic",
            },
            underlines = {
                errors = "underline",
                hints = "underline",
                warnings = "underline",
                information = "underline",
            },
        },
        bufferline = true,
    }
}
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha

--Deoplete
--vim.cmd([[
--inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
--call deoplete#custom#var('tabnine', { 'line_limit': 500, 'max_num_results': 5, })
--]])

-- max line length for tex, text, and markdown
vim.cmd([[
augroup my_textwidth
au!
autocmd FileType text,markdown,tex setlocal textwidth=80
augroup END
]])

--GitGutter
--vim.cmd([[
--set updatetime=100 "TODO there should be a better place for this
--highlight GitGutterAdd    guifg=#009900 ctermfg=2
--highlight GitGutterChange guifg=#bbbb00 ctermfg=3
--highlight GitGutterDelete guifg=#ff2222 ctermfg=1
--"GitGutterAddLineNr          " default: links to CursorLineNr
--"GitGutterChangeLineNr       " default: links to CursorLineNr
--"GitGutterDeleteLineNr       " default: links to CursorLineNr
--"GitGutterChangeDeleteLineNr " default: links to CursorLineNr
--]])

--GitSigns
require('gitsigns').setup()

