-- https://github.com/mbbill/undotree
local path = require("lib.path")

local undotree_dir = path.join(path.cache, "undotree")

if vim.fn.has("persistent_undo") then
  local target_path = vim.fn.expand(undotree_dir)
  if not vim.fn.isdirectory(target_path) then
    vim.fn.mkdir(target_path, "p", 0700)
  end
  vim.o.undodir = target_path
  vim.o.undofile = true
end
