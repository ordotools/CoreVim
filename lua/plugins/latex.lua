return {
    {
        "lervag/vimtex",
        -- init = function()
        -- Use init for configuration, don't use the more common "config".
        -- vimtex_view_method = 'asdf',
        -- end
        opt = true,
        config = function ()
            vim.g.vimtex_view_general_viewer = 'mupdf'
            vim.g.vimtex_compiler_latexmk_engines = {
                _ = "-pdflua"
            }
        end,
        ft = 'tex'
    },
    -- {
    --     'jakewvincent/texmagic.nvim',
    --     config = function()
    --         require('texmagic').setup({
    --             -- Config goes here; leave blank for defaults
    --         })
    --     end,
    -- }
}
