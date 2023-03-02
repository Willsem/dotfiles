require("bufferline").setup({
  options = {
    diagnostics = "nvim_lsp",
  },
  highlights = require("catppuccin.groups.integrations.bufferline").get(),
})
