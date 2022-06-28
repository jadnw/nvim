-- https://github.com/akinsho/bufferline.nvim
local icon = require("lib.icon")

require("bufferline").setup({
  options = {
    -- indicator_icon = icon.bufferline.indicator,
    indicator_icon = '', -- disable indicator
    buffer_close_icon = icon.bufferline.buffer_close,
    modified_icon = icon.bufferline.modified,
    close_icon = icon.bufferline.close,
    left_trunc_marker = icon.bufferline.left_trunc_marker,
    right_trunc_marker = icon.bufferline.right_trunc_marker,
    max_name_length = 20,
    tab_size = 24,
    diagnostics = "nvim_lsp",
    offsets = { { filetype = "NvimTree", text = "The Galathilion", text_align = "center" } },
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = false,
    separator_style = "slant",
    always_show_bufferline = true,
    sort_by = "insert_at_end",
  },
})
