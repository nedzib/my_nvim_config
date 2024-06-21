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
