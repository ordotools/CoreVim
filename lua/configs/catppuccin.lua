local catppuccin = require("catppuccin")

catppuccin.setup {
    transparent_background = false,
    styles = {
        comments = "NONE",
    },
    integration = {
        gitsigns = true,
        nvimtree = {
            enabled = true,
            show_root = true,         -- makes the root folder not transparent
            transparent_panel = false, -- make the panel transparent
          },
          native_lsp = {
            enabled = true,
            virtual_text = {
                errors = "bold",
                hints = "italic",
                warnings = "italic",
                information = "italic",
            },
            underlines = {
                errors = "underline",
                hints = "underline",
                warnings = "underline",
                information = "underline",
            },
        },
        indent_blankline = {
                enabled = true,
                colored_indent_levels = false,
        },
        bufferline = true,
        lsp_trouble = true,
    }
}
vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha
