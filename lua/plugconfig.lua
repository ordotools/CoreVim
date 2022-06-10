require('configs.nvimtree')
require('configs.neoformat')
require('configs.catppuccin')

--VimTeX
vim.g.vimtex_view_method = 'skim'

--Nightfly
vim.g.nightflyCursorColor = 1
vim.g.nightflyItalics = 1
vim.g.nightflyTransparent = 0
vim.g.nightflyUnderlineMatchParen = 1
vim.g.nightflyWinSeparator = 2
vim.opt.fillchars = { horiz = '━', horizup = '┻', horizdown = '┳', vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋', }

--OneDarkPro
vim.o.background = "dark" -- to load onedark
--require("onedarkpro").load() -- make it only load if it is used?

--Treesitter
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all",
  sync_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {"latex"}, -- this is handled by vimtex
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
    separator_style = 'slant', --thick, thin, padded_slant
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

-- max line length for tex, text, and markdown
--vim.cmd([[
--augroup my_textwidth
--au!
--autocmd FileType text,markdown,tex setlocal textwidth=80
--augroup END
--]])
local augroup = vim.api.nvim_create_augroup('my_textwidth', {clear = true})

vim.api.nvim_create_autocmd('FileType', {
  pattern = 'text,markdown,tex',
  group = augroup,
  command = 'setlocal textwidth=80'
})

--GitSigns
require('gitsigns').setup()

--Dashboard
vim.g.dashboard_default_executive = 'telescope'

--IndentBlankline
require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
}

--Better Comments
local HighlightTags = {}
HighlightTags["!"] = {guifg='#ff2d00'}
HighlightTags["?"] = {guifg='#1f98ff'}
HighlightTags["todo"] = {guifg='#ff8c00'}
HighlightTags["TODO"] = {guifg='#ff8c00'}
HighlightTags["*"] = {guifg='#98C379'}
vim.g.highlightTags = HighlightTags
