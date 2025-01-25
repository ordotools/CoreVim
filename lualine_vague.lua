local colors = {
	-- floatBorder = "#878787",
	-- line = "#282830",
	-- comment = "#646477",
	-- builtin = "#bad1ce",
	-- func = "#be8c8c",
	-- string = "#deb896",
	-- property = "#c7c7d4",
	-- parameter = "#b9a3ba",
	-- visual = "#363738",
	-- operator = "#96a3b2",
	-- keyword = "#7894ab",
	-- type = "#a1b3b9",

	bg         = "#18191a",
	fg         = "#cdcdcd",
    purple     = "#b4b4ce",
	gold       = "#d2a374",
	red        = "#d2788c",
	warning    = "#e6be8c",
	periwinkle = "#8ca0dc",
	slate      = "#465362",
	green      = "#8faf77",
	yellow     = "#e6be8c",
}

return {
  normal = {
    a = {bg = colors.green, fg = colors.bg, gui = 'bold'},
    b = {bg = colors.slate, fg = colors.green},
    c = {bg = colors.bg, fg = colors.fg}
  },
  insert = {
    a = {bg = colors.purple, fg = colors.bg, gui = 'bold'},
    b = {bg = colors.slate, fg = colors.purple},
    c = {bg = colors.bg, fg = colors.fg}
  },
  visual = {
    a = {bg = colors.gold, fg = colors.bg, gui = 'bold'},
    b = {bg = colors.slate, fg = colors.gold},
    c = {bg = colors.bg, fg = colors.fg}
  },
  replace = {
    a = {bg = colors.red, fg = colors.bg, gui = 'bold'},
    b = {bg = colors.slate, fg = colors.red},
    c = {bg = colors.bg, fg = colors.fg}
  },
  command = {
    a = {bg = colors.periwinkle, fg = colors.bg, gui = 'bold'},
    b = {bg = colors.slate, fg = colors.periwinkle},
    c = {bg = colors.bg, fg = colors.fg}
  },
  inactive = {
    a = {bg = colors.slate, fg = colors.bg, gui = 'bold'},
    b = {bg = colors.slate, fg = colors.fg},
    c = {bg = colors.bg, fg = colors.fg}
  }
}
