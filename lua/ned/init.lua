require("ned.set")
require("ned.remap")

local augroup = vim.api.nvim_create_augroup
local nedGroup = augroup('ned', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 500,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = nedGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

autocmd({"BufEnter"}, {
    group = nedGroup,
    pattern = '*.yml',
    command = 'setlocal syntax=yaml'
})

vim.cmd([[
  set clipboard=unnamedplus
  set encoding=UTF-8
]])

vim.g.clipboard = {
  name = 'xclip',
  copy = {
    ['+'] = 'xclip -selection clipboard',
    ['*'] = 'xclip -selection clipboard',
  },
  paste = {
    ['+'] = 'xclip -selection clipboard -o',
    ['*'] = 'xclip -selection clipboard -o',
  },
  cache_enabled = 0,
}
vim.g.blamer_enabled = true
vim.g.blamer_prefix = ' ::: '

vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})
vim.opt.cmdheight = 0

-- Remapeo para abrir Diffview, cambiar de ventana y ejecutar syncbind
vim.api.nvim_set_keymap('n', '<leader>df', ':DiffviewOpen<CR><C-W>w:syncbind<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dc', ':DiffviewClose<CR>', { noremap = true, silent = true })

vim.cmd[[
hi Pmenu guibg=NONE guifg=#fbf1c7
hi PmenuSel guibg=#44475A guifg=#fbf1c7
hi Visual guibg=#44475A guifg=#fbf1c7
hi Search guibg=#44475A guifg=#fbf1c7
hi IncSearch guibg=#44475A guifg=#fbf1c7
hi CursorLineNr guifg=#FABD2F
]]

vim.g.indentLine_char = '┊'
vim.g.rainbow_active = 1
