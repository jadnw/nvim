-- https://github.com/folke/todo-comments.nvim

local icon = require("lib.icon")

require("todo-comments").setup({
  keywords = {
    -- alt = alias
    FIX = {
      icon = icon.todo_comments.fix,
      color = "#DC2626",
      alt = { "FIXME", "BUG", "FIXIT", "ISSUE", "!" },
    },
    TODO = { icon = icon.todo_comments.todo, color = "#10B981" },
    HACK = { icon = icon.todo_comments.hack, color = "#7C3AED" },
    WARN = { icon = icon.todo_comments.warn, color = "#FBBF24", alt = { "WARNING", "XXX" } },
    PERF = { icon = icon.todo_comments.perf, color = "#FC9868", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
    NOTE = { icon = icon.todo_comments.note, color = "#2563EB", alt = { "INFO" } },
  },
})
