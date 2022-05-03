" OneDark Colorschemes
set termguicolors
set background=dark
hi Normal guibg=NONE ctermbg=NONE
" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif
highlight Normal guibg=none
let g:onedark_italic=1
let g:onedark_terminal_italics=1
let g:onedark_termcolors=256
let g:onedark_hide_endofbuffer=1
let g:airline_theme='onedark'
"let g:terminal_ansi_colors = [
    "\ '#282828', '#cc241d', '#98971a', '#d79921',
    "\ '#458588', '#b16286', '#689d6a', '#a89984',
    "\ '#928374', '#fb4934', '#b8bb26', '#fabd2f',
    "\ '#83a598', '#d3869b', '#8ec07c', '#ebdbb2',
"\]
colorscheme onedark
