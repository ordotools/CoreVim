require("configs.nvimtree")
--require("configs.neoformat")
require("configs.catppuccin")

--VimTeX
vim.g.vimtex_view_method = "skim"
vim.g.vimtex_compiler_engine = "lualatex"
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_quickfix_ignore_filters = {
	'Underfull \\hbox (badness [0-9]*) in ',
	'Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in ',
	'Overfull \\vbox ([0-9]*.[0-9]*pt too high) detected ',
	'Package hyperref Warning: Token not allowed in a PDF string',
	'Package typearea Warning: Bad type area settings!',
}

--Nightfly
vim.g.nightflyCursorColor = 1
vim.g.nightflyItalics = 1
vim.g.nightflyTransparent = 0
vim.g.nightflyUnderlineMatchParen = 1
vim.g.nightflyWinSeparator = 2
vim.opt.fillchars = {
	horiz = "━",
	horizup = "┻",
	horizdown = "┳",
	vert = "┃",
	vertleft = "┫",
	vertright = "┣",
	verthoriz = "╋",
}

--OneDarkPro
vim.o.background = "dark" -- to load onedark
--require("onedarkpro").load() -- make it only load if it is used?

--Telescope
require('telescope').setup{
  defaults = {
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  },
  extensions = {
  }
}
require('telescope').load_extension('projects')

--Treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = "all",
	sync_install = true,
	ignore_install = {},
	highlight = {
		enable = true,
		disable = { "latex" }, -- this is handled by vimtex
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
		disable = { "python" },
	},
})

vim.cmd([[
""echo nvim_treesitter#statusline(90)  " 90 can be any length
]])

--vim.opt.foldmethod = "expr"
--vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

-- Feline
require("feline").setup({
	components = require("catppuccin.core.integrations.feline"),
})

-- Bufferline
require("bufferline").setup({
	options = {
		separator_style = "thin", --thick, thin, slant, padded_slant
		indicator_icon = "▎",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
		show_close_icon = false,
	},
})

local augroup = vim.api.nvim_create_augroup("my_textwidth", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "text,markdown,tex",
	group = augroup,
	command = "setlocal textwidth=80",
})

--GitSigns
require("gitsigns").setup({
	signs = {
		add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
		change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
		delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
		changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
	},
})

--Dashboard
vim.g.dashboard_default_executive = "telescope"

--IndentBlankline
require("indent_blankline").setup({
	show_current_context = true,
	show_current_context_start = true,
})

-- Project_Nvim
local project_nvim = require("project_nvim")
local recent_projects = project_nvim.get_recent_projects()

print(vim.inspect(recent_projects))
