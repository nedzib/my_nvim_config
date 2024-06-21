vim.cmd[[hi SignColumn guibg=NONE]]
vim.g.signify_sign_add = "|"
vim.g.signify_sign_delete = "-"
vim.g.signify_sign_change = "~"
vim.cmd[[
highlight SignifySignAdd    ctermfg=green  guifg=#00ff00 cterm=NONE gui=NONE
highlight SignifySignDelete ctermfg=red    guifg=#ff0000 cterm=NONE gui=NONE
highlight SignifySignChange ctermfg=yellow guifg=#ffff00 cterm=NONE gui=NONE
]]
