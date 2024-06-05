require("aerial").setup({
    -- optionally use on_attach to set keymaps when aerial has attached to a buffer
    layout = {
        min_width = 0.3,
        max_width = 0.3,
    },
    highlight_on_jump = 100,
    on_attach = function(bufnr)
        -- Jump forwards/backwards with '{' and '}'
        vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
        vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
    end,
})

vim.keymap.set("n", "<leader>q", "<cmd>AerialToggle!<CR>")
