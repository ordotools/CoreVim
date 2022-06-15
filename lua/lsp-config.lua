local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

require("nvim-lsp-installer").setup({
	automatic_installation = true,
})

local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
	local hl = "DiagnosticSign" .. type
	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

local lspconfig = require("lspconfig")
local servers = { "jedi_language_server", "sumneko_lua", "texlab" }
for _, lsp in ipairs(servers) do
	lspconfig[lsp].setup({
		capabilities = capabilities,
	})
end

vim.diagnostic.config({
	signs = true,
	underline = true,
	update_in_insert = true,
	severity_sort = false,
	virtual_text = {
		source = "always", -- Or "if_many"
	},
	float = {
		source = "always", -- Or "if_many"
	},
})

-- luasnip setup
local luasnip = require("luasnip")
local lspkind = require("lspkind")
-- nvim-cmp setup
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	mapping = cmp.mapping.preset.insert({
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}),
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { "i", "s" }),
	}),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = "symbol", -- show only symbol annotations
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
		}),
	},
})

lspconfig.sumneko_lua.setup({
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim", "use" },
			},
		},
	},
})

-- from u/lukas-reineke on reddit:
-- https://www.reddit.com/r/neovim/comments/jvisg5/lets_talk_formatting_again/
--vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
    --if err ~= nil or result == nil then
        --return
    --end
    --if not vim.api.nvim_buf_get_option(bufnr, "modified") then
        --local view = vim.fn.winsaveview()
        --vim.lsp.util.apply_text_edits(result, bufnr)
        --vim.fn.winrestview(view)
        --if bufnr == vim.api.nvim_get_current_buf() then
            --vim.api.nvim_command("noautocmd :update")
        --end
    --end
--end

--local on_attach = function(client)
    --if client.resolved_capabilities.document_formatting then
        --vim.api.nvim_command [[augroup Format]]
        --vim.api.nvim_command [[autocmd! * <buffer>]]
        --vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
        --vim.api.nvim_command [[augroup END]]
    --end
--end

--require "lspconfig".efm.setup {
    --on_attach = on_attach;
    --init_options = {documentFormatting = true},
    --settings = {
        --rootMarkers = {".git/"},
        --languages = {
            --lua = {
                --{formatCommand = "lua-format -i", formatStdin = true}
            --}
        --}
    --}
--}
