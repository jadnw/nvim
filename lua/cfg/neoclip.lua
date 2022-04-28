-- https://github.com/AckslD/nvim-neoclip.lua
local keymap = require("core.keymap")

local function is_whitespace(line)
  return vim.fn.match(line, [[^\s*$]]) ~= -1
end

local function all(tbl, check)
  for _, entry in ipairs(tbl) do
    if not check(entry) then
      return false
    end
  end
  return true
end

require("neoclip").setup({
  filter = function(data)
    return not all(data.event.regcontents, is_whitespace)
  end,
  keys = {
    telescope = {
      i = {
        select = "<nop>",
        paste = keymap.plugin.neoclip.confirm_select,
        paste_behind = "<nop>",
        replay = "<nop>", -- replay a macro
        delete = keymap.plugin.neoclip.insert_delete_yank,
        custom = {},
      },
      n = {
        select = "<nop>",
        paste = keymap.plugin.neoclip.confirm_select,
        paste_behind = "<nop>",
        replay = "<nop>",
        delete = keymap.plugin.neoclip.noremal_delete_yank,
        custom = {},
      },
    },
  },
})
