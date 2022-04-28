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
  vim.diagnostic.config(
      {
          virtual_text = {
              prefix = "●",
              source = "always"
          },
          float = {
              source = "always"
          },
          update_in_insert = false
      }
  )
end

local function on_attach(client, bufnr)
  require("aerial").on_attach(client, bufnr)
  require("lsp_signature").on_attach()
  keymap.register("buffer", "lsp", bufnr)
  disgnostic_settings()
end

local lsp_installer_loaded, lsp_installer = pcall(require, "nvim-lsp-installer")

if not lsp_installer_loaded then
  notification.error("nvim-lsp-installer is not installed", { title = "LSP" })
end

lsp_installer.settings({
  ui = {
    icons = {
      server_installed = "✓",
      server_pending = "➜",
      server_uninstalled = "✗",
    },
  },
})

lsp_installer.on_server_ready(function(server)
  local opts = {
    capabilities = capabilities,
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    },
  }

  local provider_loaded, provider = pcall(require, "lsp.providers." .. server.name)
  opts = vim.tbl_extend("force", provider, opts)

  server:setup(opts)
end)