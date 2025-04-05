-- colors/kanabox.lua
-- A hybrid Neovim theme combining Kanagawa's bluish-black background with Gruvbox-style pastels

local M = {}

function M.setup()
  vim.o.background = "dark"
  vim.cmd("highlight clear")
  if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
  end
  vim.g.colors_name = "kanabox"

  local colors = {
    bg         = "#1f1f28", -- Kanagawa wave
    bg_alt     = "#1a1a22",
    fg         = "#d4be98", -- Gruvbox fg
    comment    = "#928374", -- Gruvbox gray (italic)
    string     = "#a89984", -- Subtle, warm pastel
    keyword    = "#d3869b", -- Gruvbox pink
    identifier = "#83a598", -- Gruvbox blue
    function_  = "#b8bb26", -- Gruvbox green
    type       = "#8ec07c", -- Teal
    constant   = "#fabd2f", -- Yellow
    error      = "#fb4934", -- Red
    special    = "#fe8019", -- Orange
  }

  local hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  -- Base
  hl("Normal",         { fg = colors.fg, bg = colors.bg })
  hl("Comment",        { fg = colors.comment, italic = true })
  hl("String",         { fg = colors.string })
  hl("Keyword",        { fg = colors.keyword, bold = true })
  hl("Identifier",     { fg = colors.identifier })
  hl("Function",       { fg = colors.function_, bold = true })
  hl("Type",           { fg = colors.type })
  hl("Constant",       { fg = colors.constant })
  hl("Error",          { fg = colors.error, bold = true })
  hl("Special",        { fg = colors.special })

  -- UI Elements
  hl("StatusLine",     { fg = colors.fg, bg = colors.bg_alt })
  hl("LineNr",         { fg = colors.comment })
  hl("CursorLine",     { bg = colors.bg_alt })
  hl("Visual",         { bg = colors.bg_alt })
  hl("Pmenu",          { fg = colors.fg, bg = colors.bg_alt })
  hl("PmenuSel",       { bg = colors.comment })

  -- Treesitter (Neovim 0.5+)
  hl("@comment",       { link = "Comment" })
  hl("@string",        { link = "String" })
  hl("@keyword",       { link = "Keyword" })
  hl("@function",      { link = "Function" })
  hl("@type",          { link = "Type" })
  hl("@constant",      { link = "Constant" })
end

return M
