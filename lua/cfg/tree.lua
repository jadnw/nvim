-- https://github.com/kyazdani42/nvim-tree.lua
vim.g.nvim_tree_git_hl = 1 -- 0 by default, will enable file highlight for git attributes (can be used without the icons).
vim.g.nvim_tree_highlight_opened_files = 1 --0 by default, will enable folder and file icon highlight for opened files/directories.
vim.g.nvim_tree_root_folder_modifier = ":~" -- This is the default. See :help filename-modifiers for more options
vim.g.nvim_tree_add_trailing = 0 -- 0 by default, append a trailing slash to folder names
vim.g.nvim_tree_group_empty = 0 -- 0 by default, compact folders that only contain a single folder into one node in the file tree
vim.g.nvim_tree_icon_padding = "  " -- one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
vim.g.nvim_tree_symlink_arrow = " ➛  " -- defaults to " ➛ ". used as a separator between symlinks" source and target.
vim.g.nvim_tree_respect_buf_cwd = 0 -- 0 by default, will change cwd of nvim-tree to that of new buffer"s when opening nvim-tree.
vim.g.nvim_tree_create_in_closed_folder = 1 -- 0 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
vim.g.nvim_tree_special_files = { "README.md", "Makefile", "MAKEFILE" } -- List of filenames that gets highlighted with NvimTreeSpecialFile
vim.g.nvim_tree_show_icons = {
  git = 0,
  folders = 1,
  files = 1,
  folder_arrows = 0,
}
vim.g.nvim_tree_icons = {
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
}

require("nvim-tree").setup({
  view = {
    width = 36,
    hide_root_folder = false,
  },
  filters = {
    dotfiles = true,
    custom = { "__pycache__", ".git", "node_modules" },
  },
})
