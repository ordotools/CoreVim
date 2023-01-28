--require("alpha").setup(require'alpha.themes.startify'.config) --startify, dashboard
require("user.ui.alpha_config")

require("user.ui.lualine_config")

--require("user.ui.tabby_config")

require("user.ui.nvimtree_config")

require('user.git.gitsigns_config')

require('user.ui.telescope_config')

require("user.ui.nvim-session-manager_config")

require("gitsigns").setup {}

require("fidget").setup {}

require('user.ui.treesitter_config')

require('user.files.vimtex_config')

--require('user.ui.smart-splits_config')

require('user.colorschemes.nightfly_config')

require('user.colorschemes.onedarkpro_config')

require('user.term.toggleterm_config')

require('user.term.wilder_config')
