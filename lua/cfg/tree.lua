-- https://github.com/kyazdani42/nvim-tree.lua
require("nvim-tree").setup({
  view = {
    width = 32,
    hide_root_folder = false,
    preserve_window_proportions = true,
  },
  renderer = {
    group_empty = false,
    highlight_git = true,
    highlight_opened_files = "none",
    icons = {
      padding = "  ",
      symlink_arrow = "  ",
      show = {
        file = true,
        folder = true,
        folder_arrow = false,
        git = false,
      },
      glyphs = {
        default = "",
        symlink = "",
        git = {
          unstaged = "",
          staged = "",
          unmerged = "שׂ",
          renamed = "凜",
          untracked = "",
          deleted = "ﮁ",
          ignored = "ﴔ",
        },
        folder = {
          default = "",
          open = "ﱮ",
          empty = "",
          empty_open = "ﱮ",
          symlink = "",
          symlink_open = "ﱮ",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
  },
  filters = {
    dotfiles = true,
    custom = { "__pycache__$", ".git$", "node_modules$" },
  },
  git = {
    enable = true,
    ignore = false,
    timeout = 400,
  },
})
