-- https://github.com/glepnir/lspsaga

local icon = require("lib.icon")

require("lspsaga").setup({
  debug = false,
  use_saga_diagnostic_sign = true,
  -- diagnostic signs
  error_sign = icon.lspsaga.error,
  warn_sign = icon.lspsaga.warn,
  hint_sign = icon.lspsaga.hint,
  infor_sign = icon.lspsaga.info,
  diagnostic_header_icon = icon.lspsaga.diagnostic_header,
  -- code action title icon
  -- code_action_icon = icon.lspsaga.code_action,
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 20,
    virtual_text = true,
  },
  finder_definition_icon = icon.lspsaga.finder_definition,
  finder_reference_icon = icon.lspsaga.finder_reference,
  max_preview_lines = 10, -- preview lines of lsp_finder and definition preview
  finder_action_keys = {
    open = "o",
    vsplit = "s",
    split = "i",
    quit = "q",
    scroll_down = "<C-f>",
    scroll_up = "<C-b>", -- quit can be a table
  },
  code_action_keys = {
    quit = "q",
    exec = "<CR>",
  },
  rename_action_keys = {
    quit = "<C-c>",
    exec = "<CR>",  -- quit can be a table
  },
  definition_preview_icon = icon.lspsaga.definition_preview,
  border_style = "double",
  rename_prompt_prefix = icon.lspsaga.rename_prompt_prefix,
})
