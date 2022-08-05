-- Only one-liners are allowed.

require("alpha").setup(require'alpha.themes.dashboard'.config)

require('user.ui.specs_config')

require("user.ui.lualine_config")

require("user.ui.nvimtree_config")

require('user.ui.bufferline_config')

require('user.git.gitsigns_config')

require('user.ui.trouble_config')

require('user.ui.indent-blankline_config')

require('user.ui.telescope_config')

require("user.ui.plenary_config")

require("gitsigns").setup()

require("todo-comments").setup {}

require("user.files.regexplainer_config")

require('user.ui.treesitter_config')

require('user.files.vimtex_config')

require('user.ui.smart-splits_config')

require("configs.catppuccin")

require('user.colorschemes.nightfly_config')

require('user.colorschemes.onedarkpro_config')
