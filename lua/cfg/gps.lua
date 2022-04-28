-- https://github.com/SmiteshP/nvim-gps
local icon = require("lib.icon")

require("nvim-gps").setup({
  disable_icons = false,
  icons = {
    ["class-name"] = icon.gps.class, -- Classes and class-like objects
    ["function-name"] = icon.gps.func, -- Functions
    ["method-name"] = icon.gps.method, -- Methods (functions inside class-like objects)
    ["container-name"] = icon.gps.container, -- Containers (example: lua tables)
    ["tag-name"] = icon.gps.tag, -- Tags (example: html tags)
  },
  separator = " > ",
})
