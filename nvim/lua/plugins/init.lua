return {
  -- Comment toggling
  { "numToStr/Comment.nvim", lazy = false, opts = {} },

  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  -- Mason core setup + manual ensure install via registry (stable and simple)
  {
    "williamboman/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
      local mr = require "mason-registry"
      local ensure = {
        -- LSP servers & tools (Mason package names)
        "lua-language-server",
        "pyright",
        "gopls",
        "terraform-ls",
        "bash-language-server",
        "json-lsp",
        "yaml-language-server",
        "html-lsp",
        "css-lsp",
        "jdtls",
        -- Formatters/linters
        "stylua",
        "prettier",
        "shfmt",
        "google-java-format",
        "ruff",
        "gofumpt",
        "golines",
        "goimports",
        -- Debuggers for current stack
        "delve",
        "debugpy",
        "kotlin-debug-adapter",
      }

      local function install_all()
        for _, name in ipairs(ensure) do
          local ok, pkg = pcall(mr.get_package, name)
          if ok and not pkg:is_installed() then
            pkg:install()
          end
        end
      end

      if mr.refresh then
        mr.refresh(install_all)
      else
        install_all()
      end
    end,
  },

  -- File explorer
  { "nvim-tree/nvim-tree.lua", opts = {} },

  -- Tmux navigation
  { "christoomey/vim-tmux-navigator", lazy = false },

  -- Overseer task runner
  { "stevearc/overseer.nvim", config = function() require("overseer").setup() end },

  -- Treesitter languages
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "vimdoc",
        "lua",
        "html",
        "css",
        "javascript",
        "typescript",
        "json",
        "yaml",
        "bash",
        "python",
        "go",
        "terraform",
        "java",
        "kotlin",
        "rust",
      },
    },
  },

  -- DAP core and UI
  { "mfussenegger/nvim-dap", config = function() require "configs.dap" end },
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
      dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
      dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
    end,
  },

  -- DAP language helpers
  { "leoluz/nvim-dap-go", ft = "go", dependencies = "mfussenegger/nvim-dap", config = function(_, opts) require("dap-go").setup(opts) end },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = { "mfussenegger/nvim-dap", "rcarriga/nvim-dap-ui" },
    config = function(_, opts)
      local path = vim.fn.stdpath("data") .. "/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("dap-python").test_runner = "pytest"
    end,
  },
}
