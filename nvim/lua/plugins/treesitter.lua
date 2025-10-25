return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'windwp/nvim-ts-autotag',
  },

  config = function()
    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.brief = {
      install_info = {
        url = 'ssh://git@stash.msk.avito.ru:7999/~ddfomin/tree-sitter-brief.git', -- local path or git repo
        files = { 'src/parser.c' },
      },
      filetype = 'brief',
    }

    vim.treesitter.language.register('brief', 'brief') -- use parser "brief" (second argument) for "brief" (first argument) filetype
    require('nvim-treesitter.configs').setup({
      ensure_installed = { 'lua', 'go', 'javascript', 'typescript', 'tsx', 'brief' },
      sync_install = false,
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },
      context_commentstring = {
        enable = true,
        enable_autocmd = false,
      },
      rainbow = {
        enable = true,
        disable = { 'html' },
        extended_mode = false,
        max_file_lines = nil,
      },
      autotag = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
      },
      indent = {
        enable = false,
      },
    })
  end,
}
