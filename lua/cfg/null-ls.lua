-- https://github.com/jose-elias-alvarez/null-ls.nvim

local notification = require("lib.notification")

local null_ls_loaded, null_ls = pcall(require, "null-ls")

if not null_ls_loaded then
  notification.error("null-ls is not installed", { title = "null-ls" })
  return
end

local sources = {
  null_ls.builtins.code_actions.gitsigns,
  null_ls.builtins.diagnostics.eslint,
  null_ls.builtins.diagnostics.luacheck,
  -- null_ls.builtins.diagnostics.markdownlint,
  null_ls.builtins.diagnostics.pylint,
  -- null_ls.builtins.diagnostics.tsc,
  null_ls.builtins.formatting.black,
  null_ls.builtins.formatting.clang_format,
  -- null_ls.builtins.formatting.dart_format,
  null_ls.builtins.formatting.fish_indent,
  null_ls.builtins.formatting.gofmt,
  -- null_ls.builtins.formatting.markdownlint,
  null_ls.builtins.formatting.prettier,
  null_ls.builtins.formatting.stylua,
}

null_ls.setup({
  sources = sources,
})