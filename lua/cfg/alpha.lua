-- https://github.com/goolord/alpha-nvim
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")

dashboard.section.header.val = {
  [[▒███████▒ ▄▄▄     ▓██   ██▓▓█████▄ ▓█████  ███▄    █       █     █░█    ██ ]],
  [[▒ ▒ ▒ ▄▀░▒████▄    ▒██  ██▒▒██▀ ██▌▓█   ▀  ██ ▀█   █      ▓█░ █ ░█░██  ▓██▒]],
  [[░ ▒ ▄▀▒░ ▒██  ▀█▄   ▒██ ██░░██   █▌▒███   ▓██  ▀█ ██▒     ▒█░ █ ░█▓██  ▒██░]],
  [[  ▄▀▒   ░░██▄▄▄▄██  ░ ▐██▓░░▓█▄   ▌▒▓█  ▄ ▓██▒  ▐▌██▒     ░█░ █ ░█▓▓█  ░██░]],
  [[▒███████▒ ▓█   ▓██▒ ░ ██▒▓░░▒████▓ ░▒████▒▒██░   ▓██░     ░░██▒██▓▒▒█████▓ ]],
  [[░▒▒ ▓░▒░▒ ▒▒   ▓▒█░  ██▒▒▒  ▒▒▓  ▒ ░░ ▒░ ░░ ▒░   ▒ ▒      ░ ▓░▒ ▒ ░▒▓▒ ▒ ▒ ]],
  [[░░▒ ▒ ░ ▒  ▒   ▒▒ ░▓██ ░▒░  ░ ▒  ▒  ░ ░  ░░ ░░   ░ ▒░       ▒ ░ ░ ░░▒░ ░ ░ ]],
  [[░ ░ ░ ░ ░  ░   ▒   ▒ ▒ ░░   ░ ░  ░    ░      ░   ░ ░        ░   ░  ░░░ ░ ░ ]],
  [[  ░ ░          ░  ░░ ░        ░       ░  ░         ░          ░      ░     ]],
  [[░                  ░ ░      ░                                              ]],
}

dashboard.section.header.opts.hl = "CursorLineNr"

dashboard.section.buttons.val = {
  dashboard.button("e", "  New File", ":ene <BAR> startinsert <CR>"),
  dashboard.button("Space t r", "  Recent Files", ":lua require('telescope.builtin').oldfiles()<CR>"),
  dashboard.button("Space t f", "  Find File", ":lua require('telescope.builtin').fd()<CR>"),
  dashboard.button("Space t s", "  Find Words", ":lua require('telescope.builtin').grep_string()<CR>"),
  dashboard.button("Space t b", "  Bookmarks", ":lua require('telescope.builtin').marks()<CR>"),
  dashboard.button("Space p s", "  Update Plugins", ":PackerSync<CR>"),
}

dashboard.section.footer.val = "Have a happy coding time, Jaden!"

alpha.setup(dashboard.config)
