local plugins = {
  "wbthomason/packer.nvim", -- Packer can manage itself
  ---- CORE -----------------------------------------------
  -- Core functions
  "nvim-lua/plenary.nvim",
  -- Faster startup
  "lewis6991/impatient.nvim",
  -- Devicons
  "kyazdani42/nvim-web-devicons",
  -- Notification
  {
    "rcarriga/nvim-notify",
    alias = "notify",
  },
  ---- THEMES ---------------------------------------------
  -- Nightwing Colorscheme
  {
    "jadnw/nightwing.nvim",
    alias = "nightwing",
  },
  ---- USER INTERFACES ------------------------------------
  -- Dashboard
  {
    "goolord/alpha-nvim",
    alias = "alpha",
    requires = { "kyazdani42/nvim-web-devicons" },
  },
  -- Buffer Line
  {
    "akinsho/bufferline.nvim",
    alias = "bufferline",
    tag = "*",
    requires = "kyazdani42/nvim-web-devicons",
  },
  -- File tree
  {
    "kyazdani42/nvim-tree.lua",
    alias = "tree",
  },
  -- Status bar
  {
    "nvim-lualine/lualine.nvim",
    alias = "lualine",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  },
  -- Scope for status bar
  {
    "SmiteshP/nvim-gps",
    alias = "gps",
    requires = "nvim-treesitter/nvim-treesitter",
    after = "nvim-treesitter",
  },
  ---- LSP ------------------------------------------------
  {
    "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" },
  },
  {
    "williamboman/nvim-lsp-installer",
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    alias = "null-ls",
  },
  {
    "tami5/lspsaga.nvim",
    alias = "lspsaga",
  },
  {
    "stevearc/aerial.nvim",
    alias = "aerial",
  },
  "ray-x/lsp_signature.nvim",
  "folke/lua-dev.nvim",

  ---- COMPLETIONS ----------------------------------------
  -- Autopairs
  {
    "windwp/nvim-autopairs",
    alias = "autopairs",
  },
  -- Autocomplete & Snippets
  {
    "hrsh7th/cmp-nvim-lsp",
  },
  {
    "hrsh7th/cmp-buffer",
  },
  {
    "hrsh7th/cmp-emoji",
  },
  {
    "hrsh7th/cmp-path",
  },
  {
    "hrsh7th/cmp-cmdline",
  },
  {
    "mtoohey31/cmp-fish",
  },
  {
    "hrsh7th/nvim-cmp",
    alias = "cmp",
  },
  {
    "L3MON4D3/LuaSnip",
  },
  {
    "saadparwaiz1/cmp_luasnip",
  },
  {
    "rafamadriz/friendly-snippets",
  },

  ---- HIGHLIGHTINGS --------------------------------------
  -- Syntax highlightings
  {
    "nvim-treesitter/nvim-treesitter",
    alias = "treesitter",
    run = ":TSUpdate",
  },
  -- Auto close XML tags
  {
    "windwp/nvim-ts-autotag",
    after = "nvim-treesitter",
  },
  -- Rainbow brackets
  {
    "p00f/nvim-ts-rainbow",
    after = "nvim-treesitter",
  },
  ---- DEBUG ADAPTER PROTOCOL -----------------------------
  {
    "mfussenegger/nvim-dap",
    alias = "dap",
  },
  {
    "theHamsta/nvim-dap-virtual-text",
    alias = "dap-virtual-text",
    requires = "mfussenegger/nvim-dap",
  },
  {
    "rcarriga/nvim-dap-ui",
    alias = "dap-ui",
    requires = "mfussenegger/nvim-dap",
  },
  {
    "leoluz/nvim-dap-go",
    alias = "dap-go",
  },
  ---- UTILITIES ------------------------------------------
  -- Show gitsigns
  {
    "lewis6991/gitsigns.nvim",
    alias = "gitsigns",
    tag = "release",
  },
  -- Bufdelete
  "famiu/bufdelete.nvim",
  -- Comment
  {
    "numToStr/Comment.nvim",
    alias = "comment",
    after = "nvim-ts-context-commentstring",
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = "nvim-treesitter",
  },
  -- Indent Guides
  {
    "lukas-reineke/indent-blankline.nvim",
    alias = "indent-blankline",
  },
  -- Colorizer
  {
    "norcalli/nvim-colorizer.lua",
    alias = "colorizer",
  },
  -- Highlight todo, hack, bug comments
  {
    "folke/todo-comments.nvim",
    alias = "todo-comments",
    requires = { "nvim-lua/plenary.nvim" },
  },
  -- Markdown Preview
  {
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = { "markdown" },
  },
  -- Search & Replace
  {
    "nvim-pack/nvim-spectre",
    alias = "spectre",
    requires = "nvim-lua/plenary.nvim",
  },
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    alias = "telescope",
    requires = "nvim-lua/plenary.nvim",
  },
  -- Clipboard Manager
  {
    "AckslD/nvim-neoclip.lua",
    alias = "neoclip",
    requires = "nvim-telescope/telescope.nvim",
  },
  -- Trouble Finder
  {
    "folke/trouble.nvim",
    alias = "trouble",
    requires = "kyazdani42/nvim-web-devicons",
  },
  -- Undotree
  {
    "mbbill/undotree",
    alias = "undotree",
  },
  -- Which Key
  {
    "folke/which-key.nvim",
    alias = "whichkey",
  },
}

local path = require("lib.path")
local notification = require("lib.notification")

local bootstrap = (function()
  local packer_install_path = path.join(path.data, "site", "pack", "packer", "start", "packer.nvim")
  if vim.fn.empty(vim.fn.glob(packer_install_path)) > 0 then
    notification.debug("Installing Packer ...", { title = "Packer" })
    local rtp_addition = path.join(path.data, "site", "pack", "*", "start", "*")
    if not string.find(vim.o.runtimepath, rtp_addition) then
      vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
    end
    return vim.fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      packer_install_path,
    })
  end
end)()

local packer_loaded, packer = pcall(require, "packer")

if not packer_loaded then
  notification.debug("Packer is not installed", { title = "Packer" })
end

packer.init({ autoclean = false })

packer.startup(function(use)
  for _, plug in ipairs(plugins) do
    local cfg_path = path.join("cfg", plug.alias)
    local file_path = path.join(path.config, "lua", cfg_path .. ".lua")

    if path.exists(file_path) then
      plug.config = "require('" .. cfg_path .. "')"
    else
      if plug.alias then
        notification.error("Config file " .. plug.alias .. " is not found", { title = "Packer" })
      end
    end
    use(plug)
  end

  if bootstrap then
    packer.sync()
  end
end)

local packer_user_config = vim.api.nvim_create_augroup("packer_user_config", { clear = true })

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  pattern = { "packer.lua" },
  command = "source <afile> | PackerCompile",
  group = packer_user_config,
})

return packer
