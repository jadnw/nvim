local services = require("lsp.null-ls.services")
local M = {}

local null_ls = require("null-ls")
local method = null_ls.methods.FORMATTING

function M.list_registered(filetype)
  local registered_providers = services.list_registered_providers_names(filetype)
  return registered_providers[method] or {}
end

return M
