--vim.cmd([[
--set expandtab
--set exrc
--set guicursor=i:block
--set hidden
--set incsearch
--set nobackup
--set noerrorbells
--set nohlsearch
--set noshowmode
--set noswapfile
--set nowrap
--set nu
--set relativenumber
--set scrolloff=8
--set shiftwidth=4
--set signcolumn=yes
--set smartindent
--set tabstop=4 softtabstop=4
--set termguicolors
--set undofile
--set wildmenu
--]])

vim.opt.expandtab = true
vim.opt.exrc = true
--vim.opt.guicursor = i:block
vim.opt.hidden = true
vim.opt.incsearch = true
vim.opt.nobackup = true
vim.opt.noerrorbells = true
vim.opt.nohlsearch = true
vim.opt.noshowmode = true
vim.opt.noswapfile = true
vim.opt.nowrap = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 8
vim.opt.shiftwidth = 4
vim.opt.signcolumn = true
vim.opt.smartindent = true
vim.opt.tabstop = 4 
vim.opt.softtabstop = true
vim.opt.termguicolors = true
vim.opt.undofile = true
vim.opt.wildmenu = true

vim.cmd([[
let g:python3_host_prog='~/.config/nvim/nvimpyenv/bin/python'
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
]])

vim.cmd([[
call plug#begin()
Plug 'glepnir/dashboard-nvim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } |
            \ Plug 'ryanoasis/vim-devicons' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kdheepak/tabline.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'scrooloose/nerdcommenter'
Plug 'jbgutierrez/vim-better-comments'
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'
Plug 'olimorris/onedarkpro.nvim'
Plug 'sonph/onehalf'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'glench/vim-jinja2-syntax'
Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'
Plug 'w0rp/ale'
Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddc-around'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'
Plug 'LumaKernel/ddc-tabnine'
Plug 'sbdchd/neoformat'
Plug 'lervag/vimtex'
call plug#end()
]])

vim.cmd([[
let mapleader = " "
set termguicolors

"source $HOME/.config/nvim/config_plugs/base16-onedark.vim
"source $HOME/.config/nvim/config_plugs/onedark.vim
"source $HOME/.config/nvim/config_plugs/onedarkpro.vim
"source $HOME/.config/nvim/config_plugs/onehalfdark.vim
luafile $HOME/.config/nvim/config_plugs/lualine.lua
luafile $HOME/.config/nvim/config_plugs/onedarkpro.lua
luafile $HOME/.config/nvim/config_plugs/treesitter.lua
source $HOME/.config/nvim/config_filetypes/python.vim
source $HOME/.config/nvim/config_plugs/ale.vim
source $HOME/.config/nvim/config_plugs/dashboard.vim
source $HOME/.config/nvim/config_plugs/fugitive.vim
source $HOME/.config/nvim/config_plugs/neoformat.vim
source $HOME/.config/nvim/config_plugs/nerdtree.vim
source $HOME/.config/nvim/config_plugs/telescope.vim

let g:vimtex_view_method = 'skim'
"let maplocalleader = '\'

" DDC
call ddc#custom#patch_global('sources', ['around'])
call ddc#custom#patch_global('sourceOptions', {
            \ '_': {
                \   'matchers': ['matcher_head'],
                \   'sorters': ['sorter_rank']},
                \ })
call ddc#custom#patch_global('sourceOptions', {
            \ 'around': {'mark': 'A'},
            \ })
call ddc#custom#patch_global('sourceParams', {
            \ 'around': {'maxSize': 500},
            \ })
call ddc#custom#patch_filetype(['c', 'cpp'], 'sources', ['around', 'clangd'])
call ddc#custom#patch_filetype(['c', 'cpp'], 'sourceOptions', {
            \ 'clangd': {'mark': 'C'},
            \ })
call ddc#custom#patch_filetype('markdown', 'sourceParams', {
            \ 'around': {'maxSize': 100},
            \ })
inoremap <silent><expr> <TAB>
            \ ddc#map#pum_visible() ? '<C-n>' :
            \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
            \ '<TAB>' : ddc#map#manual_complete()
inoremap <expr><S-TAB>  ddc#map#pum_visible() ? '<C-p>' : '<C-h>'
call ddc#custom#patch_global('sources', ['tabnine'])
call ddc#custom#patch_global('sourceOptions', {
            \ 'tabnine': {
                \   'mark': 'TN',
                \   'maxCandidates': 5,
                \   'isVolatile': v:true,
                \ }})
call ddc#enable()
]])
