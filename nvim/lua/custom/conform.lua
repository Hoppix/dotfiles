local options = {
	lsp_fallback = true,

	formatters_by_ft = {
		lua = { "stylua" },

		javascript = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },

		sh = { "shfmt" },
		java = { "google-java-format" },

    	python = { "autopep8"},
    	go = {"gofumpt"}
	},
}

require("conform").setup(options)