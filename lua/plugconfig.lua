require("configs.nvimtree")
--require("configs.neoformat")
require("configs.catppuccin")
require("configs.start-screen")
--require("configs.colors")
--require("configs.feline_config.init")
require("user.ui.lualine")

--require('lualine').setup {
	--option = {
		--theme = 'onedark'
	--},
--}

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

--Treesitter
require("nvim-treesitter.configs").setup({
	ensure_installed = "python html css javascript lua toml",
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

-- Bufferline
require("bufferline").setup({
	options = {
		separator_style = "thick", --thick, thin, slant, padded_slant
		indicator_icon = "▎",
		buffer_close_icon = "",
		modified_icon = "●",
		close_icon = "",
		left_trunc_marker = "",
		right_trunc_marker = "",
		offsets = { { filetype = "NvimTree", text = "Explorer", padding = 1 } },
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

--Trouble
require("trouble").setup({
	position = "bottom", -- position of the list can be: bottom, top, left, right
	height = 10, -- height of the trouble list when position is top or bottom
	width = 50, -- width of the list when position is left or right
	icons = true, -- use devicons for filenames
	mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
	fold_open = "", -- icon used for open folds
	fold_closed = "", -- icon used for closed folds
	group = true, -- group results by file
	padding = true, -- add an extra new line on top of the list
	action_keys = { -- key mappings for actions in the trouble list
		-- map to {} to remove a mapping, for example:
		-- close = {},
		close = "q", -- close the list
		cancel = "<esc>", -- cancel the preview and get back to your last window / buffer / cursor
		refresh = "r", -- manually refresh
		jump = { "<cr>", "<tab>" }, -- jump to the diagnostic or open / close folds
		open_split = { "<c-x>" }, -- open buffer in new split
		open_vsplit = { "<c-v>" }, -- open buffer in new vsplit
		open_tab = { "<c-t>" }, -- open buffer in new tab
		jump_close = { "o" }, -- jump to the diagnostic and close the list
		toggle_mode = "m", -- toggle between "workspace" and "document" diagnostics mode
		toggle_preview = "P", -- toggle auto_preview
		hover = "K", -- opens a small popup with the full multiline message
		preview = "p", -- preview the diagnostic location
		close_folds = { "zM", "zm" }, -- close all folds
		open_folds = { "zR", "zr" }, -- open all folds
		toggle_fold = { "zA", "za" }, -- toggle fold of current file
		previous = "k", -- preview item
		next = "j", -- next item
	},
	indent_lines = true, -- add an indent guide below the fold icons
	auto_open = false, -- automatically open the list when you have diagnostics
	auto_close = false, -- automatically close the list when you have no diagnostics
	auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
	auto_fold = false, -- automatically fold a file trouble list at creation
	auto_jump = { "lsp_definitions" }, -- for the given modes, automatically jump if there is only a single result
	signs = {
		-- icons / text used for a diagnostic
		error = "",
		warning = "",
		hint = "",
		information = "",
		other = "﫠",
	},
	--use_diagnostic_signs = false, -- enabling this will use the signs defined in your lsp client
})

--IndentBlankline
require("indent_blankline").setup({
	show_current_context = true,
	show_current_context_start = true,
})
