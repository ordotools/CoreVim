vim.opt.expandtab = true
vim.opt.exrc = true
vim.opt.hidden = true
vim.opt.incsearch = true
vim.opt.backup = false
vim.opt.errorbells = false
vim.opt.hlsearch = false
vim.opt.laststatus = 3
vim.opt.incsearch = true
vim.opt.showmode = false
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.wildmenu = true
vim.g.python3_host_prog = "~/.config/nvim/nvimpyenv/bin/python"
vim.g.mapleader = " "
vim.g.syntax = true
vim.o.updatetime = 250
vim.opt.termguicolors = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.winbar = ' %t %p%% %M ' -- Lets try to make this better eventually.
--vim.opt.winbar = '%t %p%% %M%#TabLine#'

--vim.api.nvim_create_autocmd("FileType", {
	--pattern = "*",
	--command = "vim.opt.ocal formatoptions-=c formatoptions-=r formatoptions-=o",
--})

vim.api.nvim_create_autocmd("CursorHold,CursorHoldI", {
	pattern = "*",
	command = "lua vim.diagnostic.open_float(nil, {focus=false})",
})

local augroup = vim.api.nvim_create_augroup("my_textwidth", { clear = true })

vim.api.nvim_create_autocmd("FileType", {
	pattern = "text,markdown,tex",
	group = augroup,
	command = "vim.opt.ocal textwidth=80",
})

require 'plugins'
-- make sure that impatient is the first to load!

require 'impatient'

-- catppuccin, onedarkpro, nightfly, onedark, nightfox, tokyonight, kanagawa, gruvbox
-- nightfox themes   => nightfox, dayfox, dawnfox, duskfox, nordfox, terafox
-- onedark themes    => darker, deep
-- everforest themes => hard, medium(default), soft

Scheme = 'kanagawa'
--Scheme = 'catppuccin'

require('user.colorschemes.'..Scheme..'_config')

if Scheme == 'onedark' then
	require('onedark').vim.opt.p {
	    style = 'deep'
	}
end
if Scheme == 'gruvbox' then
	vim.o.background = "dark" -- or "light" for light mode
end
if Scheme == 'gruvbox' then
	vim.o.background = "dark" -- or "light" for light mode
	--let g:everforest_background = 'soft'
end

vim.cmd("colorscheme " .. Scheme)

require "plugconfig"
require "keymapping"
require "lsp"
--require("cmp-config")
