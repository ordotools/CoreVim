require("bufferline").setup({
	options = {
		separator_style = "slant", --thick, thin, slant, padded_slant
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
