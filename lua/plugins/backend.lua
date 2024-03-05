return {

    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require("mini.align").setup({})
            require("mini.comment").setup({})
            require("mini.files").setup({})
            -- require("mini.indentscope").setup({})
            require("mini.pairs").setup({})
            require("mini.surround").setup({})
        end,
    },

    -- git
    {
        'tpope/vim-fugitive',
        keys = {
            { "<leader>ga", ":G add .<cr>", desc = "Add" },
        },
    },

    {
        'lewis6991/gitsigns.nvim',
        config = function ()
            require('gitsigns').setup { }
        end,
        lazy = false,
    },

    -- telescope
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.5',
        -- version = false,
        lazy = true,
        event = "VeryLazy",
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function ()
            require('telescope').setup{
                pickers = { find_files = { theme = "dropdown", } },
            }
        end
    },

    -- LSP support
    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
        opts = {
            enable_check_bracket_line = false,
            ignored_next_character = "[%w%.]"
        }
    },
}
