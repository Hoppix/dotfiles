local dap = require "dap"
local dapgo = require "dap-go"

dap.adapters["pwa-node"] = {
  type = "server",
  host = "127.0.0.1",
  port = 8123,
  executable = {
    command = "js-debug-adapter",
  },
}

for _, language in ipairs { "typescript", "javascript" } do
  dap.configurations[language] = {
    {
      type = "pwa-node",
      request = "launch",
      name = "Launch current file",
      program = "${file}",
      cwd = "${workspaceFolder}",
      runtimeExecutable = "node",
    },
  }
end

dap.configurations.python = {
  type = "python",
  request = "launch",
  name = "Launch current file",
  program = "${file}",
  cwd = "${workspaceFolder}",
}

dap.configurations.go = {
  type = "go",
  request = "launch",
  name = "Launch current file",
  program = "${file}",
  cwd = "${workspaceFolder}",
}


-- Function to load the local DAP configuration
local function load_dap_config()
  local project_dap_config = vim.fn.getcwd() .. "/.vscode/dap_config.lua"
  if vim.fn.filereadable(project_dap_config) == 1 then
    dofile(project_dap_config)
    print("Found dap config in project dir")
  end
end

-- Call the function to load the local config
load_dap_config()
