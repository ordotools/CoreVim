vim.g.vimtex_view_method = "skim"
vim.g.vimtex_compiler_engine = "lualatex"
vim.g.vimtex_quickfix_open_on_warning = 0
vim.g.vimtex_quickfix_ignore_filters = {
	-- BUG: These do not seem to be working
	'Underfull \\hbox (badness [0-9]*) in ',
	'Overfull \\hbox ([0-9]*.[0-9]*pt too wide) in ',
	'Overfull \\vbox ([0-9]*.[0-9]*pt too high) detected ',
	'Package hyperref Warning: Token not allowed in a PDF string',
	'Package typearea Warning: Bad type area settings!',
}
