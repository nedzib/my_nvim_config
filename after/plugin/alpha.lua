vim.g.startup_bookmarks = {
  ["Q"] = '~/.config/qtile/config.py',
  ["I"] = '~/.config/nvim/init.lua',
  ["F"] = '~/.config/fish/config.fish',
  ["K"] = '~/.config/kitty/kitty.conf',
  ["A"] = '~/.config/alacritty/alacritty.yml',
}

local alpha = require("alpha")
local dashboard = require("alpha.themes.startify")

-- Set header
dashboard.section.header.val = {
    "                   /)                          /)           /)",
    "          /\\___/\\ ((      D\\___/\\     /\\___/\\ ((   /\\___/\\ ((",
    "          \\`@_@'/  ))     (0_o)       \\`@_@'/  ))  \\`@_@'/  ))",
    "          {_:Y:.}_//       (V)        {_:Y:.}_//   {_:Y:.}_//",
    "----------{_}^-'{_}----oOo--U--oOo----{_}^-'{_}----{_}^-'{_}---------",
    "__|_______|___N___|___E___|___O___|___V___|___I___|___M___|_______|__"
}



dashboard.section.header.opts = {
    position = "center",
}

vim.cmd([[
    autocmd FileType alpha setlocal nofoldenable
]])
