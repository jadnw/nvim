-- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation#Javascript-chrome
-- build vscode-chrome-debug
--
-- git clone https://github.com/Microsoft/vscode-chrome-debug
-- cd ./vscode-chrome-debug
-- npm install
-- npm run build

-- note: chrome has to be started with a remote debugging port
-- google-chrome-stable --remote-debugging-port=9222

local constants = require("lib.constants")
local dap = require("dap")

dap.adapters.chrome = {
  type = "executable",
  command = "node",
  args = { os.getenv("HOME") .. constants.vscode_chrome_debug },
}

dap.configurations.javascriptreact = { -- change this to javascript if needed
  {
    type = "chrome",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    port = 9222,
    webRoot = "${workspaceFolder}",
  },
}

dap.configurations.typescriptreact = { -- change to typescript if needed
  {
    type = "chrome",
    request = "attach",
    program = "${file}",
    cwd = vim.fn.getcwd(),
    sourceMaps = true,
    protocol = "inspector",
    port = 9222,
    webRoot = "${workspaceFolder}",
  },
}
