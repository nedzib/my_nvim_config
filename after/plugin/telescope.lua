local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
vim.api.nvim_set_keymap('n', '<leader>fg', '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>', { noremap = true, silent = true })


require('telescope').setup {
    defaults = {
        borderchars = {
            prompt = {'─', '│',  '─', '│', '╭', '╮', '╯', '╰'},
            results = {'─', '│',  '─', '│', '╭', '╮', '╯', '╰'},
            preview = {'─', '│',  '─', '│', '╭', '╮', '╯', '╰'}
        },
        color_devicons = true,
        prompt_prefix = " ",
        selection_caret = "󱝂 ",
    },
}

