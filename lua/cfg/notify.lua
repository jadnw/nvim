-- https://github.com/rcarriga/nvim-notify
local icon = require("lib.icon")

require("notify").setup({
  stages = "slide",
  timeout = 6000, -- ms
  icons = icon.notify,
})
