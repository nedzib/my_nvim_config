local lsp = require("lsp-zero")

lsp.preset("recommended")

lsp.ensure_installed({
    'rubocop',
    'ruby_lsp',
    'sorbet',
})

-- Configuración específica para sorbet
lsp.configure("sorbet", {
  cmd = { "bundle", "exec", "srb", "tc", "--lsp" },
  filetypes = { "ruby" },
  root_dir = function(fname)
    return require("lspconfig").util.find_git_ancestor(fname) or vim.fn.getcwd()
  end,
  on_attach = function(client, bufnr)
    -- Configuración adicional para cuando el servidor LSP se adjunte al buffer
  end,
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

local cmp = require('cmp')
local lspkind = require('lspkind')
local cmp_tailwind = require("tailwindcss-colorizer-cmp")
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

cmp.setup({
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
})

lsp.setup_nvim_cmp({
    mapping = cmp_mappings,
    preselect = cmp.PreselectMode.None,
    completion = { completeopt = "menu,menuone,noselect" },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered()
    },
    view = {
        entries = {
            name = "custom",
            selection_order = "near_cursor",
            follow_cursor = true,
        },
    },
    sources = cmp.config.sources({
        {
            name = "luasnip",
            group_index = 1,
            option = { use_show_condition = true },
            entry_filter = function()
                local context = require("cmp.config.context")
                return not context.in_treesitter_capture("string")
                and not context.in_syntax_group("String")
            end,
        },
        {
            name = "nvim_lsp",
            group_index = 2,
        },
        {
            name = "codeium",
            group_index = 2,
            option = { use_show_condition = true },
            entry_filter = function()
                return not vim.g.leetcode
            end,
        },
        {
            name = "nvim_lua",
            group_index = 3,
        },
        {
            name = "crates",
            group_index = 3,
        },
        {
            name = "treesitter",
            keyword_length = 4,
            group_index = 4,
        },
        {
            name = "path",
            keyword_length = 4,
            group_index = 4,
        },
        {
            name = "buffer",
            keyword_length = 3,
            group_index = 5,
            option = {
                get_bufnrs = function()
                    local bufs = {}
                    for _, win in ipairs(vim.api.nvim_list_wins()) do
                        bufs[vim.api.nvim_win_get_buf(win)] = true
                    end
                    return vim.tbl_keys(bufs)
                end,
            },
        },
        {
            name = "emoji",
            keyword_length = 2,
            group_index = 6,
        },
        {
            name = "nerdfont",
            keyword_length = 2,
            group_index = 6,
        },
        {
            name = "lazydev",
            group_index = 0,
        },
    }),
    formatting = {
        format = lspkind.cmp_format({
            mode = "symbol_text",
            ellipsis_char = "...",
            before = function(entry, vim_item)
                cmp_tailwind.formatter(entry, vim_item)
                return vim_item
            end,
            menu = source_mapping,
        }),
    },
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
  vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
  vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
  vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
  vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
  vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.setup()

vim.diagnostic.config({
    virtual_text = true
})

vim.api.nvim_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })

