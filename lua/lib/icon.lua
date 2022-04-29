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
  add = "樂",
  change = " ",
  delete = " ",
}

icon.diagnostics = {
  error = "ﮏ",
  warn = "爫",
  info = "",
  hint = "",
  other = "",
}

icon.notify = {
  ERROR = "ﮏ",
  WARN = "爫",
  INFO = "",
  DEBUG = "",
  TRACE = "",
}

icon.gps = {
  class = "ﰪ ",
  func = " ",
  method = " ",
  container = "ﰩ ",
  tag = "笠",
}

icon.cmp_kinds = {
  Text = "[ﭨ  Text]",
  Method = "[  Method]",
  Function = "[  Function]",
  Constructor = "[襁 Constructor]",
  Field = "[  Field]",
  Variable = "[﯑  Variable]",
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
