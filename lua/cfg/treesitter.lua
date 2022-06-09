-- https://github.com/nvim-treesitter/nvim-treesitter
local tsconfigs = require("nvim-treesitter.configs")

tsconfigs.setup({
  ensure_installed = {
    "bash",
    "c",
    "cpp",
    "css",
    "dockerfile",
    "fish",
    "gdscript",
    "go",
    "html",
    "javascript",
    "json",
    "json5",
    "lua",
    "make",
    "markdown",
    "python",
    "scss",
    "svelte",
    "toml",
    "tsx",
    "typescript",
    "yaml",
  },
  ignore_install = { "haskell", "rust" },
  sync_install = false,
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  autotag = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
  rainbow = {
    enable = true,
    extended_mode = true,
    max_file_lines = nil,
  },
})
