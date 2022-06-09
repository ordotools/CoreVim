noremap <leader>af :Neoformat<CR>
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
let g:shfmt_opt="-ci" " zsh 
