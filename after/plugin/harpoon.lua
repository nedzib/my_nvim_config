local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

require("harpoon").setup({
    menu = {
        width = 70, -- Adjust this value based on your preferences
    }
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "harpoon",
    callback = function()
        vim.opt_local.wrap = true
    end,
})

