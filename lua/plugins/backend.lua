return {

    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require("mini.align").setup({})
            require("mini.comment").setup({})
            -- require("mini.files").setup({})
            -- require("mini.indentscope").setup({})
            -- require("mini.pairs").setup({}) -- seems to be causing a crash?
            -- require("mini.surround").setup({}) -- just not the same as the tpope way...
        end,
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true,
        opts = {
            ingored_next_char = "[%w%.]",
            enable_check_bracket_line = false,
        }
        -- use opts = {} for passing setup options
        -- this is equalent to setup({}) function
    },

    {
        'tpope/vim-surround',
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
        branch = '0.1.x',
        -- version = false,
        lazy = true,
        event = "VeryLazy",
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function ()
            require('telescope').setup{
                -- pickers = { find_files = { theme = "dropdown", } },
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
