---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>pv"] = {"<cmd> Ex <CR>", "toggle explore", opts = {}},


    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
    },

    -- tmux-vim binds
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft <CR>", "window left", opts = {} },
    ["<C-l"] = { "<cmd> TmuxNavigateRight <CR>", "window right", opts = {} },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown <CR>", "window down", opts = {} },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp <CR>", "window up", opts = {} },
  },
  v = {
    [">"] = { ">gv", "indent" },
  },
}

M.dap = {
  plugin = true,

  n = {
    ["<leader>db"] = { "<cmd> DapToggleBreakpoint <CR>", "toggle breakpoint", opts = {} },
    ["<leader>drp"] = {
      function()
        require("dap-python").test_method()
      end,
      "debug run python",
      opts = {},
    },
    ["<leader>drt"] = {
      "<cmd> DapContinue <CR>",
      "Run or continue javascript debugger",
      opts = {},
    },
    ["<leader>dui"] = {
      function()
        require("dapui").toggle()
      end,
      "Toggle debug ui",
      opts = {}
    },
    ["<leader>drg"] = {
      function()
        require("dap-go").debug_test()
      end
    }
  },
}

M.comment = {
  plugin = true,

  -- toggle comment in both modes
  n = {
    ["<leader>ü"] = {
      function()
        require("Comment.api").toggle.linewise.current()
      end,
      "Toggle comment",
    },
  },

  v = {
    ["<leader>/"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}



return M
