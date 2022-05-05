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

call plug#begin('$HOME/.config/nvim/plugged')
" Startup
Plug 'mhinz/vim-startify'

" NerdTree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } |
            \ Plug 'ryanoasis/vim-devicons' |
            \ Plug 'Xuyuanp/nerdtree-git-plugin'

" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" Statusline
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

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
"Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'olimorris/onedarkpro.nvim'
Plug 'sonph/onehalf'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'sheerun/vim-polyglot'
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

" colorschemes
set termguicolors
"source $HOME/.config/nvim/plugs/base16-onedark.vim
"source $HOME/.config/nvim/plugs/onedark.vim
"source $HOME/.config/nvim/plugs/onehalfdark.vim
source $HOME/.config/nvim/plugs/onedarkpro.lua
"source $HOME/.config/nvim/plugs/onedarkpro.vim

" Vim Fugitive
source $HOME/.config/nvim/plugs/fugitive.vim

" NerdTree
source $HOME/.config/nvim/plugs/nerdtree.vim

" AirLine
"source $HOME/.config/nvim/plugs/airline.vim

" LuaLine
source $HOME/.config/nvim/plugs/lualine.lua

" Python
source $HOME/.config/nvim/filetypes/python.vim

" neoformat
noremap <leader>af :Neoformat<CR>
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
let g:shfmt_opt="-ci" " zsh 

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" Treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "python", "css", "html", "javascript", "vim", "bash", "lua" },
  sync_install = true,
  ignore_install = {},
  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
}
EOF

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
