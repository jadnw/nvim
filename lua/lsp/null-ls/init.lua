-- https://github.com/jose-elias-alvarez/null-ls.nvim
local notification = require("lib.notification")

local null_ls_loaded, null_ls = pcall(require, "null-ls")

if not null_ls_loaded then
  notification.error("null-ls is not installed", { title = "null-ls" })
  return
end

local sources = {
  -- CODE ACTIONS
  -- null_ls.builtins.code_actions.gitsigns,
  -- DIAGNOSTICS
  null_ls.builtins.diagnostics.eslint.with({
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte" },
    command = "./node_modules/.bin/eslint",
  }),
  null_ls.builtins.diagnostics.golangci_lint,
  null_ls.builtins.diagnostics.luacheck,
  -- null_ls.builtins.diagnostics.markdownlint,
  null_ls.builtins.diagnostics.pylint,
  -- null_ls.builtins.diagnostics.tsc,
  -- FORMATTING
  null_ls.builtins.formatting.black,
  null_ls.builtins.formatting.clang_format,
  -- null_ls.builtins.formatting.dart_format,
  null_ls.builtins.formatting.fish_indent,
  null_ls.builtins.formatting.gofmt,
  -- null_ls.builtins.formatting.markdownlint,
  null_ls.builtins.formatting.prettier.with({
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "css",
      "scss",
      "less",
      "html",
      "json",
      "jsonc",
      "yaml",
      "markdown",
      "graphql",
      "handlebars",
      "svelte",
    },
    command = "./node_modules/.bin/prettier",
  }),
  null_ls.builtins.formatting.stylua,
}

null_ls.setup({
  debug = true,
  sources = sources,
})
