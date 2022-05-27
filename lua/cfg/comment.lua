-- https://github.com/numToStr/Comment.nvim
local keymap = require("core.keymap")

require("Comment").setup({
  toggler = {
    line = keymap.plugin.comment.normal_line_toggle,
    block = keymap.plugin.comment.normal_block_toggle,
  },
  opleader = {
    line = keymap.plugin.comment.visual_line_toggle,
    block = keymap.plugin.comment.visual_block_toggle,
  },
  extra = {
    above = keymap.plugin.comment.normal_prev_rows,
    below = keymap.plugin.comment.normal_next_rows,
    eol = keymap.plugin.comment.noremal_end_line,
  },
})
