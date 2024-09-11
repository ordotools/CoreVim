vim.cmd([[

inoremap jj <ESC>

" Search
noremap <leader>s :%s//g<left><left>

" Explorer
"nnoremap <leader>e <cmd>NvimTreeToggle<cr>
"nnoremap <leader>e :lua MiniFiles.open()<cr>
nnoremap <leader>e :Explore<cr>

" Telescope
" nnoremap <leader>ff <cmd>Telescope find_files<cr>
" nnoremap <leader>fg <cmd>Telescope live_grep<cr>
" nnoremap <leader>fb <cmd>Telescope buffers<cr>
" nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" nnoremap <leader>ft <cmd>TodoTelescope<cr>

" Git
nmap <leader>gd :diffget //3<cr>
nnoremap <leader>gc :G commit -m ''<left>
nmap <leader>gp :G push<cr>
nmap <leader>gt :G push --tag<cr>
nmap <leader>gl :G pull<cr>

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

local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

