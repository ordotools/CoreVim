local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local path_ok, path = pcall(require, "plenary.path")
if not path_ok then
  return
end

local dashboard = require("alpha.themes.dashboard")
local nvim_web_devicons = require "nvim-web-devicons"
local cdir = vim.fn.getcwd()

local function get_extension(fn)
  local match = fn:match("^.+(%..+)$")
  local ext = ""
  if match ~= nil then
    ext = match:sub(2)
  end
  return ext
end

local function footer()
  --local total_plugins = require("lazy").stats().count
  local total_plugins = "52"
  local date = os.date("%d-%m-%y")
  local time = os.date("%h:%m:%s")
  return "[ " .. total_plugins .. " plugins] [ " .. date .. "] [ " .. time .. "]"
end

local function icon(fn)
  local nwd = require("nvim-web-devicons")
  local ext = get_extension(fn)
  return nwd.get_icon(fn, ext, { default = true })
end

local function file_button(fn, sc, short_fn)
  short_fn = short_fn or fn
  local ico_txt
  local fb_hl = {}

  local ico, hl = icon(fn)
  local hl_option_type = type(nvim_web_devicons.highlight)
  if hl_option_type == "boolean" then
    if hl and nvim_web_devicons.highlight then
      table.insert(fb_hl, { hl, 0, 1 })
    end
  end
  if hl_option_type == "string" then
    table.insert(fb_hl, { nvim_web_devicons.highlight, 0, 1 })
  end
  ico_txt = ico .. "  "

  local file_button_el = dashboard.button(sc, ico_txt .. short_fn, "<cmd>e " .. fn .. " <cr>")
  local fn_start = short_fn:match(".*/")
  if fn_start ~= nil then
    table.insert(fb_hl, { "type", #ico_txt - 2, #fn_start + #ico_txt - 2 })
  end
  file_button_el.opts.hl = fb_hl
  return file_button_el
end

local default_mru_ignore = { "gitcommit" }

local mru_opts = {
  ignore = function(path, ext)
    return (string.find(path, "commit_editmsg")) or (vim.tbl_contains(default_mru_ignore, ext))
  end,
}

-- @param start number
-- @param cwd string optional
-- @param items_number number optional number of items to generate, default = 10
local function mru(start, cwd, items_number, opts)
  opts = opts or mru_opts
  items_number = items_number or 9

  local oldfiles = {}
  for _, v in pairs(vim.v.oldfiles) do
    if #oldfiles == items_number then
      break
    end
    local cwd_cond
    if not cwd then
      cwd_cond = true
    else
      cwd_cond = vim.startswith(v, cwd)
    end
    local ignore = (opts.ignore and opts.ignore(v, get_extension(v))) or false
    if (vim.fn.filereadable(v) == 1) and cwd_cond and not ignore then
      oldfiles[#oldfiles + 1] = v
    end
  end

  local special_shortcuts = {}
  local target_width = 35

  local tbl = {}
  for i, fn in ipairs(oldfiles) do
    local short_fn
    if cwd then
      short_fn = vim.fn.fnamemodify(fn, ":.")
    else
      short_fn = vim.fn.fnamemodify(fn, ":~")
    end

    if(#short_fn > target_width) then
      short_fn = path.new(short_fn):shorten(1, {-2, -1})
      if(#short_fn > target_width) then
        short_fn = path.new(short_fn):shorten(1, {-1})
      end
    end

    local shortcut = ""
    if i <= #special_shortcuts then
      shortcut = special_shortcuts[i]
    else
      shortcut = tostring(i + start - 1 - #special_shortcuts)
    end

    local file_button_el = file_button(fn, " " .. shortcut, short_fn)
    tbl[i] = file_button_el
  end
  return {
    type = "group",
    val = tbl,
    opts = {},
  }
end

-- local logo = {
--  [[ ██████╗ ██████╗ ██████╗ ███████╗██╗   ██╗██╗███╗   ███╗]],
--  [[██╔════╝██╔═══██╗██╔══██╗██╔════╝██║   ██║██║████╗ ████║]],
--  [[██║     ██║   ██║██████╔╝█████╗  ██║   ██║██║██╔████╔██║]],
--  [[██║     ██║   ██║██╔══██╗██╔══╝  ╚██╗ ██╔╝██║██║╚██╔╝██║]],
--  [[╚██████╗╚██████╔╝██║  ██║███████╗ ╚████╔╝ ██║██║ ╚═╝ ██║]],
--  [[ ╚═════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝  ╚═══╝  ╚═╝╚═╝     ╚═╝]],
-- }
local logo = {
 [[███╗ ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗]],
 [[████╗██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║]],
 [[██╔████║█████╗  ██║   ██║██║   ██║██║██╔████╔██║]],
 [[██║╚███║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║]],
 [[██║ ╚██║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║]],
 [[╚═╝  ╚═╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝]],
}
local section_header = {
  type = "text",
  val = logo,
  opts = {
    hl = "operator",
    shrink_margin = false,
    position = "center",
  }
}

local section_mru = {
  type = "group",
  val = {
    {
      type = "text",
      val = "recent files",
      opts = {
        hl = "constant",
        shrink_margin = false,
        position = "center",
      },
    },
    { type = "padding", val = 1 },
    {
      type = "group",
      val = function()
        return { mru(1, cdir, 9) }
      end,
      opts = { shrink_margin = false },
    },
  }
}

local buttons = {
  type = "group",
  val = {
    { type = "text", val = "quick links", opts = { hl = "constant", position = "center" } },
    { type = "padding", val = 1 },
    dashboard.button("e", "  new file", ":ene <bar> startinsert <cr>"),
    dashboard.button("o", "ﭯ  recently opened files", ":telescope oldfiles<cr>"),
    dashboard.button("f", "  find file", ":lua require('telescope.builtin').find_files()<cr>"),
    --dashboard.button("p", "  find project", ":telescope repo list<cr>"),
    dashboard.button("r", "  find word", ":lua require('telescope.builtin').live_grep()<cr>"),
    --dashboard.button("g", "  find modified file", ":lua require('config.plugins.telescope').my_git_status()<cr>"),
    dashboard.button("m", "  show mark", ":telescope marks"),
    --dashboard.button("t", "  show todo", ":todotelescope<cr>"),
    dashboard.button("s", "  corevim plugins", ":e ~/.config/nvim/lua/plugins.lua<cr>"),
    -- dashboard.button("u", "  sync plugins", ":packersync<cr>"),
    --dashboard.button("l", "  lazy", ":lazy<cr>"),
    dashboard.button("u", "  sync plugins", ":packersync<cr>"),
    dashboard.button("h", "  neovim check health", ":checkhealth<cr>"),
    dashboard.button("q", "  quit", "<cmd>qa<cr>")
  },
  position = "center",
}

local section_footer = {
  type = "group",
  val = {
    { type = "text", val = footer(), opts = { hl = "constant", position = "center" } },
  }
}

local opts = {
  layout = {
    { type = "padding", val = 2 },
    section_header,
    { type = "padding", val = 2 },
    section_mru,
    { type = "padding", val = 2 },
    buttons,
    { type = "padding", val = 2 },
    section_footer,
  },
  opts = {
    margin = 5,
  },
}

alpha.setup(opts)
