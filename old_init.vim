set expandtab
set exrc
set guicursor=i:block
set hidden
set incsearch
set nobackup
set noerrorbells
set nohlsearch
set noshowmode
set noswapfile
set nowrap
set nu
set relativenumber
set scrolloff=8
set shiftwidth=4
set signcolumn=yes
set smartindent
set tabstop=4 softtabstop=4
set termguicolors
set undofile
set wildmenu

let g:python3_host_prog='~/.config/nvim/nvimpyenv/bin/python'
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

call plug#begin()
" Startup
Plug 'glepnir/dashboard-nvim'

" NerdTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } |
            \ Plug 'ryanoasis/vim-devicons' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Statusline
"Plug 'nvim-lualine/lualine.nvim'
"Plug 'kyazdani42/nvim-web-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Tabline
Plug 'kdheepak/tabline.nvim'

" File management
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/plenary.nvim'

" Comments
Plug 'scrooloose/nerdcommenter'
Plug 'jbgutierrez/vim-better-comments'

" Colorschemes
Plug 'chriskempson/base16-vim'
Plug 'joshdick/onedark.vim'
Plug 'olimorris/onedarkpro.nvim'
Plug 'sonph/onehalf'
Plug 'arcticicestudio/nord-vim'
" Syntax
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'glench/vim-jinja2-syntax'

Plug 'tpope/vim-surround'
Plug 'Yggdroot/indentLine'

" Syntax Checker
Plug 'w0rp/ale'

" Autocomplete
Plug 'Shougo/ddc.vim'
Plug 'vim-denops/denops.vim'
Plug 'Shougo/ddc-around'
Plug 'Shougo/ddc-matcher_head'
Plug 'Shougo/ddc-sorter_rank'
Plug 'LumaKernel/ddc-tabnine'

" Formatting
Plug 'sbdchd/neoformat'

" LaTeX
Plug 'lervag/vimtex'

call plug#end()

filetype plugin indent on
let mapleader = " "
set termguicolors

"colorscheme nord

"source $HOME/.config/nvim/config_plugs/base16-onedark.vim
"source $HOME/.config/nvim/config_plugs/onedark.vim
"source $HOME/.config/nvim/config_plugs/onehalfdark.vim
"luafile $HOME/.config/nvim/config_plugs/lualine.lua
luafile $HOME/.config/nvim/config_plugs/onedarkpro.lua
luafile $HOME/.config/nvim/config_plugs/treesitter.lua
source $HOME/.config/nvim/config_filetypes/python.vim
source $HOME/.config/nvim/config_plugs/ale.vim
source $HOME/.config/nvim/config_plugs/airline.vim
source $HOME/.config/nvim/config_plugs/dashboard.vim
source $HOME/.config/nvim/config_plugs/fugitive.vim
source $HOME/.config/nvim/config_plugs/neoformat.vim
source $HOME/.config/nvim/config_plugs/nerdtree.vim
source $HOME/.config/nvim/config_plugs/telescope.vim

" VimTex
syntax enable
let g:vimtex_view_method = 'skim'
"let maplocalleader = '\'
augroup my_textwidth
au!
autocmd FileType text,tex setlocal textwidth=80
augroup END

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
