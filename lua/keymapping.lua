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

]])
