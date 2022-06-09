-- https://github.com/hrsh7th/nvim-cmp
-- https://github.com/hrsh7th/cmp-nvim-lsp
-- https://github.com/hrsh7th/cmp-path
-- https://github.com/hrsh7th/cmp-buffer
-- https://github.com/hrsh7th/cmp-cmdline
-- https://github.com/mtoohey31/cmp-fish
-- https://github.com/L3MON4D3/LuaSnip
-- https://github.com/saadparwaiz1/cmp_luasnip
-- https://github.com/rafamadriz/friendly-snippets
local keymap = require("core.keymap")
local icon = require("lib.icon")

local cmp = require("cmp")

-- local under_compare = function(entry1, entry2)
--   local _, entry1_under = entry1.completion_item.label:find("^_+")
--   local _, entry2_under = entry2.completion_item.label:find("^_+")
--   entry1_under = entry1_under or 0
--   entry2_under = entry2_under or 0
--   -- _ completions at the beginning come later
--   return entry1_under < entry2_under
-- end

cmp.setup({
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  completion = {
    keyword_length = 2,
  },
  formatting = {
    fields = { "abbr", "kind" },
    format = function(_, vim_item)
      vim_item.kind = icon.cmp_kinds[vim_item.kind] or ""
      return vim_item
    end,
  },
  sources = cmp.config.sources({
    { name = "luasnip" },
    { name = "nvim_lsp" },
    { name = "path" },
    { name = "buffer" },
    { name = "cmdline" },
    { name = "fish" },
    { name = "emoji" },
  }),
  mapping = {
    [keymap.plugin.cmp.confirm] = cmp.mapping(cmp.mapping.confirm(), { "i", "s", "c" }),
    [keymap.plugin.cmp.prev_item] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "s", "c" }),
    [keymap.plugin.cmp.next_item] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "s", "c" }),
    [keymap.plugin.cmp.prev_scroll] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "s", "c" }),
    [keymap.plugin.cmp.next_scroll] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "s", "c" }),
    [keymap.plugin.cmp.next_item_or_confirm] = cmp.mapping(cmp.mapping.confirm({ select = true }), { "i", "s", "c" }),
    [keymap.plugin.cmp.prev_5_item] = cmp.mapping(function(fallback)
      if cmp.visible() then
        for i = 1, 5, 1 do
          cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
        end
      else
        fallback()
      end
    end, { "i", "s", "c" }),
    [keymap.plugin.cmp.next_5_item] = cmp.mapping(function(fallback)
      if cmp.visible() then
        for i = 1, 5, 1 do
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        end
      else
        fallback()
      end
    end, { "i", "s", "c" }),
    [keymap.plugin.cmp.toggle_complete] = cmp.mapping(function()
      if cmp.visible() then
        cmp.abort()
      else
        cmp.complete()
      end
    end, { "i", "s" }),
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      -- under_compare,
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.length,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.order,
      -- kind_compare
    },
  },
})
-- Set configuration for specific filetype.
cmp.setup.filetype("gitcommit", {
  sources = cmp.config.sources({
    { name = "cmp_git" }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = "buffer" },
  }),
})

-- Set cmdline options
cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline("?", {
  sources = {
    { name = "buffer" },
  },
})

cmp.setup.cmdline(":", {
  sources = cmp.config.sources({
    { name = "path" },
  }, {
    { name = "cmdline" },
  }),
})
