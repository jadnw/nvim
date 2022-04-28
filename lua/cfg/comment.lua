-- https://github.com/numToStr/Comment.nvim

local keymap = require("core.keymap")
local comment_string = require("ts_context_commentstring")

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
  pre_hook = function(ctx)
    -- Only calculate commentstring for tsx filetypes
    if vim.bo.filetype == "typescriptreact" then
      local U = require("Comment.utils")
      -- Detemine whether to use linewise or blockwise commentstring
      local type = ctx.ctype == U.ctype.line and "__default" or "__multiline"
      -- Determine the location where to calculate commentstring from
      local location = nil
      if ctx.ctype == U.ctype.block then
        location = comment_string.utils.get_cursor_location()
      elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then
        location = comment_string.utils.get_visual_start_location()
      end
      return comment_string.calculate_commentstring({
        key = type,
        location = location,
      })
    end
  end,
})
