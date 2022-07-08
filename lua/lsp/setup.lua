-- https://github.com/neovim/nvim-lspconfig
-- https://github.com/wiliamboman/nvim-lsp-installer
-- https://github.com/ray-x/lsp_signature.nvim
-- https://github.com/stevearc/aerial.nvim

local keymap = require("core.keymap")
local notification = require("lib.notification")

local capabilities = vim.lsp.protocol.make_client_capabilities()
local cmp_lsp_loaded, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")

if cmp_lsp_loaded then
  capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
end

capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
  properties = {
    "documentation",
    "detail",
    "additionalTextEdits",
  },
}

local function disgnostic_settings()
  -- diagnostic style customization
  vim.diagnostic.config({
    virtual_text = {
      prefix = "●",
      source = "always",
    },
    float = {
      source = "always",
    },
    update_in_insert = false,
  })
end

local function on_attach(client, bufnr)
  require("aerial").on_attach(client, bufnr)
  require("lsp_signature").on_attach()
  keymap.register("buffer", "lsp", bufnr)
  disgnostic_settings()
end

local lspconfig_loaded, lspconfig = pcall(require, "lspconfig")
local lsp_installer_loaded, lsp_installer = pcall(require, "nvim-lsp-installer")

if not lspconfig_loaded then
  return notification.info("nvim-lspconfig is not installed", { title = "LSP" })
end

if not lsp_installer_loaded then
  return notification.info("nvim-lsp-installer is not installed", { title = "LSP" })
end

--- SETUP LSP
-- Run nvim-lsp-installer setup before any lsp server configs
lsp_installer.setup({
  automatic_installation = true,
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
})

-- General options for all server configs
local opts = {
  capabilities = capabilities,
  on_attach = on_attach,
  flags = {
    debounce_text_changes = 150,
  },
}

local sumneko_lua = vim.tbl_extend("force", require("lsp.providers.sumneko_lua") or {}, opts)

lspconfig.clangd.setup(opts)
lspconfig.cssls.setup(opts)
lspconfig.cssmodules_ls.setup(opts)
lspconfig.dockerls.setup(opts)
lspconfig.graphql.setup(opts)
lspconfig.html.setup(opts)
lspconfig.pyright.setup(opts)
lspconfig.sumneko_lua.setup(sumneko_lua)
lspconfig.svelte.setup(opts)
lspconfig.tailwindcss.setup(opts)
lspconfig.tsserver.setup(opts)
