local lsp_zero = require('lsp-zero')
vim.lsp.set_log_level("off") -- prevents infinite log growth

lsp_zero.on_attach(function(client, bufnr)
  -- see :help lsp-zero-keybindings
  lsp_zero.default_keymaps({ buffer = bufnr })
  -- lsp_zero.buffer_autoformat()
end)

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

require('lspconfig').lua_ls.setup(lsp_zero.nvim_lua_ls())

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {},
  handlers = {
    lsp_zero.default_setup,
    -- sample custom hanlder for installed servers:
    --
    -- tsserver = function()
    --   require('lspconfig').tsserver.setup({
    --     single_file_support = false,
    --     on_attach = function(client, bufnr)
    --       print('hello tsserver')
    --     end
    --   })
    --
  },
})

require('luasnip.loaders.from_vscode').lazy_load()

local cmp_action = require('lsp-zero').cmp_action()

local cmp_autopairs = require('nvim-autopairs.completion.cmp')

local cmp = require('cmp')


cmp.setup({

  snippet = { -- required
    expand = function(args)
      require('luasnip').lsp_expand(args.body)
    end,
  },

  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    { name = 'buffer' },
    { name = 'nvim_lua' },
  },

  formatting = {
    fields = { 'menu', 'abbr', 'kind' },
    format = function(entry, item)
      local menu_icon = {
        nvim_lsp = 'λ',
        luasnip = '⋗',
        buffer = 'Ω',
        path = '🖫',
        nvim_lua = 'Π',
      }
      item.menu = menu_icon[entry.source.name]
      return item
    end,
  },

  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },

  preselect = 'item',

  completion = {
    completeopt = 'menu,menuone,noinsert'
  },

  mapping = cmp.mapping.preset.insert({
    ['<CR>'] = cmp.mapping.confirm({ select = false }),
    ['<Tab>'] = cmp_action.luasnip_supertab(),
    ['<S-Tab>'] = cmp_action.luasnip_shift_supertab(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
  }),

  cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
  )

})
