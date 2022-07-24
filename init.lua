local set = vim.opt

set.expandtab = true
set.exrc = true
set.hidden = true
set.incsearch = true
set.backup = false
set.errorbells = false
set.hlsearch = false
set.showmode = false
set.swapfile = false
set.wrap = false
set.nu = true
set.relativenumber = true
set.cursorline = true
set.cursorlineopt = "number"
set.scrolloff = 8
set.shiftwidth = 4
set.signcolumn = "yes"
set.smartindent = true
set.tabstop = 4
set.softtabstop = 4
set.termguicolors = true
set.undofile = true
set.wildmenu = true
vim.g.python3_host_prog = "~/.config/nvim/nvimpyenv/bin/python"
vim.g.mapleader = " "
vim.g.syntax = true
vim.o.updatetime = 250
set.termguicolors = true
--set.cmdheight = 0

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	command = "setlocal formatoptions-=c formatoptions-=r formatoptions-=o",
})

vim.api.nvim_create_autocmd("CursorHold,CursorHoldI", {
	pattern = "*",
	command = "lua vim.diagnostic.open_float(nil, {focus=false})",
})

require("plugins")
require("plugconfig")
require("keymapping")
require("lsp-config")
require("cmp-config")

-- catppuccin, onedarkpro, nightfly, onedark
require('onedark').setup {
    style = 'warmer'
}
require('onedark').load()
