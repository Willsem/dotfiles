require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "cpp", "latex", "go", "lua", "python", "dockerfile"},
  highlight = {
    enable = true,
  },
}
