local M = {}

function M.reload(quiet)
  -- Reload options, mappings and plugins (this is managed automatically by lazy).
  -- Never reload base.3-autocmds to avoid issues.
  -- local core_modules = { "lsp", "keymapping" }
  local core_modules = { "keymapping" }
  local modules = vim.tbl_filter(
    function(module) return module:find "^user%." end,
    vim.tbl_keys(package.loaded)
  )

  vim.tbl_map(
    require("plenary.reload").reload_module,
    vim.list_extend(modules, core_modules)
  )
  local success = true
  for _, module in ipairs(core_modules) do
    local status_ok, fault = pcall(require, module)
    if not status_ok then
      vim.api.nvim_err_writeln("Failed to load " .. module .. "\n\n" .. fault)
      success = false
    end
  end
  if not quiet then -- if not quiet, then notify of result
    if success then
      M.notify("Nvim successfully reloaded", vim.log.levels.INFO)
    else
      M.notify("Error reloading Nvim...", vim.log.levels.ERROR)
    end
  end
  vim.cmd.doautocmd "ColorScheme" -- For heirline
  -- vim.cmd("colorscheme " .. base.default_colorscheme)

  return success
end
