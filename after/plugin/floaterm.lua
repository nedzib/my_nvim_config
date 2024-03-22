
vim.g.floaterm_width = 0.4
vim.g.floaterm_height = 0.989
vim.g.floaterm_position = 'topright'
vim.g.floaterm_borderchars = '═║═║╔╗╝╚'
vim.g.floaterm_titleposition = 'right'
vim.g.floaterm_title = '━ 󰆍 $1/$2 ━'

vim.api.nvim_set_keymap('n', '<leader>fv', ':lua floaterm_update(0.4, 0.989, "topright")<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fh', ':lua floaterm_update(0.99, 0.4, "bottom")<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', {noremap = true})

function floaterm_update(width, height, position)
    local cmd = string.format(":FloatermUpdate --width=%f --height=%f --position=%s", width, height, position)
    vim.cmd(cmd)
    vim.g.floaterm_width = width
    vim.g.floaterm_height = height
    vim.g.floaterm_position = position
end

