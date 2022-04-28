local keymap = require("core.keymap")

for group, _ in pairs(keymap.global) do
  keymap.register("global", group, nil)
end
