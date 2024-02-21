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
        "autopep8",
        "typescript-language-server",
        "js-debug-adapter",
        "java-language-server",
        "java-debug-adapter",
        "terraform-ls",
        "bash-language-server",
}

M.lsp_definitions = {
    "gopls",
    "pyright",
    "terraformls",
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
}

return M