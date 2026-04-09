require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Paste in visual mode without overwriting the register
map("x", "p", [["_dP]], { desc = "Paste without clearing register" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Explorer toggle (use nvim-tree if present, fallback to Oil/Ex)
map("n", "<leader>pv", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle explorer" })

-- Buffer management
map("n", "<leader>bd", "<cmd>%bd|e#<CR>", { desc = "Close all other buffers" })
map("n", "<leader>ba", "<cmd>%bd<CR>", { desc = "Close all buffers" })
map("n", "<leader>bc", "<cmd>bd<CR>", { desc = "Close current buffer" })
map("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Prev buffer" })
map({ "n", "i", "v" }, "<C-s>", "<cmd>w<cr>", { desc = "Save file" })
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Write file" })
map("n", "<leader>bw", "<cmd>wa<CR>", { desc = "Write all buffers" })
map("n", "<leader>qa", "<cmd>qa!<CR>", { desc = "Quit all (force)" })
map("n", "<leader>xa", "<cmd>xa<CR>", { desc = "Save and quit all" })

-- Centering after half-page jumps
map("n", "<C-d>", "<C-d>zz", { desc = "Half-page down centered" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half-page up centered" })

-- Diagnostics helpers
map("n", "<space>e", vim.diagnostic.open_float, { desc = "Line diagnostics" })
map("n", "[d", vim.diagnostic.goto_prev, { desc = "Prev diagnostic" })
map("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
map("n", "<space>q", vim.diagnostic.setloclist, { desc = "Diagnostics to loclist" })

-- LSP on-attach keymaps (Neovim 0.10+)
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf }
		vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

		map("n", "gD", vim.lsp.buf.declaration, opts)
		map("n", "gd", vim.lsp.buf.definition, opts)
		map("n", "K", vim.lsp.buf.hover, opts)
		map("n", "gi", vim.lsp.buf.implementation, opts)
		map("n", "<C-k>", vim.lsp.buf.signature_help, opts)
		map("n", "<space>wa", vim.lsp.buf.add_workspace_folder, opts)
		map("n", "<space>wr", vim.lsp.buf.remove_workspace_folder, opts)
		map("n", "<space>wl", function()
			print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
		end, opts)
		map("n", "<space>D", vim.lsp.buf.type_definition, opts)
		map("n", "<space>tt", vim.lsp.buf.rename, opts)
		map({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, opts)
		map("n", "gr", vim.lsp.buf.references, opts)
		map("n", "<space>f", function()
			vim.lsp.buf.format { async = true }
		end, opts)
	end,
})

-- Comment toggles (requires numToStr/Comment.nvim which NVChad includes)
map("n", "<leader>ü", function()
	local ok, api = pcall(require, "Comment.api")
	if not ok then
		vim.notify("Comment.nvim not available", vim.log.levels.WARN)
		return
	end
	api.toggle.linewise.current()
end, { desc = "Toggle comment" })
map("v", "<leader>ü", function()
	local ok, api = pcall(require, "Comment.api")
	if not ok then
		vim.notify("Comment.nvim not available", vim.log.levels.WARN)
		return
	end
	-- exit visual, then toggle based on previous selection
	local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)
	vim.api.nvim_feedkeys(esc, "nx", false)
	api.toggle.linewise(vim.fn.visualmode())
end, { desc = "Toggle comment" })

-- Tmux navigation (christoomey/vim-tmux-navigator)
map("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { desc = "Window left" })
map("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { desc = "Window right" })
map("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { desc = "Window down" })
map("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { desc = "Window up" })

-- DAP helpers (optional, active if nvim-dap installed)
map("n", "<leader>db", "<cmd>DapToggleBreakpoint<CR>", { desc = "DAP toggle breakpoint" })
map("n", "<leader>drt", "<cmd>DapContinue<CR>", { desc = "DAP continue/run" })
map("n", "<leader>dui", function()
	require("dapui").toggle()
end, { desc = "DAP UI" })

-- DAP language helpers (safe pcall wrappers)
pcall(function()
	map("n", "<leader>drp", function()
		require("dap-python").test_method()
	end, { desc = "DAP: run Python test method" })
end)

pcall(function()
	map("n", "<leader>drg", function()
		require("dap-go").debug_test()
	end, { desc = "DAP: debug Go test" })
end)

map("n", "<leader>drk", function()
	require("dap").continue()
end, { desc = "DAP: run Kotlin debug" })

-- Theme toggle (NVChad base46)
pcall(function()
	map("n", "<leader>ut", function()
		require("base46").toggle_theme()
	end, { desc = "Toggle theme light/dark" })
end)

-- Formatting and imports
map("n", "<leader>fm", function()
	require("conform").format()
end, { desc = "Format with Conform" })
map("n", "<leader>fi", function()
	local params = {
		context = { only = { "source.organizeImports" } },
		range = nil,
	}
	local bufnr = vim.api.nvim_get_current_buf()
	local clients = vim.lsp.get_clients({ bufnr = bufnr })
	for _, client in ipairs(clients) do
		if client.supports_method("textDocument/codeAction") then
			vim.lsp.buf.code_action(params)
			return
		end
	end
	vim.notify("No LSP supports organizeImports here", vim.log.levels.INFO)
end, { desc = "Organize imports via LSP" })

-- Git helpers (gitsigns)
map("n", "<leader>gb", function()
	local ok, gs = pcall(require, "gitsigns")
	if not ok then
		vim.notify("gitsigns not available", vim.log.levels.WARN)
		return
	end
	gs.blame_line { full = true }
end, { desc = "Git blame current line" })

map("n", "<leader>gB", function()
	local ok, gs = pcall(require, "gitsigns")
	if not ok then
		vim.notify("gitsigns not available", vim.log.levels.WARN)
		return
	end
	gs.toggle_current_line_blame()
end, { desc = "Toggle inline blame" })
