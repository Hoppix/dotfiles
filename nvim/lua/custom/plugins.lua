---@type NvPluginSpec[]

local plugins = {

  -- Override plugin definition options
  {
    "kyazdani42/nvim-tree.lua",
    enabled = true,
  },

  {
    "nvim-tree/nvim-tree.lua",
    enabled = true,
  },


  {
    "neovim/nvim-lspconfig",
    config = function()
      local on_attach = require("plugins.configs.lspconfig").on_attach
      local capabilities = require("plugins.configs.lspconfig").capabilities
      local lsp_definitions = require("custom.lsp").lsp_definitions
      for _, lsp in ipairs(lsp_definitions) do
        require("lspconfig")[lsp].setup {
          on_attach = on_attach,
          capabilities = capabilities,
        }
      end
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = require("custom.lsp").mason_definitions,
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = require("custom.lsp").treesitter_definitions,
    },

  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    config = function()
      require "custom.conform"
    end,
  },

  {
    "NvChad/base46",
    lazy = false,
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },


  {
    "stevearc/overseer.nvim",
    config = function()
      require("overseer").setup()
    end,
    lazy = false,
  },


  {
    "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("custom.dap")
      require("core.utils").load_mappings("dap")
    end
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
    end
  },

  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = "mfussenegger/nvim-dap",
    config = function(_, opts)
      require("dap-go").setup(opts)
    end
  },

  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = {
      "mfussenegger/nvim-dap"
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end
  },
}

return plugins
