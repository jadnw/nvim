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
      "<cmd>lua require('telescope.builtin').lsp_definitions(require('telescope.themes').get_dropdown({}))<cr>",
    },
    {
      { "n" },
      "gr",
      "<cmd>lua require('telescope.builtin').lsp_references(require('telescope.themes').get_dropdown({}))<cr>",
    },
    {
      { "n" },
      "go",
      "<cmd>lua require('telescope.builtin').diagnostics(require('telescope.themes').get_dropdown({}))<cr>",
    },
    {
      { "n" },
      "<leader>ca",
      "<cmd>lua require('telescope.builtin').lsp_code_actions(require('telescope.themes').get_dropdown({}))<cr>",
    },
    { { "n" }, "gh", "<cmd>Lspsaga hover_doc<cr>" },
    { { "n" }, "[g", "<cmd>Lspsaga diagnostic_jump_prev<cr>" },
    { { "n" }, "]g", "<cmd>Lspsaga diagnostic_jump_next<cr>" },
    { { "n" }, "<c-b>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>" },
    { { "n" }, "<c-f>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>" },
    { { "n" }, "<leader>cn", "<cmd>Lspsaga rename<cr>" },
  },
}

keymap.plugin = {
  cmp = {
    prev_item = "<c-k>",
    next_item = "<c-j>",
    confirm = "<cr>",
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
}

return keymap
