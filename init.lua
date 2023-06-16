local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- These are plugins to keep in mind:
-- https://github.com/folke/noice.nvim


vim.g.mapleader = " "
vim.g.python3_host_prog = "~/.config/nvim/nvimpyenv/bin/python"
vim.g.syntax = true
vim.o.updatetime = 250
vim.opt.backup = false
vim.opt.cursorline = true
vim.opt.cursorlineopt = "number"
-- vim.opt.colorcolumn = "80"
vim.opt.errorbells = false
vim.opt.expandtab = true
vim.opt.exrc = true
vim.opt.hidden = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.laststatus = 3
vim.opt.listchars = "trail:…,nbsp:°,eol:«"
vim.opt.list = false
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.signcolumn = "yes"
vim.opt.smartindent = true
vim.opt.softtabstop = 4 vim.opt.splitbelow = true vim.opt.splitright = true vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.wildmenu = true
vim.opt.winbar = ' %n %t %M%=%p%% ' -- in the days before barbecue
vim.opt.wrap = false

vim.api.nvim_create_autocmd("CursorHold,CursorHoldI", {
  pattern = "*",
  command = "lua vim.diagnostic.open_float(nil, {focus=false})",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "tex",
  command = "setfiletype tex",
})

-- vim.api.nvim_set_hl(0, "NormalFloat", {
--  bg = "bg",
--  fg = "#d8bd92",
-- )
-- 
-- im.api.nvim_set_hl(0, "FloatBorder", {
--  bg = "bg",
--  fg = "#d8bd92",
-- )


require("lazy").setup("plugins", {
  ui = {
    border = "rounded",
    icons = {
      cmd = "⌘",
      config = "🛠",
      event = "📅",
      ft = "📂",
      init = "⚙",
      keys = "🗝",
      plugin = "🔌",
      runtime = "💻",
      source = "📄",
      start = "🚀",
      task = "📌",
      lazy = "💤 ",
    },
  },
  change_detection = {notify = false,}
})

-- vim.cmd('colorscheme  kanagawa')
vim.cmd('colorscheme gruvbox-material')
-- vim.cmd('colorscheme catppuccin-macchiato')
-- vim.cmd('colorscheme catppuccin-mocha')

require 'keymapping'
-- require 'lsp'
