local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

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
        mappings = {
            i = {
                ["<esc>"] = actions.close
            },
        },
        color_devicons = true,
        prompt_prefix = " ",
        selection_caret = "> ",
    },
}

-- Función personalizada para buscar archivos no rastreados y modificados
_G.search_untracked_and_modified_files = function()
  builtin.find_files {
    prompt_title = "Untracked and Modified Files",
    find_command = {'sh', '-c', 'git ls-files --others --exclude-standard --modified'},
    attach_mappings = function(prompt_bufnr, map)
      actions.select_default:replace(function()
        actions.close(prompt_bufnr)
        local selection = action_state.get_selected_entry()
        vim.cmd('edit ' .. selection.value)
      end)
      return true
    end
  }
end

require('telescope').load_extension('bookmarks')

vim.api.nvim_set_keymap('n', '<leader>ug', "<cmd>lua search_untracked_and_modified_files()<CR>", { noremap = true, silent = true })
