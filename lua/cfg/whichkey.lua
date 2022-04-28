-- https://github.com/folke/which-key.nvim
local keymap = require("core.keymap")
local whichkey = require("which-key")

local opts = {
  window = {
    border = "double",
  },
  layout = {
    spacing = 6,
    align = "center",
  },
}

local n_opts = {
  mode = "n", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

whichkey.register(keymap.whichkey_n_mappings, n_opts)

whichkey.setup(opts)
