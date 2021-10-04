require('nvim-treesitter.configs').setup {
  ensure_installed = {"c", "cpp", "go", "lua", "python", "dockerfile"},
  highlight = {
    enable = true,
  },
}
