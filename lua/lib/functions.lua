local M = {}

M.cycle_colorcolumn = function()
  local cols = { "80", "120", "9999" }
  vim.g.colorcolumn_index = vim.g.colorcolumn_index + 1 > #cols and 1 or vim.g.colorcolumn_index + 1
  vim.opt.colorcolumn = cols[vim.g.colorcolumn_index]
end

return M
