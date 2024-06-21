-- Default options
vim.g.gruvbox_baby_telescope_theme = 1
vim.g.gruvbox_baby_transparent_mode = 1

vim.cmd[[
hi Pmenu guibg=#3c3836 guifg=#fbf1c7
hi PmenuSel guibg=#44475A guifg=#fbf1c7
hi Visual guibg=#44475A guifg=#fbf1c7
hi Search guibg=#44475A guifg=#fbf1c7
hi IncSearch guibg=#44475A guifg=#fbf1c7
]]

vim.cmd('colorscheme gruvbox-baby')

vim.g.gruvbox_baby_highlights = {
    CursorLineNr = {fg = "#FABD2F", bg = "NONE", style="underline"}
}

