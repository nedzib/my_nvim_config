require'nvim-treesitter.configs'.setup {
  ensure_installed = { "vimdoc", "javascript", "typescript", "c", "lua", "rust", "html", "ruby", "yaml" },

  sync_install = false,

  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}

