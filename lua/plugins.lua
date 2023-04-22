local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end
vim.cmd([[packadd packer.nvim]])
return require("packer").startup(function(use)
	use 'wbthomason/packer.nvim'

	-- STARTUP
	use 'goolord/alpha-nvim'
	use 'lewis6991/impatient.nvim'

	-- THEMES
	use 'rebelot/kanagawa.nvim'

	-- SYNTAX HIGHLIGHTING
	use('nvim-treesitter/nvim-treesitter', {run = ":TSUpdate"})
	use 'nvim-treesitter/playground'
	use	'nvim-treesitter/nvim-treesitter-context'

	-- FILE EXPLORERATION
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons",
		},
		tag = "nightly",
	})
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	-- STATUSLINE
	use({
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	})
	use {
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig"
	}

	-- TERMINAL
	use {
		'akinsho/toggleterm.nvim',
		tag = '*',
	}

	-- COMPLETION
	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}
	use 'gelguy/wilder.nvim'
	use 'windwp/nvim-ts-autotag'

	-- GIT INTEGRATION
	use 'lewis6991/gitsigns.nvim'
	use 'tpope/vim-fugitive'
	use 'kdheepak/lazygit.nvim'

	-- SHIFTS vs TABS
	use 'tpope/vim-sleuth'
	use 'Bekaboo/deadcolumn.nvim' -- see the length of the current line with color

	-- SURROUNDS
	use 'tpope/vim-surround'
	use 'alvan/vim-closetag'
	use 'windwp/nvim-autopairs'

	-- COMMENTS
	use 'tpope/vim-commentary'
	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
		config = function()
			require("todo-comments").setup {
			}
		end
	}

	-- -- EYE CANDY
	-- use 'karb94/neoscroll.nvim'

	-- OTHER
	use 'mbbill/undotree'

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
