local lsp = require('lsp-zero').preset({})

vim.lsp.set_log_level("off") -- prevents infinite log growth

lsp.on_attach(function(client, bufnr)
  lsp.default_keymaps({buffer = bufnr})
end)

lsp.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())

-- require('lspconfig').ruff_ls.setup {}

lsp.setup()

-- local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

-- cmp.event:on(
--   'confirm_done',
--   cmp_autopairs.on_confirm_done()
-- )

cmp.setup({

  snippet = { -- required
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  preselect = 'item',
  completion = {
    completeopt = 'menu,menuone,noinsert'
  },

  mapping = {
    ['<CR>'] = cmp.mapping.confirm({select = true}),
    ['<C-f>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),
    -- supertab:
    ['<Tab>'] = cmp_action.luasnip_supertab(),        -- REGULAR: .tab_complete(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(), -- REGULAR: .select_prev_or_fallback(),
  },

  sources = {
    {name = 'nvim_lsp'},
    {name = 'luasnip', keyword_length = 2},
    {name = 'path'},
    {name = 'nvim_lua'},
    {name = 'buffer', keyword_length = 3},
  },

  require("luasnip.loaders.from_vscode").lazy_load()

})
