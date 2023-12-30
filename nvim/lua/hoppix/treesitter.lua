require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = {"lua", "vim", "vimdoc", "query", "c", "python", "javascript", "typescript", "java", "go", "rust" },


  auto_install = true,
  sync_install = false,


  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
    },
}

