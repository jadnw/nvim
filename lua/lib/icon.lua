local icon = {}

icon.bufferline = {
  indicator = "▎",
  buffer_close = "窱",
  modified = "",
  close = "",
  left_trunc_marker = "",
  right_trunc_marker = "",
}

icon.diff = {
  add = "",
  change = " ",
  delete = " ",
}

icon.diagnostics = {
  error = "ﮏ",
  warn = "",
  info = "",
  hint = "",
  other = "",
}

icon.notify = {
  ERROR = "ﮏ",
  WARN = "",
  INFO = "",
  DEBUG = "",
  TRACE = "",
}

icon.cmp_kinds = {
  Text = "[ﭨ  Text]",
  Method = "[  Method]",
  Function = "[ Function]",
  Constructor = "[華 Constructor]",
  Field = "[  Field]",
  Variable = "[硫 Variable]",
  Class = "[ﰪ  Class]",
  Interface = "[ﯱ  Interface]",
  Module = "[  Module]",
  Property = "[ﯟ  Property]",
  Unit = "[塞 Unit]",
  Value = "[  Value]",
  Enum = "[  Enum]",
  Keyword = "[  Keyword]",
  Snippet = "[謹 Snippet]",
  Color = "[  Color]",
  File = "[  File]",
  Reference = "[ﰳ  Reference]",
  Folder = "[  Folder]",
  EnumMember = "[  EnumMember]",
  Constant = "[  Const]",
  Struct = "[  Struct]",
  Event = "[悔 Event]",
  Operator = "[ﲅ  Operator]",
  TypeParameter = "[ﴞ  TypeParam]",
}

icon.todo_comments = {
  fix = "",
  todo = "",
  hack = "",
  warn = "",
  perf = "龍",
  note = "ﴬ",
}

icon.lspsaga = {
  error = "ﮏ",
  warn = "",
  info = "ﴔ",
  hint = "",
  diagnostic_header = "  ",
  code_action = "  ",
  finder_definition = "  ",
  finder_reference = "ﰳ  ",
  definition_preview = "  ",
  rename_prompt_prefix = "  ",
}

return icon
