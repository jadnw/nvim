-- https://github.com/nvim-lualine/lualine.nvim

local icon = require("lib.icon")

--- Get python venv name
-- @param venv string
-- @return string
local function cleanup_env(venv)
  if string.find(venv, "/") then
    local final_venv = venv
    for w in venv:gmatch("([^/]+)") do
      final_venv = w
    end
    venv = final_venv
  end
  return venv
end

local max_width = 100
local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
  end,
  over_width = function()
    return vim.fn.winwidth(0) > max_width
  end,
}

local gps_loaded, gps = pcall(require, "nvim-gps")

local components = {
  mode = {
    function()
      local alias = {
        n = "  NORMAL",
        v = "  VISUAL",
        V = "勺 V-LINE",
        [""] = "勺 V-BLOCK",
        s = "閭 SELECT",
        S = "  S-LINE",
        [""] = "𧻓 S-BLOCK",
        i = "  INSERT",
        R = "凌 REPLACE",
        c = "גּ  COMMAND",
        r = "  PROMPT",
        ["!"] = "  EXTERNAL",
        t = "  TERMINAL",
      }
      return alias[vim.fn.mode()]
    end,
    padding = { left = 1, right = 1 },
  },
  branch = {
    "b:gitsigns_head",
    icon = "שׂ",
    color = { gui = "bold" },
  },
  filename = {
    function()
      local status_ok, devicons = pcall(require, "nvim-web-devicons")
      local f_name, f_ext = vim.fn.expand("%:t"), vim.fn.expand("%:e")
      f_ext = f_ext ~= "" and f_ext or vim.bo.filetype

      if not status_ok then
        return f_name
      end

      local file_icon, _ = devicons.get_icon(f_name, f_ext)
      return file_icon .. " " .. f_name
    end,
    color = { gui = "bold" },
    padding = { left = 1, right = 1 },
  },
  diff = {
    "diff",
    colored = true,
    diff_color = {
      added = "DiffAdd",
      modified = "DiffChange",
      removed = "DiffDelete",
    },
    symbols = {
      added = icon.diff.add,
      modified = icon.diff.change,
      removed = icon.diff.delete,
    },
    source = nil,
  },
  python_env = {
    function()
      if vim.bo.filetype == "python" then
        local venv = os.getenv("CONDA_DEFAULT_ENV")
        if venv then
          return string.format(" |   (%s)", cleanup_env(venv))
        end
        venv = os.getenv("VIRTUAL_ENV")
        if venv then
          return string.format(" |   (%s)", cleanup_env(venv))
        end
        return ""
      end
      return ""
    end,
    cond = conditions.over_width,
  },
  diagnostics = {
    "diagnostics",
    sources = { "nvim_diagnostic" },
    symbols = { error = " ", warn = " ", info = " ", hint = " " },
    cond = conditions.over_width,
  },
  treesitter = {
    function()
      local b = vim.api.nvim_get_current_buf()

      if next(vim.treesitter.highlighter.active[b]) then
        return " "
      end

      return ""
    end,
    cond = conditions.over_width,
  },
  lsp = {
    function(msg)
      msg = msg or "  Inactive"
      local buf_clients = vim.lsp.buf_get_clients(0)
      if next(buf_clients) == nil then
        -- TODO: clean up this if statement
        if type(msg) == "boolean" or #msg == 0 then
          return "  Inactive"
        end
        return msg
      end

      local buf_ft = vim.bo.filetype
      local buf_client_names = {}

      -- add client
      for _, client in pairs(buf_clients) do
        if client.name ~= "null-ls" then
          table.insert(buf_client_names, client.name)
        end
      end

      -- add formatter
      local formatters = require "lsp.null-ls.formatters"
      local supported_formatters = formatters.list_registered(buf_ft)
      vim.list_extend(buf_client_names, supported_formatters)

      -- add linter
      local linters = require "lsp.null-ls.linters"
      local supported_linters = linters.list_registered(buf_ft)
      vim.list_extend(buf_client_names, supported_linters)

      if vim.tbl_isempty(buf_client_names) == 0 then
        return "  Inactive"
      end

      return "  " .. table.concat(buf_client_names, ", ")
    end,
    color = { gui = "bold" },
    cond = conditions.over_width,
  },
  gps = {
    gps.get_location,
    cond = gps_loaded and gps.is_available,
  },
  location = {
    "location",
    cond = conditions.over_width,
  },
  progress = {
    "progress",
    cond = conditions.over_width,
  },
  -- spaces = {
  --   function()
  --     if not vim.api.nvim_buf_get_option(0, "expandtab") then
  --       return "Tab size: " .. vim.api.nvim_buf_get_option(0, "tabstop") .. " "
  --     end
  --     local size = vim.api.nvim_buf_get_option(0, "shiftwidth")
  --     if size == 0 then
  --       size = vim.api.nvim_buf_get_option(0, "tabstop")
  --     end
  --     return "Spaces: " .. size .. " "
  --   end,
  --   cond = conditions.over_width,
  -- },
  -- encoding = {
  --   "o:encoding",
  --   fmt = string.upper,
  --   cond = conditions.hide_in_width,
  -- },
  filetype = { "filetype", cond = conditions.hide_in_width },
  scrollbar = {
    function()
      local current_line = vim.fn.line(".")
      local total_lines = vim.fn.line("$")
      local chars = { "█", "▇", "▆", "▅", "▄", "▃", "▂", "▁" }
      local line_ratio = current_line / total_lines
      local index = math.ceil(line_ratio * #chars)
      return chars[index]
    end,
    color = {
      fg = "#ffffff",
      bg = "#000000",
    },
    padding = { left = 0, right = 0 },
  },
}

local lualine = require("lualine")

lualine.setup({
  options = {
    component_separators = {
      left = "",
      right = "",
    },
    section_separators = {
      left = "🭬",
      right = "🭮",
    },
    disabled_filetypes = {
      "NvimTree",
      "alpha",
      "Outline",
      "spectre_panel",
      "Trouble",
      "aerial",
      "undotree",
    },
  },
  sections = {
    lualine_a = { components.mode },
    lualine_b = { components.filename, components.python_env },
    lualine_c = {
      components.gps,
    },
    lualine_x = {
      components.branch,
      components.diff,
      components.diagnostics,
    },
    lualine_y = {
      components.treesitter,
      components.lsp,
    },
    lualine_z = {
      components.location,
      components.scrollbar,
    },
  },
})
