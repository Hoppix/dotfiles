---@type ChadrcConfig
local M = {}

M.ui = { 
    theme = 'tokyonight',
    theme_toggle = { "tokyonight", "one_light" },
}


M.plugins = "custom.plugins"
M.mappings = require("custom.mappings")


M.ui.transparency = false

M.ui.nvdash = {
    load_on_startup = true,

    header = {
        "        H O P P I X     ",
    },

    buttons = {
      { "  Find File", "Spc f f", "Telescope find_files" },
      { "󰈚  Recent Files", "Spc f o", "Telescope oldfiles" },
      { "󰈭  Find Word", "Spc f w", "Telescope live_grep" },
      { "  Bookmarks", "Spc m a", "Telescope marks" },
      { "  Themes", "Spc t h", "Telescope themes" },
      { "  Mappings", "Spc c h", "NvCheatsheet" },
    },
}
return M
