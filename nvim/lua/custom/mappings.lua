---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    ["<leader>pv"] = {"<cmd> NvimTreeToggle <CR>", "toggle explore", opts = {}},
    ["<leader>bd"] = {"<cmd> %bd|e# <CR>", "close all other buffers", opts = {}},
    ["<leader>ww"] = {"<cmd> :wa <CR>", "write all buffers", opts = {}},
    ["<leader>qa"] = {"<cmd> :qa! <CR>", "close everything", opts = {}},
    ["<leader>xa"] = {"<cmd> :xa <CR>", "close everything and save", opts = {}},



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
      end,
      "Debug go test",
      opts = {},
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
    ["<leader>ü"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      "Toggle comment",
    },
  },
}

-- custom mappings
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
vim.keymap.set("n", "<C-d>", "<C-d>zz", {desc = "Center cursor after moving down half-page"})
vim.keymap.set("n", "<C-u>", "<C-u>zz", {desc = "Center cursor after moving up half-page"})


vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

    local opts = { buffer = ev.buf }
    vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
    vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
    vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
    vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
    vim.keymap.set('n', '<space>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, opts)
    vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
    vim.keymap.set('n', '<space>tt', vim.lsp.buf.rename, opts)
    vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
    vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    vim.keymap.set('n', '<space>f', function()
      vim.lsp.buf.format { async = true }
    end, opts)
  end,
})


return M
