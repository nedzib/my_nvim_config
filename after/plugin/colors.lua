-- Default options
local dracula = require("dracula")
dracula.setup({
  show_end_of_buffer = true, -- default false
  transparent_bg = true, -- default false
  italic_comment = true, -- default false
  overrides = {},
})

-- setup must be called before loading
vim.cmd('colorscheme dracula')

vim.cmd[[
hi Pmenu guibg=#3c3836 guifg=#fbf1c7
hi PmenuSel guibg=#44475A guifg=#fbf1c7
]]


vim.cmd [[
highlight Visual guibg=#44475A guifg=#fbf1c7
highlight Search guibg=#44475A guifg=#fbf1c7
highlight IncSearch guibg=#44475A guifg=#fbf1c7
]]

