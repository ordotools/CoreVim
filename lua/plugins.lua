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

return require("packer").startup(function()

	use("wbthomason/packer.nvim")

	-- STARTUP
	use 'goolord/alpha-nvim'
	use 'Shatur/neovim-session-manager'
	use 'lewis6991/impatient.nvim'

	-- THEMES
	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})
	use 'navarasu/onedark.nvim'
	use 'bluz71/vim-nightfly-guicolors'
	use 'olimorris/onedarkpro.nvim'
	use 'EdenEast/nightfox.nvim'
	use 'folke/tokyonight.nvim'
    use 'rebelot/kanagawa.nvim'

	-- SYNTAX HIGHLIGHTING
	use 'nvim-treesitter/nvim-treesitter'

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

	-- BUFFERS & TABS
	--use({
		--"akinsho/bufferline.nvim",
		--requires = "kyazdani42/nvim-web-devicons",
	--})
	--use {
		--"nanozuki/tabby.nvim",
		--config = function() require("tabby").setup() end,
	--}
    use 'nanozuki/tabby.nvim'

	-- STATUSLINE
	use({
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	})
	use 'liuchengxu/vim-which-key'

    -- TERMINAL
    use {
        "akinsho/toggleterm.nvim",
        tag = '*',
        }

	-- COMPLETION
	use({
		"williamboman/nvim-lsp-installer",
		"neovim/nvim-lspconfig",
	})
	use("hrsh7th/cmp-nvim-lsp") -- LSP source for nvim-cmp
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp") -- Autocompletion plugin
	use("saadparwaiz1/cmp_luasnip") -- Snippets source for nvim-cmp
	use("onsails/lspkind-nvim")
	use("L3MON4D3/LuaSnip") -- Snippets plugin
	use("hrsh7th/vim-vsnip")
	use({
		"hrsh7th/vim-vsnip-integ",
		requires = "hrsh7th/vim-vsnip"
	})
	use({
		"folke/trouble.nvim",
		requires = "kyazdani42/nvim-web-devicons",
	})
	--use {'neoclide/coc.nvim', branch = 'release'}


	-- GIT INTEGRATION
	use({
		"lewis6991/gitsigns.nvim",
		--config = function()
			--require("gitsigns").setup()
		--end,
	})
	use({
		"tpope/vim-fugitive",
		--after = "feline.nvim",
	})
	use 'kdheepak/lazygit.nvim'

	-- SHIFTS vs TABS
	use("tpope/vim-sleuth")

	-- SURROUNDS
	use("tpope/vim-surround")
	use("alvan/vim-closetag")
	use("jiangmiao/auto-pairs")

	-- COMMENTS
	use("preservim/nerdcommenter")
	use {
		"folke/todo-comments.nvim",
		requires = "nvim-lua/plenary.nvim",
	}

	-- CURSOR
	--use {'edluffy/specs.nvim'}

	-- FILETYPES/SYNTAX-TYPES
	use("lervag/vimtex")
	use({ 'bennypowers/nvim-regexplainer',
		requires = {
			'nvim-treesitter/nvim-treesitter',
			'MunifTanjim/nui.nvim',
		}
	})
	use 'kkharji/sqlite.lua' -- requires $ luarocks install sqlite luv

	-- OTHER
	use("lukas-reineke/indent-blankline.nvim")
	use('mrjones2014/smart-splits.nvim')


	-- THEME CREATION
	use('rktjmp/lush.nvim')

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
