local dap = require "dap"

-- Python
dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Launch current file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}

-- Go
dap.configurations.go = {
  {
    type = "go",
    request = "launch",
    name = "Launch current file",
    program = "${file}",
    cwd = "${workspaceFolder}",
  },
}

-- Kotlin
dap.adapters.kotlin = {
  type = "executable",
  command = vim.fn.stdpath("data") .. "/mason/bin/kotlin-debug-adapter",
}

dap.configurations.kotlin = {
  {
    type = "kotlin",
    request = "launch",
    name = "Launch Kotlin (main class)",
    projectRoot = "${workspaceFolder}",
    mainClass = function()
      return vim.fn.input("Main class (e.g. com.example.MainKt): ")
    end,
  },
  {
    type = "kotlin",
    request = "attach",
    name = "Attach to Kotlin process",
    hostName = "localhost",
    port = 5005,
    timeout = 10000,
  },
}

-- Load optional project-local DAP config if present
local function load_dap_config()
  local project_dap_config = vim.fn.getcwd() .. "/.vscode/dap_config.lua"
  if vim.fn.filereadable(project_dap_config) == 1 then
    dofile(project_dap_config)
    vim.notify("Loaded project .vscode/dap_config.lua", vim.log.levels.DEBUG)
  end
end

load_dap_config()
