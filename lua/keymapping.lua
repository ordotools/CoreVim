vim.cmd([[

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

"Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

]])

