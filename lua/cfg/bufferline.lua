-- https://github.com/akinsho/bufferline.nvim
local icon = require("lib.icon")

require("bufferline").setup({
  options = {
    indicator_icon = icon.bufferline.indicator,
    buffer_close_icon = icon.bufferline.buffer_close,
    modified_icon = icon.bufferline.modified,
    close_icon = icon.bufferline.close,
    left_trunc_marker = icon.bufferline.left_trunc_marker,
    right_trunc_marker = icon.bufferline.right_trunc_marker,
    offsets = { { filetype = "NvimTree", text = "Tree of World", text_align = "center" } },
    separator_style = "thin",
  },
})
