vim.cmd([[

inoremap jj <ESC>

" Search
noremap <leader>s :%s//g<left><left>

" Telescope
nmap <leader>ff Telescope find_files<cr>
nmap <leader>fg Telescope live_grep<cr>
nmap <leader>fh Telescope help_tags<cr>
nmap <leader>fb Telescope buffers<cr>
nmap <leader>ft TodoTelescope keywords=TODO,FIX<cr>

" Git
nmap <leader>gd diffget //3<cr>
noremap <leader>gc G commit -m ''<left>
nmap <leader>gp G push<cr>
nmap <leader>gt G push --tag<cr>
nmap <leader>gl G pull<cr>

" Gist
vmap <leader>gii GistCreate<cr>
nmap <leader>gif GistCreateFromFile<cr>
nmap <leader>gil GistList<cr>

" Todo
nmap <leader>t TodoQuickFix<cr>

" LaTeX bindings
vmap <leader>xb c\textbf{<C-r>"}<ESC>
nmap <leader>xb c\textbf{<C-r>"}<left>
vmap <leader>xi c\textit{<C-r>"}<ESC>
nmap <leader>xi c\textit{<C-r>"}<left>

]])
