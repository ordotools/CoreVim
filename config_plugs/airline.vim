" Note that I have added spaces to some of the symbols
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '
let g:airline#extensions#tabline#right_alt_sep = ' '
let g:airline_theme='nightfly' " nightfly
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = '  '
let g:airline_symbols.branch = '  '
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' ☰ '
let g:airline_symbols.maxlinenr = '  '
let g:airline_symbols.dirty=' ⚡ '
