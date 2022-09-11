vim.cmd([[
" Splitting
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

inoremap jj <ESC>
noremap <leader>s :%s//g<left><left>

" Fugitive
nmap <leader>gh :diffget //3<CR>
nmap <leader>gu :diffget //3<CR>
nmap <leader>gs :G<CR>
nmap <leader>ga :G add .<CR>
nmap <leader>gc :G commit -m ''<Left>
nmap <leader>gp :G push<CR>
nmap <leader>gl :G pull<CR>

" NvimTree
nnoremap <leader>n :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>q :NvimTreeFindFile<CR>

" Neoformat
noremap <leader>af :Neoformat<CR>

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fP <cmd>Telescope projects<cr>
nnoremap <leader>fF <cmd>Telescope find_project_files<cr>
nnoremap <leader>fB <cmd>Telescope browse_project_files<cr>
nnoremap <leader>fR <cmd>Telescope recent_project_files<cr>
nnoremap <leader>fW <cmd>Telescope change_working_directory<cr>

" todo-comments
nnoremap <leader>ft <cmd>TodoTelescope<cr>

" Escape terminal mode -- THIS IS NOT WORKING!!!
tnoremap <Esc> <C-\><C-n>

" nnoremap <leader>sL <cmd>SessionManager[load_last_session]<cr>

" LazyGit
nnoremap <silent> <leader>gg :LazyGit<CR>

" LaTeX bindings
vmap <leader>xb c\textbf{<C-r>"}<ESC>
nmap <leader>xb c\textbf{<C-r>"}<left>
vmap <leader>xi c\textit{<C-r>"}<ESC>
nmap <leader>xi c\textit{<C-r>"}<left>

" vim which key 
""nnoremap <silent><leader> :<c-u>WhichKey '<Space>'<CR>

]])
