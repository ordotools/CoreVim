nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
"autocmd VimEnter * NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
let NERDTreeRespectWildIgnore=1
let NERDTreeShowHidden=1
let g:NERDTreeGitStatusUseNerdFonts = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 2
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'✹',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ }
let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0
