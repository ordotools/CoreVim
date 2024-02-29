return {
    {
        'echasnovski/mini.nvim',
        version = false,
        config = function()
            require("mini.align").setup({})
            require("mini.comment").setup({})
            require("mini.files").setup({})
            require("mini.indentscope").setup({})
            require("mini.pairs").setup({})
            require("mini.surround").setup({})
        end,
    },
}
