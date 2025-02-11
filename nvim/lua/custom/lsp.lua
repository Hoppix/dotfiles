local M = {}

M.mason_definitions = {
        "stylua",
        "prettier",
        "gopls",
        "gofumpt",
        "golines",
        "goimports",
        "delve",
        "pyright",
        "debugpy",
        "ruff",
        "typescript-language-server",
        "js-debug-adapter",
        "jdtls",
        "java-debug-adapter",
        "terraform-ls",
        "bash-language-server",
}

M.lsp_definitions = {
    "gopls",
    "pyright",
    "terraformls",
    "jdtls",
}

M.treesitter_definitions = {
        "html",
        "css",
        "bash",
        "java",
        "javascript",
        "python",
        "go",
        "yaml",
        "json",
        "lua",
        "typescript",
        "terraform",
        "rust",
}

return M
