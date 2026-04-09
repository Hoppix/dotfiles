local nvlsp = require("nvchad.configs.lspconfig")
nvlsp.defaults()

local on_attach = nvlsp.on_attach
local capabilities = nvlsp.capabilities

-- Enable a broad set of language servers; those not installed will be skipped gracefully
local servers = {
	"html",
	"cssls",
	"lua_ls",
	"pyright",
	"gopls",
	"terraformls",
	"bashls",
	"jsonls",
	"yamlls",
	"jdtls",
}

local lspconfig = require "lspconfig"
for _, name in ipairs(servers) do
	if lspconfig[name] and lspconfig[name].setup then
		lspconfig[name].setup {
			on_attach = on_attach,
			capabilities = capabilities,
		}
	end
end

-- read :h vim.lsp.config for changing options of lsp servers 

-- Kotlin LSP (JetBrains kotlin-lsp, installed via brew)
-- See: https://github.com/Kotlin/kotlin-lsp/blob/main/scripts/neovim.md
-- Register as custom server since this nvim-lspconfig version doesn't include it yet.
local configs = require "lspconfig.configs"
if not configs.kotlin_lsp then
	configs.kotlin_lsp = {
		default_config = {
			cmd = { "kotlin-lsp", "--stdio" },
			filetypes = { "kotlin" },
			root_dir = require("lspconfig.util").root_pattern(
				"settings.gradle",
				"settings.gradle.kts",
				"build.gradle",
				"build.gradle.kts",
				"pom.xml"
			),
			single_file_support = false,
		},
	}
end
lspconfig.kotlin_lsp.setup {
	on_attach = on_attach,
	capabilities = capabilities,
}
