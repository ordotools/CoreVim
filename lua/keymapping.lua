-- just a few things that have not made it into which-key

vim.cmd([[

" Splitting
"nnoremap <C-J> <C-W><C-J>
"nnoremap <C-K> <C-W><C-K>
"nnoremap <C-L> <C-W><C-L>
"nnoremap <C-H> <C-W><C-H>

inoremap jj <ESC>
noremap <leader>s :%s//g<left><left>

" LaTeX bindings
"vmap <leader>xb c\textbf{<C-r>"}<ESC>
"nmap <leader>xb c\textbf{<C-r>"}<left>
"vmap <leader>xi c\textit{<C-r>"}<ESC>
"nmap <leader>xi c\textit{<C-r>"}<left>

]])
