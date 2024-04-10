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

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

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

require('lualine').setup()

vim.api.nvim_set_keymap('n', ':', '<cmd>FineCmdline<CR>', {noremap = true})

require('fine-cmdline').setup({
  popup = {
    position = {
      row = '50%',
      col = '50%',
    },
  },
})

-- Remapeo para abrir Diffview, cambiar de ventana y ejecutar syncbind
vim.api.nvim_set_keymap('n', '<leader>df', ':DiffviewOpen<CR><C-W>w:syncbind<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>dc', ':DiffviewClose<CR>', { noremap = true, silent = true })

