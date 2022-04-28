-- https://github.com/folke/which-key.nvim

local whichkey = require("which-key")

local opts = {
  window = {
    border = "double",
  },
  layout = {
    spacing = 6,
    align = "center",
  },
}

local n_opts = {
  mode = "n", -- NORMAL mode
  -- prefix: use "<leader>f" for example for mapping everything related to finding files
  -- the prefix is prepended to every mapping part of `mappings`
  prefix = "<leader>",
  buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
  silent = true, -- use `silent` when creating keymaps
  noremap = true, -- use `noremap` when creating keymaps
  nowait = false, -- use `nowait` when creating keymaps
}

local n_mappings = {
  b = {
    name = "Buffers",
    c = {
      ":lua require('bufdelete').bufdelete(0)<CR>",
      "Close buffer",
    },
    w = {
      ":lua require('bufdelete').bufwipeout(0)<CR>",
      "Wipeout buffer",
    },
    e = {
      ":BufferLinePickClose<CR>",
      "Pick to close",
    },
    f = { ":Telescope buffers<CR>", "Find buffers" },
    j = { ":BufferLineCycleNext<CR>", "Next" },
    k = { ":BufferLineCyclePrev<CR>", "Prev" },
    h = { ":BufferLineCloseLeft<CR>", "Close left" },
    l = {
      ":BufferLineCloseRight<CR>",
      "Close right",
    },
    p = { ":BufferLinePick<CR>", "Pick a buffer" },
    s = {
      ":BufferLineSortByDirectory<CR>",
      "Sort by directory",
    },
    S = {
      ":BufferLineSortByExtension<CR>",
      "Sort by extension",
    },
  },
  d = {
    name = "Debugger",
    t = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Toggle Breakpoint" },
    b = { "<cmd>lua require'dap'.step_back()<CR>", "Step Back" },
    c = { "<cmd>lua require'dap'.continue()<CR>", "Continue" },
    C = { "<cmd>lua require'dap'.run_to_cursor()<CR>", "Run To Cursor" },
    d = { "<cmd>lua require'dap'.disconnect()<CR>", "Disconnect" },
    g = { "<cmd>lua require'dap'.session()<CR>", "Get Session" },
    i = { "<cmd>lua require'dap'.step_into()<CR>", "Step Into" },
    o = { "<cmd>lua require'dap'.step_over()<CR>", "Step Over" },
    u = { "<cmd>lua require'dap'.step_out()<CR>", "Step Out" },
    p = { "<cmd>lua require'dap'.pause.toggle()<CR>", "Pause" },
    r = { "<cmd>lua require'dap'.repl.toggle()<CR>", "Toggle Repl" },
    s = { "<cmd>lua require'dap'.continue()<CR>", "Start" },
    q = { "<cmd>lua require'dap'.close()<CR>", "Quit" },
  },
  G = {
    name = "Git",
    j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
    k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
    l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame" },
    p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
    r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
    R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
    s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
    u = {
      "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>",
      "Undo Stage Hunk",
    },
    o = { "<cmd>Telescope git_status<CR>", "Open changed file" },
    b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
    c = { "<cmd>Telescope git_commits<CR>", "Checkout commit" },
    C = {
      "<cmd>Telescope git_bcommits<CR>",
      "Checkout commit(for current file)",
    },
    d = {
      "<cmd>Gitsigns diffthis HEAD<CR>",
      "Git Diff",
    },
  },
  l = {
    name = "LSP",
    g = {
      name = "Goto",
      d = { ":lua vim.lsp.buf.definition()<CR>", "Definition" },
      D = { ":lua vim.lsp.buf.declaration()<CR>", "Declaration" },
      i = { ":lua vim.lsp.buf.implementation()<CR>", "Implementation" },
      h = { ":lua vim.lsp.buf.hover()<CR>", "Hover" },
      s = { ":lua vim.lsp.buf.signature_help()<CR>", "Signature" },
      t = { ":lua vim.lsp.buf.type_definition()<CR>", "Type Definition" },
    },
    a = { ":lua require('plugins.configs.telescope').code_actions()<CR>", "Code Action" },
    b = { ":Telescope diagnostics bufnr=0 theme=get_ivy<CR>", "Buffer Diagnostics" },
    d = { ":Telescope diagnostics<CR>", "Diagnostics" },
    f = { ":lua vim.lsp.buf.formatting()<CR>", "Format" },
    i = { ":LspInfo<CR>", "Info" },
    I = { ":LspInstallInfo<CR>", "Installer Info" },
    j = {
      ":lua vim.diagnostic.goto_next()<CR>",
      "Next Diagnostic",
    },
    k = {
      ":lua vim.diagnostic.goto_prev()<CR>",
      "Prev Diagnostic",
    },
    l = { ":lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
    q = { ":lua vim.diagnostic.setloclist()<CR>", "Quickfix" },
    r = { ":lua vim.lsp.buf.rename()<CR>", "Rename" },
    s = { ":Telescope lsp_document_symbols<CR>", "Document Symbols" },
    S = {
      ":Telescope lsp_dynamic_workspace_symbols<CR>",
      "Workspace Symbols",
    },
    e = { ":Telescope quickfix<CR>", "Telescope Quickfix" },
  },
  m = {
    ":MarkdownPreview<CR>",
    "Markdown Preview",
  },
  n = {
    ":lua require('nvim-tree').toggle()<CR>",
    "Tree",
  },
  p = {
    name = "Packer",
    c = { ":PackerCompile<CR>", "Compile" },
    i = { ":PackerInstall<CR>", "Install" },
    s = { ":PackerSync<CR>", "Sync" },
    S = { ":PackerStatus<CR>", "Status" },
    u = { ":PackerUpdate<CR>", "Update" },
  },
  s = {
    name = "Spectre",
    o = { ":lua require('spectre').open()<CR>", "Open" },
    w = { ":lua require('spectre').open_visual({ select_word = true })<CR>", "Select Word (Visual)" },
    v = { ":lua require('spectre').open_visual()<CR>", "Visual" },
    f = { ":lua require('spectre').open_file_search()<CR>", "File Search" },
  },
  t = {
    name = "Telescope",
    b = {
      ":lua require('telescope.builtin').marks()<CR>",
      "Bookmarks",
    },
    c = {
      ":lua require('telescope.builtin').command_history()<CR>",
      "Command History",
    },
    f = {
      ":lua require('telescope.builtin').fd()<CR>",
      "Find files",
    },
    k = {
      ":lua require('telescope.builtin').keymaps()<CR>",
      "Keymaps",
    },
    m = {
      ":lua require('telescope.builtin').man_pages()<CR>",
      "Man pages",
    },
    r = {
      ":lua require('telescope.builtin').oldfiles()<CR>",
      "Recent files",
    },
    s = {
      ":lua require('telescope.builtin').search_history()<CR>",
      "Search History",
    },
    w = {
      ":lua require('telescope.builtin').live_grep()<CR>",
      "Find words",
    },
  },
  T = {
    name = "Trouble",
    o = { ":TroubleToggle<CR>", "Open" },
    w = { ":TroubleToggle workspace_diagnostics<CR>", "Workspace Diagnostics" },
    d = { ":TroubleToggle document_diagnostics<CR>", "Document Diagnostics" },
    q = { ":TroubleToggle quickfix<CR>", "Quick Fix" },
    l = { ":TroubleToggle loclist<CR>", "Loclist" },
  },
}

whichkey.register(n_mappings, n_opts)

whichkey.setup(opts)
