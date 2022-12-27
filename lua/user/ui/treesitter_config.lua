require("nvim-treesitter.configs").setup({
	ensure_installed = "",
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
