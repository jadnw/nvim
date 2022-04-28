vim.g.mapleader = " "

local keymap = {}

local generic_opts = {
  noremap = true,
  silent = true,
}

keymap.register = function(range, group, bufnr)
  local group_map = keymap[range][group]

  for _, key in ipairs(group_map) do
    local opts = generic_opts

    if bufnr then
      opts.buffer = true
    end

    opts = vim.tbl_extend("force", opts, key[4] or {})

    vim.keymap.set(key[1], key[2], key[3], opts)
  end
end

keymap.global = {
  basic = {
    -- jj to quit insert mode
    { { "i" }, "jj", "<Esc>" },
    -- Ctrl-h/j/k/l to navigate around windows
    { { "n" }, "<C-h>", "<C-w>h" },
    { { "n" }, "<C-j>", "<C-w>j" },
    { { "n" }, "<C-k>", "<C-w>k" },
    { { "n" }, "<C-l>", "<C-w>l" },
    -- Ctrl-up/down/left/right to resize window
    { { "n" }, "<C-Up>", ":resize -2<CR>" },
    { { "n" }, "<C-Down>", ":resize +2<CR>" },
    { { "n" }, "<C-Left>", ":vertical resize -2<CR>" },
    { { "n" }, "<C-Right>", ":vertical resize +2<CR>" },
    -- Alt-j/k to move current line / block
    { { "n", "v" }, "<A-j>", ":m .+1<CR>==gi" },
    { { "n", "v" }, "<A-k>", ":m .-2<CR>==gi" },
    { { "i" }, "<A-j>", "<Esc>:m .+1<CR>==gi" },
    { { "i" }, "<A-k>", "<Esc>:m .-2<CR>==gi" },
    -- J/K to move selected line/block in visual mode
    { { "v" }, "J", ":move '>+1<CR>gv-gv" },
    { { "v" }, "K", ":move '<-2<CR>gv-gv" },
    -- Ctrl-h/j/k/l to navigate around terminals
    { { "t" }, "<C-h>", "<C-\\><C-N><C-w>h" },
    { { "t" }, "<C-j>", "<C-\\><C-N><C-w>j" },
    { { "t" }, "<C-k>", "<C-\\><C-N><C-w>k" },
    { { "t" }, "<C-l>", "<C-\\><C-N><C-w>l" },
    -- </> to indent
    { { "v" }, "<", "<gv" },
    { { "v" }, ">", ">gv" },
    -- Ctrl-j/k to select tab completion
    { { "c" }, "<C-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true } },
    { { "c" }, "<C-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true } },
  },
  tree = {
    { { "n", "i", "v" }, "<C-n>", ":lua require('nvim-tree').toggle()<CR>" },
  },
  bufferline = {
    { { "n" }, "<S-j>", ":BufferLineCycleNext<CR>" },
    { { "n" }, "<S-k>", ":BufferLineCyclePrev<CR>" },
    { { "n" }, "<S-h>", ":BufferLineMovePrev<CR>" },
    { { "n" }, "<S-l>", ":BufferLineMoveNext<CR>" },
    { { "n" }, "<S-w>", ":lua require('bufdelete').bufwipeout(0)<CR>" },
    { { "n" }, "<S-c>", ":lua require('bufdelete').bufdelete(0)<CR>" },
  },
}

keymap.buffer = {
  lsp = {
    {
      { "n" },
      "gd",
      ":lua require('telescope.builtin').lsp_definitions(require('telescope.themes').get_dropdown({}))<CR>",
    },
    {
      { "n" },
      "gr",
      ":lua require('telescope.builtin').lsp_references(require('telescope.themes').get_dropdown({}))<CR>",
    },
    {
      { "n" },
      "go",
      ":lua require('telescope.builtin').diagnostics(require('telescope.themes').get_dropdown({}))<CR>",
    },
    {
      { "n" },
      "ga",
      ":lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_dropdown({}))<CR>",
    },
    { { "n" }, "gh", ":Lspsaga hover_doc<CR>" },
    { { "n" }, "gj", ":Lspsaga diagnostic_jump_prev<CR>" },
    { { "n" }, "gk", ":Lspsaga diagnostic_jump_next<CR>" },
    { { "n" }, "<c-b>", ":lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>" },
    { { "n" }, "<c-f>", ":lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>" },
    { { "n" }, "<leader>cn", ":Lspsaga rename<CR>" },
  },
}

keymap.plugin = {
  cmp = {
    prev_item = "<c-k>",
    next_item = "<c-j>",
    confirm = "<CR>",
    next_item_or_confirm = "<tab>",
    prev_5_item = "<c-u>",
    next_5_item = "<c-d>",
    toggle_complete = "kk",
    prev_scroll = "<c-b>",
    next_scroll = "<c-f>",
  },
  comment = {
    normal_line_toggle = "gcc",
    normal_block_toggle = "gCC",
    normal_prev_rows = "gcO",
    normal_next_rows = "gco",
    noremal_end_line = "gcA",
    visual_line_toggle = "gc",
    visual_block_toggle = "gC",
  },
  neoclip = {
    confirm_select = "<cr>",
    insert_delete_yank = "<c-d>",
    noremal_delete_yank = "dd",
  },
}

keymap.whichkey_n_mappings = {
  a = {
    name = "Aerial",
    t = {
      ":AerialToggle! right<CR>",
      "Toggle",
    },
    j = {
      ":AerialNext<CR>",
      "Next",
    },
    k = {
      ":AerialPrev<CR>",
      "Prev",
    },
    h = {
      ":AerialNextUp<CR>",
      "Next Up",
    },
    l = {
      ":AerialPrevUp<CR>",
      "Prev Up",
    },
  },
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
  c = {
    ":lua require('telescope').extensions.neoclip.default(require('telescope.themes').get_dropdown({}))<CR>",
    "Clipboard",
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
    w = { ":lua require('spectre').open_visual({ select_word = true })<CR>", "Select Word" },
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
    t = {
      ":TodoTelescope theme=dropdown<CR>",
      "Todos",
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

return keymap
