local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()

    use 'wbthomason/packer.nvim'

    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons',
        },
        tag = 'nightly'
    }

    use {
        "catppuccin/nvim",
        as = "catppuccin"
    }

    use 'nvim-treesitter/nvim-treesitter'

    use {
        'akinsho/bufferline.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }

use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
}

    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin

    use {
      'lewis6991/gitsigns.nvim',
      config = function()
        require('gitsigns').setup()
      end
    }

    use 'sbdchd/neoformat'

    use 'feline-nvim/feline.nvim'

    use {
        'tpope/vim-fugitive',
        after = 'feline.nvim',
    }

    use 'tpope/vim-sleuth'

    use 'tpope/vim-surround'

    use 'jiangmiao/auto-pairs'

    use {
      'nvim-telescope/telescope.nvim',
      requires = { {'nvim-lua/plenary.nvim'} }
    }

    use 'devanlooches/better-comments-nvim'

    use 'preservim/nerdcommenter'

    use {
        'lervag/vimtex',
        ft = 'latex',
    }

    if PACKER_BOOTSTRAP then
        require('packer').sync()
    end
end)

