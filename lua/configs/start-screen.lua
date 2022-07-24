vim.g.startify_sessiono_dir = '~/.config/nvim/session'

vim.cmd([[
let g:startify_lists = [
\ { 'type': 'files',     'header': ['   Files']            },
\ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
\ { 'type': 'sessions',  'header': ['   Sessions']       },
\ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
\ ]
let g:startify_bookmarks = [
"\ { 'c': '~/.config/i3/config' },
\ { 'i': '~/.config/nvim/init.lua' },
\ { 'z': '~/dotfile/.zshrc' },
\ { 'g': '~/github' },
"\ '~/Code',
"\ '~/Pics',
\ ]
]])
vim.g.startify_session_autoload = 1
vim.g.startify_session_delete_buffers = 1
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_fortune_use_unicode = 1
vim.g.startify_session_persistence = 1
vim.g.startify_enable_special = 0
vim.cmd([[
    let g:startify_custom_header = [
    \'▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄',
    \'██░▀██░█░▄▄█▀▄▄▀██░███░██▄██░▄▀▄░█',
    \'██░█░█░█░▄▄█░██░███░█░███░▄█░█▄█░█',
    \'██░██▄░█▄▄▄██▄▄████▄▀▄██▄▄▄█▄███▄█',
    \'▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀',
    \]
    ]])

