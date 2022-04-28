local path = {}

local sep = vim.loop.os_uname().version:match("Windows") and "\\" or "/"

path.get_sep = function()
  return sep
end

path.join = function(...)
  return table.concat({ ... }, sep)
end

path.exists = function(dest)
  local file = io.open(dest, "r")
  if file then
    io.close(file)
    return true
  end
  return false
end

local fn = vim.fn
path.cache = fn.stdpath("cache")
path.config = fn.stdpath("config")
path.data = fn.stdpath("data")

return path
